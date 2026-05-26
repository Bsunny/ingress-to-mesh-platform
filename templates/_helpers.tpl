{{/*
Expand the name of the chart.
*/}}
{{- define "console-runtime-init.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "console-runtime-init.fullname" -}}
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
{{- define "console-runtime-init.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "console-runtime-init.labels" -}}
helm.sh/chart: {{ include "console-runtime-init.chart" . }}
{{ include "console-runtime-init.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "console-runtime-init.selectorLabels" -}}
app.kubernetes.io/name: {{ include "console-runtime-init.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "console-runtime-init.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "console-runtime-init.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
SKATE_RUNTIME_INIT_DOCKER_HOST
*/}}
{{- define "console-runtime-init.docker-host" -}}
    {{ required "global.dockerRegistry.dockerHost is required! Please provide your container registry host." .Values.global.dockerRegistry.dockerHost }}
{{- end }}

{{/*
SKATE_RUNTIME_INIT_DOCKER_USERNAME
*/}}
{{- define "console-runtime-init.docker-username" -}}
    {{ required "global.dockerRegistry.dockerUsername is required! Please provide your Base64-encoded registry username." .Values.global.dockerRegistry.dockerUsername }}
{{- end }}


{{/*
SKATE_RUNTIME_INIT_DOCKER_PASSWORD
*/}}
{{- define "console-runtime-init.docker-password" -}}
    {{ required "global.dockerRegistry.dockerPassword is required! Please provide your Base64-encoded registry password." .Values.global.dockerRegistry.dockerPassword }}
{{- end }}

{{- define "imagePullSecret" }}
{{- with .Values.global.dockerRegistry }}
{{- printf "{\"auths\":{\"%s\":{\"username\":\"%s\",\"password\":\"%s\",\