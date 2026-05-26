# Console Runtime Init Helm Chart

Umbrella Helm chart for Skate Runtime cluster deployment.

## Prerequisites

- Kubernetes cluster (1.25+)
- Helm 3.x installed

## Installation

```bash
helm upgrade --install console-monitoring console-runtime-init -n monitoring --create-namespace
```

## Important Notes

### ClickHouse CRDs

> **IMPORTANT**: The ClickHouse CRDs have been copied to the root `crds/` directory of this chart.
>
> **Why?** Helm does not automatically install CRDs from sub-charts (nested dependencies). The SigNoz chart depends on ClickHouse, which uses the ClickHouse Operator and requires these CRDs to be installed before the operator can create ClickHouse instances.
>
> Without these CRDs in the root chart, the ClickHouse Operator cannot create `ClickHouseInstallation` resources, causing the signoz-schema-migrator to fail with DNS resolution errors (`wget: bad address 'console-monitoring-clickhouse:8123'`) as the ClickHouse service never gets created.
>
> By placing the CRDs in `console-runtime-init/crds/`, Helm automatically installs them during `helm install` or `helm upgrade --install`, ensuring a clean single-command deployment flow.

### CRD Updates

Helm has a limitation where CRDs are only installed once and never updated or deleted. If you need to update ClickHouse CRDs in the future, apply them manually:

```bash
kubectl apply -f console-runtime-init/crds/
```

### Related Issues

This is a known Helm limitation. For more context, see:

- [helm/helm#9538 - Umbrella chart/sub-chart CRDs not installed](https://github.com/helm/helm/issues/9538)
- [helm/helm#3632 - Dependency providing CRD, not installed first](https://github.com/helm/helm/issues/3632)
- [helm/helm#10784 - Helm update of a new chart dependency will not install its CRDs](https://github.com/helm/helm/issues/10784)
- [Helm CRD Best Practices](https://helm.sh/docs/chart_best_practices/custom_resource_definitions/)
- [Stack Overflow - How to ensure CRDs in subchart are stored before being used](https://stackoverflow.com/questions/72206337/how-to-ensure-that-crds-defined-in-a-helm-subchart-are-stored-before-being-used)

## Chart Dependencies

| Chart | Description |
|-------|-------------|
| observability-stack | SigNoz + k8s-infra for observability |
| ingress-nginx | NGINX Ingress Controller |
| external-secrets | External Secrets Operator |
| cert-manager | Certificate management |
| kube-state-metrics | Kubernetes metrics |

## Configuration

See `values.yaml` for all available configuration options.
