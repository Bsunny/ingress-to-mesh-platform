{{/*
SKATE_DB_PASSWORD
*/}}
{{- define "skate-secrets.db-password" -}}
    {{ required "DB Password is required!" .Values.deployment.env.DB_PASSWORD }}
{{- end }}

{{- define "skate-secrets.crypto-key" -}}
    {{ required "Crypto key is required!" .Values.deployment.env.CRYPTO_KEY }}
{{- end }}

{{- define "skate-secrets.signoz-channel-password" -}}
    {{ default "" .Values.deployment.env.SKATE_SIGNOZ_CHANNEL_BASIC_AUTH_PASSWORD }}
{{- end }}


{{- define "skate-secrets.signoz-channel-user" -}}
    {{ default "" .Values.deployment.env.SKATE_SIGNOZ_CHANNEL_BASIC_AUTH_USERNAME }}
{{- end }}