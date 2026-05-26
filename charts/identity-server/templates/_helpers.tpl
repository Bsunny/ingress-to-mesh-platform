{{/*
Expand the name of the chart.
*/}}
{{- define "identity-server.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "identity-server.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "identity-server.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "identity-server.labels" -}}
helm.sh/chart: {{ include "identity-server.chart" . }}
{{ include "identity-server.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "identity-server.selectorLabels" -}}
app.kubernetes.io/name: {{ include "identity-server.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "identity-server.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "identity-server.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
IDS_IMAGE
*/}}
{{- define "identity-server.image" -}}
    {{ required "deployment.image is required! Please provide your container registry image URL." .Values.deployment.image }}
{{- end }}

{{/*
IDS_CONFIG_MAP
*/}}
{{- define "identity-server.configmap" -}}
    {{ default "identity-server-configmap" }}
{{- end }}

{{/*
IDS_CONFIG_MAP
*/}}
{{- define "identity-server.secrets" -}}
    {{ default "identity-server-secrets" }}
{{- end }}

{{/*
IDS_IMAGE_PULL_SECRETS
*/}}
{{- define "identity-server.imagePullSecrets" -}}
{{- printf "{\"auths\":{\"%s\":{\"username\":\"%s\",\"password\":\"%s\",\"auth\":\"%s\"}}}" (include "identity-server.docker-host" .)  ((include "identity-server.docker-username" .) | b64dec)  ((include "identity-server.docker-password" .) | b64dec) (printf "%s:%s" ((include "identity-server.docker-username" .) | b64dec) ((include "identity-server.docker-password" .) | b64dec) | b64enc ) | b64enc }}
{{- end }}

{{/*
IDS_DOCKER_HOST
*/}}
{{- define "identity-server.docker-host" -}}
    {{ required "deployment.dockerHost is required! Please provide your container registry host." .Values.deployment.dockerHost }}
{{- end }}

{{/*
IDS_DOCKER_USERNAME
*/}}
{{- define "identity-server.docker-username" -}}
    {{ required "deployment.dockerUsername is required! Please provide your Base64-encoded registry username." .Values.deployment.dockerUsername }}
{{- end }}


{{/*
IDS_DOCKER_PASSWORD
*/}}
{{- define "identity-server.docker-password" -}}
    {{ required "deployment.dockerPassword is required! Please provide your Base64-encoded registry password." .Values.deployment.dockerPassword }}
{{- end }}


{{/*
IDS_DB_HOST
*/}}
{{- define "identity-server.db-host" -}}
    {{ default (printf "skate-postgresql.%s.svc.cluster.local" .Release.Namespace) .Values.deployment.env.DB_HOST }}
{{- end }}

{{/*
IDS_DB_PASSWORD
*/}}
{{- define "identity-server.db-password" -}}
    {{ required "deployment.env.DB_PASSWORD is required! Please provide your Base64-encoded database password." .Values.deployment.env.DB_PASSWORD }}
{{- end }}

{{/*
IDS_DB_PORT
*/}}
{{- define "identity-server.db-port" -}}
    {{ default "5432" .Values.deployment.env.DB_PORT }}
{{- end }}

{{/*
IDS_DB_NAME
*/}}
{{- define "identity-server.db-name" -}}
    {{ default "identity_server" .Values.deployment.env.DB_NAME }}
{{- end }}

{{/*
IDS_SCHEMA
*/}}
{{- define "identity-server.db-schema" -}}
    {{ default "identity_server_schema" .Values.deployment.env.SCHEMA }}
{{- end }}

{{/*
IDS_DB_USERNAME
*/}}
{{- define "identity-server.db-username" -}}
    {{ default "identity_server_admin" .Values.deployment.env.DB_USERNAME }}
{{- end }}

{{/*
IDS_DB_SSLMODE
*/}}
{{- define "identity-server.db-pg-ssl-mode" -}}
    {{ default "disable" .Values.deployment.env.PGSSLMODE }}
{{- end }}

{{/*
IDS_PORT
*/}}
{{- define "identity-server.port" -}}
    {{ default "3005" .Values.deployment.env.PORT }}
{{- end }}

{{/*
IDS_ISSUER
*/}}
{{- define "identity-server.issuer" -}}
    {{ default "" .Values.deployment.env.ISSUER }}
{{- end }}

{{/*
IDS_HOST
*/}}
{{- define "identity-server.ids-host" -}}
    {{ default "" .Values.deployment.env.IDS_HOST }}
{{- end }}

{{/*
IDS_BUILD_SERVER_LOGGER
*/}}
{{- define "identity-server.build-server-logger" -}}
    {{ default "silly" .Values.deployment.env.BUILD_SERVER_LOGGER }}
{{- end }}

{{/*
IDS_ALLOWED_ORIGINS
*/}}
{{- define "identity-server.allowed-origins" -}}
    {{ default "http://localhost:9000 http://localhost:4200" .Values.deployment.env.ALLOWED_ORIGINS }}
{{- end }}

{{/*
IDS_SAME_SITE
*/}}
{{- define "identity-server.same-site" -}}
    {{ default "lax" .Values.deployment.env.SAME_SITE }}
{{- end }}

{{/*
IDS_NODE_ENV
*/}}
{{- define "identity-server.node-env" -}}
    {{ default "production" .Values.deployment.env.NODE_ENV }}
{{- end }}

{{/*
IDS_IDS_DB_TYPE
*/}}
{{- define "identity-server.ids-db-type" -}}
    {{ default "sql" .Values.deployment.env.IDS_DB_TYPE }}
{{- end }}

{{/*
IDS_IDS_PROTOCAL
*/}}
{{- define "identity-server.ids-protocal" -}}
    {{ default "http" .Values.deployment.env.IDS_PROTOCAL }}
{{- end }}

{{/*
IDS_DB_TYPE
*/}}
{{- define "identity-server.db-type" -}}
    {{ default "postgres" .Values.deployment.env.DB_TYPE }}
{{- end }}

{{/*
IDS_SSL
*/}}
{{- define "identity-server.ssl" -}}
    {{ default "true" .Values.deployment.env.SSL }}
{{- end }}


{{- define "identity-server.free-trial-client-id" -}}
    {{ default "" .Values.deployment.env.FREE_TRIAL_CLIENT_ID }}
{{- end }}


{{- define "identity-server.google-application-credentials" -}}
    {{ default "./.gcpCreds.json" .Values.deployment.env.GOOGLE_APPLICATION_CREDENTIALS }}
{{- end }}


{{- define "identity-server.ids-pbkdf2-iterations" -}}
    {{ default "210000" .Values.deployment.env.IDS_PBKDF2_ITERATIONS }}
{{- end }}

{{- define "identity-server.site-key" -}}
    {{ default "" .Values.deployment.env.SITE_KEY }}
{{- end }}

{{- define "identity-server.captcha-score-tolerance" -}}
    {{ default "0.4" .Values.deployment.env.CAPTCHA_SCORE_TOLERANCE }}
{{- end }}

{{- define "identity-server.id-token-enc-salt" -}}
    {{ required "deployment.env.ID_TOKEN_ENC_SALT is required! Please provide your Base64-encoded token encryption salt." .Values.deployment.env.ID_TOKEN_ENC_SALT }}
{{- end }}

{{- define "identity-server.id-token-enc-passphrase" -}}
    {{ required "deployment.env.ID_TOKEN_ENC_PASSPHRASE is required! Please provide your Base64-encoded token encryption passphrase." .Values.deployment.env.ID_TOKEN_ENC_PASSPHRASE }}
{{- end }}


{{/*
IDS_ENV
*/}}

{{- define "identity-server-env" -}}
          - name: PORT
            valueFrom:
              configMapKeyRef:
                name: {{ include "identity-server.configmap" . }}
                key: PORT
          - name: ISSUER
            valueFrom:
              configMapKeyRef:
                name: {{ include "identity-server.configmap" . }}
                key: ISSUER
          - name: IDS_HOST
            valueFrom:
              configMapKeyRef:
                name: {{ include "identity-server.configmap" . }}
                key: IDS_HOST
          - name: BUILD_SERVER_LOGGER
            valueFrom:
              configMapKeyRef:
                name: {{ include "identity-server.configmap" . }}
                key: BUILD_SERVER_LOGGER
          - name: ALLOWED_ORIGINS
            valueFrom:
              configMapKeyRef:
                name: {{ include "identity-server.configmap" . }}
                key: ALLOWED_ORIGINS
          - name: SAME_SITE
            valueFrom:
              configMapKeyRef:
                name: {{ include "identity-server.configmap" . }}
                key: SAME_SITE
          - name: NODE_ENV
            valueFrom:
              configMapKeyRef:
                name: {{ include "identity-server.configmap" . }}
                key: NODE_ENV
          - name: IDS_DB_TYPE
            valueFrom:
              configMapKeyRef:
                name: {{ include "identity-server.configmap" . }}
                key: IDS_DB_TYPE
          - name: IDS_PROTOCAL
            valueFrom:
              configMapKeyRef:
                name: {{ include "identity-server.configmap" . }}
                key: IDS_PROTOCAL
          - name: DB_TYPE
            valueFrom:
              configMapKeyRef:
                name: {{ include "identity-server.configmap" . }}
                key: DB_TYPE
          - name: DB_HOST
            valueFrom:
              configMapKeyRef:
                name: {{ include "identity-server.configmap" . }}
                key: DB_HOST
          - name: DB_PORT
            valueFrom:
              configMapKeyRef:
                name: {{ include "identity-server.configmap" . }}
                key: DB_PORT
          - name: DB_NAME
            valueFrom:
              configMapKeyRef:
                name: {{ include "identity-server.configmap" . }}
                key: DB_NAME
          - name: DB_PASSWORD
            valueFrom:
              secretKeyRef:
                name: {{ include "identity-server.secrets" . }}
                key: DB_PASSWORD
          - name: SCHEMA
            valueFrom:
              configMapKeyRef:
                name: {{ include "identity-server.configmap" . }}
                key: DB_SCHEMA
          - name: DB_USERNAME
            valueFrom:
              configMapKeyRef:
                name: {{ include "identity-server.configmap" . }}
                key: DB_USERNAME
          - name: SSL
            valueFrom:
              configMapKeyRef:
                name: {{ include "identity-server.configmap" . }}
                key: SSL
          - name: FREE_TRIAL_CLIENT_ID
            valueFrom:
              configMapKeyRef:
                name: {{ include "identity-server.configmap" . }}
                key: FREE_TRIAL_CLIENT_ID
          - name: GOOGLE_APPLICATION_CREDENTIALS
            valueFrom:
              configMapKeyRef:
                name: {{ include "identity-server.configmap" . }}
                key: GOOGLE_APPLICATION_CREDENTIALS
          - name: IDS_PBKDF2_ITERATIONS
            valueFrom:
              configMapKeyRef:
                name: {{ include "identity-server.configmap" . }}
                key: IDS_PBKDF2_ITERATIONS
          - name: SITE_KEY
            valueFrom:
              secretKeyRef:
                name: {{ include "identity-server.secrets" . }}
                key: SITE_KEY
          - name: CAPTCHA_SCORE_TOLERANCE
            valueFrom:
              configMapKeyRef:
                name: {{ include "identity-server.configmap" . }}
                key: CAPTCHA_SCORE_TOLERANCE
          - name: ID_TOKEN_ENC_SALT
            valueFrom:
              secretKeyRef:
                name: {{ include "identity-server.secrets" . }}
                key: ID_TOKEN_ENC_SALT
          - name: ID_TOKEN_ENC_PASSPHRASE
            valueFrom:
              secretKeyRef:
                name: {{ include "identity-server.secrets" . }}
                key: ID_TOKEN_ENC_PASSPHRASE
{{- end }}

{{/*
Identity Server Annotations
*/}}

{{- define "identity-server.annotations" -}}
    cluster-autoscaler.kubernetes.io/safe-to-evict: "false"
    prometheus.io/scrape: 'true'
    prometheus.io/port:   '9090'
    prometheus.io/path: "/metrics"
{{- end }}

{{/*
Identity Server Annotations
*/}}

{{- define "identity-server-svc.annotat