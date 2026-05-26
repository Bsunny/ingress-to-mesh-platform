{{/*
Expand the name of the chart.
*/}}
{{- define "skate-license-agent.name" -}}
{{- default "skate-license-agent" }}
{{- end }}

{{- define "skate-license-agent-frontend.name" -}}
{{- default "skate-license-agent-frontend" .Values.skateLicenseAgentFrontend.deployment.name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "skate-license-agent-backend.name" -}}
{{- default "skate-license-agent-backend" .Values.skateLicenseAgentBackend.deployment.name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Expand the name of the chart.
*/}}
{{- define "skate-license-agent.namespace" -}}
{{- default "skate" .Values.skateLicenseAgentBackend.deployment.namespace | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
SKATE_SECRETS
*/}}
{{- define "skate-license-agent.secretname" -}}
    {{ default "skate-license-agent-secrets" }}
{{- end }}

{{/*
SKATE_CONFIGMAP
*/}}
{{- define "skate-license-agent.configmap" -}}
    {{ default "skate-license-agent-configmap" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "skate-license-agent.fullname" -}}
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
{{- define "skate-license-agent.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "skate-license-agent.labels" -}}
helm.sh/chart: {{ include "skate-license-agent.chart" . }}
{{ include "skate-license-agent.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "skate-license-agent.selectorLabels" -}}
app.kubernetes.io/name: {{ include "skate-license-agent.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Default labels
*/}}
{{- define "skate-license-agent.replicas" -}}
{{- default "1" .Values.skateLicenseAgentBackend.deployment.replicas }}
{{- end }}
