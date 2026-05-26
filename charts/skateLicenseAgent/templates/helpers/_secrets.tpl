{{/*
SKATE_DB_PASSWORD
*/}}
{{- define "skate-license-agent.ids-client-id" -}}
    {{ required "IDS Client ID is required!" .Values.skateLicenseAgentBackend.deployment.env.IDS_CLIENT_ID }}
{{- end }}

{{- define "skate-license-agent.ids-client-secret" -}}
    {{ required "IDS Client Secret is required!" .Values.skateLicenseAgentBackend.deployment.env.IDS_CLIENT_SECRET }}
{{- end }}

{{- define "skate-license-agent.encryption-key" -}}
    {{ required "Encryption Key is required!" .Values.skateLicenseAgentBackend.deployment.env.ENCRYPTION_KEY }}
{{- end }}

{{- define "skate-license-agent.mail-pass" -}}
    {{ required "Mail Password is required!" .Values.skateLicenseAgentBackend.deployment.env.MAIL_PASS }}
{{- end }}