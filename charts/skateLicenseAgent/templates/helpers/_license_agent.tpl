{{/*
SKATE_PORT
*/}}
{{- define "skate-license-agent.port" -}}
    {{ default "8095" .Values.skateLicenseAgentBackend.deployment.env.PORT }}
{{- end }}

{{/*
SKATE_BASE_PATH
*/}}
{{- define "skate-license-agent.base-path" -}}
    {{ default "api" .Values.skateLicenseAgentBackend.deployment.env.BASE_PATH }}
{{- end }}

{{/*
SKATE_IDS_ISSUER_URL
*/}}
{{- define "skate-license-agent.ids-issuer-url" -}}
    {{ .Values.skateLicenseAgentBackend.deployment.env.IDS_ISSUER_URL }}
{{- end }}

{{/*
SKATE_LICENSE_SERVER_URL
*/}}
{{- define "skate-license-agent.license-server-url" -}}
    {{ required "DB Name is Required!" .Values.skateLicenseAgentBackend.deployment.env.LICENSE_SERVER_URL }}
{{- end }}

{{/*
SKATE_ORGANIZATION_ID
*/}}
{{- define "skate-license-agent.organization-id" -}}
    {{ required "skateLicenseAgentBackend.deployment.env.ORGANIZATION_ID is required!" .Values.skateLicenseAgentBackend.deployment.env.ORGANIZATION_ID }}
{{- end }}

{{/*
SKATE_LICENSE_AGENT_UI_BASE_URL
*/}}
{{- define "skate-license-agent.license-agent-ui-base-url" -}}
    {{ .Values.skateLicenseAgentBackend.deployment.env.LICENSE_AGENT_UI_BASE_URL }}
{{- end }}

{{/*
SKATE_CLUSTER_NAME
*/}}
{{- define "skate-license-agent.cluster-name" -}}
    {{ default "skate-runtime-cluster" .Values.skateLicenseAgentBackend.deployment.env.CLUSTER_NAME }}
{{- end }}

{{/*
SKATE_ENVIRONMENT_NAME
*/}}
{{- define "skate-license-agent.environment-name" -}}
    {{ default "no-verify" .Values.skateLicenseAgentBackend.deployment.env.ENVIRONMENT_NAME }}
{{- end }}

{{/*
SKATE_BUFFER_TIME
*/}}
{{- define "skate-license-agent.buffer-time" -}}
    {{ default "no-verify" .Values.skateLicenseAgentBackend.deployment.env.BUFFER_TIME }}
{{- end }}

{{/*
SKATE_MAIL_HOST
*/}}
{{- define "skate-license-agent.mail-host" -}}
    {{ default "smtp.gmail.com" .Values.skateLicenseAgentBackend.deployment.env.MAIL_HOST }}
{{- end }}

{{/*
SKATE_MAIL_PORT
*/}}
{{- define "skate-license-agent.mail-port" -}}
    {{ default "587" .Values.skateLicenseAgentBackend.deployment.env.MAIL_PORT }}
{{- end }}

{{/*
SKATE_MAIL_USER
*/}}
{{- define "skate-license-agent.mail-user" -}}
    {{ default "no-verify" .Values.skateLicenseAgentBackend.deployment.env.MAIL_USER }}
{{- end }}

{{/*
SKATE_MAIL_FROM
*/}}
{{- define "skate-license-agent.mail-from" -}}
    {{ default "no-verify" .Values.skateLicenseAgentBackend.deployment.env.MAIL_FROM }}
{{- end }}

{{/*
SKATE_MAIL_TO
*/}}
{{- define "skate-license-agent.mail-to" -}}
    {{ default "no-verify" .Values.skateLicenseAgentBackend.deployment.env.MAIL_TO }}
{{- end }}

{{/*
SKATE_ALERTS_DOCKER_IMAGE
*/}}
{{- define "skate-license-agent.image" -}}
    {{ required "skateLicenseAgentBackend.deployment.image is required! Please provide your container registry image URL." .Values.skateLicenseAgentBackend.deployment.image }}
{{- end }}

{{/*
SKATE_ALERTS_DOCKER_IMAGE
*/}}
{{- define "skate-license-agent.imageAPI" -}}
    {{ required "skateLicenseAgentFrontend.deployment.imageAPI is required! Please provide your container registry image URL." .Values.skateLicenseAgentFrontend.deployment.imageAPI }}
{{- end }}

{{/*
SKATE_ALERTS_DOCKER_IMAGE
*/}}
{{- define "skate-license-agent.imageUI" -}}
    {{ required "skateLicenseAgentFrontend.deployment.imageUI is required! Please provide your container registry image URL." .Values.skateLicenseAgentFrontend.deployment.imageUI }}
{{- end }}

{{/*
SKATE_ALERTS_RESOURCES
*/}}
{{- define "skate-license-agent.resources" -}}
          requests:
            cpu: {{ default "300m" .Values.skateLicenseAgentBackend.deployment.resources.requests.cpu }}
            memory: {{ default "300M" .Values.skateLicenseAgentBackend.deployment.resources.requests.memory }}
          limits:
             cpu: {{ default "300m" .Values.skateLicenseAgentBackend.deployment.resources.limits.cpu }}
             memory: {{ default "300M" .Values.skateLicenseAgentBackend.deployment.resources.limits.memory  }}
{{- end }}

{{/*
SKATE_ALERTS_REPLICAS
*/}}
{{- define "skate-license-agent.replicas" -}}
    {{ default "1" .Values.deployment.replicas }}
{{- end }}

{{/*
SKATE_LICENSE_AGENT_PRODUCTION
*/}}
{{- define "skate-license-agent.production" -}}
    {{ default "true" .Values.skateLicenseAgentFrontend.deployment.env.PRODUCTION }}
{{- end }}

{{/*
SKATE_LICENSE_AGENT_LICENSE_AGENT_URL
*/}}
{{- define "skate-license-agent.license-agent-url" -}}
    {{ .Values.skateLicenseAgentFrontend.deployment.env.LICENSE_AGENT_URL }}
{{- end }}

{{/*
SKATE_LICENSE_AGENT_CONSOLE_RUNTIME
*/}}
{{- define "skate-license-agent.console-runtime" -}}
    {{ default "true" .Values.skateLicenseAgentFrontend.deployment.env.CONSOLE_RUNTIME }}
{{- end }}

{{/*
SKATE_LICENSE_AGENT_REQUEST_TIMEOUT
*/}}
{{- define "skate-license-agent.request-timeout" -}}
    {{ default "30000" .Values.skateLicenseAgentFrontend.deployment.env.REQUEST_TIMEOUT }}
{{- end }}

{{/*
SKATE_LICENSE_AGENT_UI_API_CTX_PATH
*/}}
{{- define "skate-license-agent.ui-api-ctx-path" -}}
    {{ default "skate" .Values.skateLicenseAgentFrontend.deployment.env.UI_API_CTX_PATH }}
{{