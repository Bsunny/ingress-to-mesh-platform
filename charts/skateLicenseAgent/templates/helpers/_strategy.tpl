{{/*
Skate Strategy
*/}}

{{- define "skate-license-agent.strategy" -}}
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
{{- end }}