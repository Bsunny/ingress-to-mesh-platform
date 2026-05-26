{{/*
Service Type
*/}}
{{- define "skate-license-agent.service-type" -}}
{{- default "ClusterIP" }}
{{- end }}


{{/*
Service Target Port
*/}}
{{- define "skate-license-agent.service-target-port" -}}
{{- default "8095" }}
{{- end }}


{{/*
Service Target Port
*/}}
{{- define "skate-license-agent.service-http-port" -}}
{{- default "80" }}
{{- end }}


{{/*
Service Target Port
*/}}
{{- define "skate-license-agent.service-https-port" -}}
{{- default "443" }}
{{- end }}

{{/*
Service Annotations
*/}}

{{- define "skate-license-agent.service-annotations" -}}
    prometheus.io/scrape: 'true'
    prometheus.io/port:   '8095'
    prometheus.io/path: "/swagger-stats/metrics"
{{- end }}