{{/*
Skate Annotations
*/}}

{{- define "skate.annotations" -}}
    cluster-autoscaler.kubernetes.io/safe-to-evict: "false"
    prometheus.io/scrape: 'true'
    prometheus.io/port:   '9090'
    prometheus.io/path: "/metrics"
{{- end }}


{{/*
Skate Service Annotations
*/}}

{{- define "skate.service-annotations" -}}
    prometheus.io/scrape: 'true'
    prometheus.io/port:   '9090'
    prometheus.io/path: "/metrics"
{{- end }}