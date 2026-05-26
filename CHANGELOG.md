# Changelog

All notable changes to this chart will be documented in this file.

## [Unreleased]

### Added

- **ClickHouse CRDs**: Added ClickHouse Operator CRDs to `templates/crds/` directory as pre-install/pre-upgrade hooks with conditional creation using Helm `lookup` function.
  - `clickhouseinstallations.clickhouse.altinity.com`
  - `clickhouseinstallationtemplates.clickhouse.altinity.com`
  - `clickhouseoperatorconfigurations.clickhouse.altinity.com`
  - CRDs are created as hooks (weight -20) to ensure they exist before any other resources
  - CRDs are only created if they don't already exist in the cluster (supports both fresh install and upgrade scenarios)
  - Uses `helm.sh/resource-policy: keep` to prevent CRD deletion on helm uninstall

- **Observability Stack**: Added new observability-stack sub-chart with:
  - SignOZ for distributed tracing, metrics, and logs
  - ClickHouse as the storage backend
  - k8s-infra for Kubernetes infrastructure monitoring

### Changed

- **CRD Management**: Moved CRDs from `crds/` to `templates/crds/` as pre-install/pre-upgrade hooks with conditional `lookup` to handle both install and upgrade scenarios.
  - Helm's `crds/` directory only installs on first install, not on upgrades
  - CRDs are hooks with weight -20 to run before all other hooks (SignOZ CHI hook runs at post-install/post-upgrade with weight 5)

- **Schema Migrator**: Disabled `upgradeHelmHooks` for SignOZ schema-migrator to avoid chicken-and-egg problem where:
  - Schema-migrator (pre-upgrade hook) needs ClickHouse to be running
  - ClickHouse needs the operator to be deployed
  - Operator is part of main release which waits for hooks to complete
  - Schema-migrator now runs as a regular Job after the main release is deployed

### Removed

- **Filebeat**: Removed filebeat chart (replaced by SignOZ log collection)
- **Metricbeat**: Removed metricbeat chart (replaced by SignOZ/k8s-infra)
- **Prometheus**: Removed prometheus chart (replaced by SignOZ metrics)

### Fixed

- Fixed deployment failure where signoz-schema-migrator would fail with `wget: bad address 'console-monitoring-clickhouse:8123'` due to ClickHouse CRDs not being installed from the nested signoz sub-chart.

- Fixed `helm upgrade` failure with "CRD already exists" error by using Helm `lookup` function to conditionally create CRDs only when they don't exist.

- Fixed hook dependency deadlock where pre-upgrade hooks would wait indefinitely for ClickHouse which couldn't be deployed until hooks completed.

## Upgrade Instructions

### Upgrading from Master (or any version without SignOZ)

Single command handles everything automatically:

```bash
helm upgrade --install console-monitoring ./console-runtime-init/ \
  -f ./console-runtime-init/values.yaml \
  -n monitoring \
  --timeout 15m
```

**No manual steps required.** The chart automatically:
1. Creates ClickHouse CRDs (if not present)
2. Deploys ClickHouse operator and cluster
3. Runs schema migrations after ClickHouse is ready
4. Deploys SignOZ and all observability components

### Fresh Install

Same command as upgrade:

```bash
helm upgrade --install console-monitoring ./console-runtime-init/ \
  -f ./console-runtime-init/values.yaml \
  -n monitoring \
  --create-namespace \
  --timeout 15m
```

### References

This fix addresses known Helm limitations:

- [helm/helm#9538 - Umbrella chart/sub-chart CRDs not installed](https://github.com/helm/helm/issues/9538)
- [helm/helm#3632 - Dependency providing CRD, not installed first](https://github.com/helm/helm/issues/3632)
- [helm/helm#10784 - Helm update of a new chart dependency will not install its CRDs](https://github.com/helm/helm/issues/10784)
- [helm/helm#10585 - Managing CRDs & chart dependencies](https://github.com/helm/helm/issues/10585)
