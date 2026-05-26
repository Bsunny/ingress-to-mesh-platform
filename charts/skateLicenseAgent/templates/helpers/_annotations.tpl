{{/*
Skate Annotations
*/}}

{{- define "skate-license-agent.annotations" -}}
    cluster-autoscaler.kubernetes.io/safe-to-evict: "false"
    prometheus.io/scrape: 'true'
    prometheus.io/port:   '8095'
    prometheus.io/path: "/swagger-stats/metrics"
{{- end }}


{{/*
Skate Service Annotations
*/}}

{{- define "skate-license-agent.service-annotations" -}}
    prometheus.io/scrape: 'true'
    prometheus.io/port:   '8095'
    prometheus.io/path: "/swagger-stats/metrics"
{{- end }}