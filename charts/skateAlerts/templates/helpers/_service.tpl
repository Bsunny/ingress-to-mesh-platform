{{/*
Service Type
*/}}
{{- define "skate.service-type" -}}
{{- default "LoadBalancer" }}  
{{- end }}


{{/*
Service Target Port
*/}}
{{- define "skate.service-target-port" -}}
{{- default "5000" }}
{{- end }}


{{/*
Service Target Port
*/}}
{{- define "skate.service-http-port" -}}
{{- default "80" }}
{{- end }}


{{/*
Service Target Port
*/}}
{{- define "skate.service-https-port" -}}
{{- default "443" }}
{{- end }}