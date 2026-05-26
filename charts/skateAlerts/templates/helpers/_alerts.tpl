{{/*
SKATE_DB_HOST
*/}}
{{- define "skate-alerts.db-host" -}}
    {{ required "DB Host is Required!" .Values.deployment.env.DB_HOST }}
{{- end }}

{{/*
SKATE_DB_PORT
*/}}
{{- define "skate-alerts.db-port" -}}
    {{ required "DB Port is Required!" .Values.deployment.env.DB_PORT }}
{{- end }}

{{/*
SKATE_ALERTS_PORT
*/}}
{{- define "skate-alerts.port" -}}
    {{ default "5000" .Values.deployment.env.PORT }}
{{- end }}

{{/*
SKATE_DB_NAME
*/}}
{{- define "skate-alerts.db-name" -}}
    {{ required "DB Name is Required!" .Values.deployment.env.DB_NAME }}
{{- end }}

{{/*
SKATE_DB_SCHEMA
*/}}
{{- define "skate-alerts.db-schema" -}}
    {{ required "DB Schema is Required!" .Values.deployment.env.DB_SCHEMA }}
{{- end }}

{{/*
SKATE_DB_USERNAME
*/}}
{{- define "skate-alerts.db-username" -}}
    {{ required "DB Username is Required!" .Values.deployment.env.DB_USER_NAME }}
{{- end }}

{{/*
SKATE_DB_PGSSL_MODE
*/}}
{{- define "skate-alerts.db-pg-ssl-mode" -}}
    {{ default "no-verify" .Values.deployment.env.PGSSLMODE }}
{{- end }}

{{/*
SKATE_ALERTS_DOCKER_IMAGE
*/}}
{{- define "skate-alerts.image" -}}
    {{ required "deployment.image is required! Please provide your container registry image URL." .Values.deployment.image }}
{{- end }}

{{/*
SKATE_ALERTS_CRON_IMAGE
*/}}
{{- define "skate-alerts.cron-image" -}}
    {{ required "deployment.cronImage is required! Please provide your container registry cron image URL." .Values.deployment.cronImage }}
{{- end }}

{{/*
SKATE_ALERTS_BUSYBOX_IMAGE
*/}}
{{- define "skate-alerts.busybox-image" -}}
    {{ required "deployment.busyboxImage is required! Please provide your container registry busybox image URL." .Values.deployment.busyboxImage }}
{{- end }}

{{/*
SKATE_ALERTS_RESOURCES
*/}}
{{- define "skate-alerts.resources" -}}
          requests:
            cpu: {{ default "300m" .Values.deployment.resources.requests.cpu }}
            memory: {{ default "300M" .Values.deployment.resources.requests.memory }}
          limits:
             cpu: {{ default "300m" .Values.deployment.resources.limits.cpu }}
             memory: {{ default "300M" .Values.deployment.resources.limits.memory  }}
{{- end }}

{{/*
SKATE_ALERTS_REPLICAS
*/}}
{{- define "skate-alerts.replicas" -}}
    {{ default "1" .Values.deployment.replicas }}
{{- end }}

{{/*
SKATE_ALERTS_CLUSTER_NAME
*/}}
{{- define "skate-alerts.cluster-name" -}}
    {{ default "skate-runtime-cluster" .Values.deployment.env.CLUSTER_NAME }}
{{- end }}

{{/*
SKATE_ALERTS_CLUSTER_NAME
*/}}
{{- define "skate-alerts.crypto-key" -}}
    {{ default "N2JlMGI0MTAxNmM3NGMxNWI0NWJmMWY4NTNmZWViZTU=" .Values.deployment.env.CRYPTO_KEY }}
{{- end }}


{{/*
SKATE_ALERTS_FRONTEND_NAME
*/}}
{{- define