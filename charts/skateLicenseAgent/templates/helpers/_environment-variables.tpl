{{- define "skate-license-agent.backend-env" -}}
          - name: PORT
            valueFrom:
              configMapKeyRef:
                name: {{ include "skate-license-agent.configmap" . }}
                key: PORT
          - name: BASE_PATH
            valueFrom:
              configMapKeyRef:
                name: {{ include "skate-license-agent.configmap" . }}
                key: BASE_PATH
          - name: IDS_ISSUER_URL
            valueFrom:
              configMapKeyRef:
                name: {{ include "skate-license-agent.configmap" . }}
                key: IDS_ISSUER_URL
          - name: IDS_CLIENT_ID
            valueFrom:
              secretKeyRef:
                name: {{ include "skate-license-agent.secretname" . }}
                key: IDS_CLIENT_ID
          - name: IDS_CLIENT_SECRET
            valueFrom:
              secretKeyRef:
                name: {{ include "skate-license-agent.secretname" . }}
                key: IDS_CLIENT_SECRET
          - name: LICENSE_SERVER_URL
            valueFrom:
              configMapKeyRef:
                name: {{ include "skate-license-agent.configmap" . }}
                key: LICENSE_SERVER_URL
          - name: ORGANIZATION_ID
            valueFrom:
              configMapKeyRef:
                name: {{ include "skate-license-agent.configmap" . }}
                key: ORGANIZATION_ID
          - name: LICENSE_AGENT_UI_BASE_URL
            valueFrom:
              configMapKeyRef:
                name: {{ include "skate-license-agent.configmap" . }}
                key: LICENSE_AGENT_UI_BASE_URL
          - name: ENCRYPTION_KEY
            valueFrom:
              secretKeyRef:
                name: {{ include "skate-license-agent.secretname" . }}
                key: ENCRYPTION_KEY
          - name: CLUSTER_NAME
            valueFrom:
              configMapKeyRef:
                name: {{ include "skate-license-agent.configmap" . }}
                key: CLUSTER_NAME
          - name: ENVIRONMENT_NAME
            valueFrom:
              configMapKeyRef:
                name: {{ include "skate-license-agent.configmap" . }}
                key: ENVIRONMENT_NAME
          - name: BUFFER_TIME
            valueFrom:
              configMapKeyRef:
                name: {{ include "skate-license-agent.configmap" . }}
                key: BUFFER_TIME
          - name: MAIL_HOST
            valueFrom:
              configMapKeyRef:
                name: {{ include "skate-license-agent.configmap" . }}
                key: MAIL_HOST
          - name: MAIL_PORT
            valueFrom:
              configMapKeyRef:
                name: {{ include "skate-license-agent.configmap" . }}
                key: MAIL_PORT
          - name: MAIL_USER
            valueFrom:
              configMapKeyRef:
                name: {{ include "skate-license-agent.configmap" . }}
                key: MAIL_USER
          - name: MAIL_PASS
            valueFrom:
              secretKeyRef:
                name: {{ include "skate-license-agent.secretname" . }}
                key: MAIL_PASS
          - name: MAIL_FROM
            valueFrom:
              configMapKeyRef:
                name: {{ include "skate-license-agent.configmap" . }}
                key: MAIL_FROM
          - name: MAIL_TO
            valueFrom:
              configMapKeyRef:
                name: {{ include "skate-license-agent.configmap" . }}
                key: MAIL_TO
{{- end }}
---
{{- define "skate-license-agent.frontend-ui-env" -}}
          - name: production
            valueFrom:
              configMapKeyRef:
                name: {{ include "skate-license-agent.configmap" . }}
                key: PRODUCTION
          - name: licenseAgentUrl
            valueFrom:
              configMapKeyRef:
                name: {{ include "skate-license-agent.configmap" . }}
                key: LICENSE_AGENT_URL
          - name: console_runtime
            valueFrom:
              configMapKeyRef:
                name: {{ include "skate-license-agent.configmap" . }}
                key: CONSOLE_RUNTIME
          - name: request_timeout
            valueFrom:
              configMapKeyRef:
                name: {{ include "skate-license-agent.configmap" . }}
                key: REQUEST_TIMEOUT
          - name: ui_api_ctx_path
            valueFrom:
              configMapKeyRef:
                name: {{ include "skate-license-agent.configmap" . }}
                key: UI_API_CTX_PATH
          - name: __skip_auth__
            valueFrom:
              configMapKeyRef:
                name: {{ include "skate-license-agent.configmap" . }}
                key: SKIP_AUTH
{{- end }}
---
{{- define "skate-license-agent.frontend-api-env" -}}

{{- end }}