{{/*
Skate Strategy
*/}}

{{- define "skate.strategy" -}}
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
{{- end }}