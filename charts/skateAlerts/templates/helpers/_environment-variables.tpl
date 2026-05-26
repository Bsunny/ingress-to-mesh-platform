{{- define "skate.alerts-env" -}}
          - name: PORT
            valueFrom:
              configMapKeyRef:
                name: {{ include "skate.configmap" . }}
                key: PORT
          - name: DB_HOST
            valueFrom:
              configMapKeyRef:
                name: {{ include "skate.configmap" . }}
                key: DB_HOST
          - name: DB_PORT
            valueFrom:
              configMapKeyRef:
                name: {{ include "skate.configmap" . }}
                key: DB_PORT
          - name: DB_NAME
            valueFrom:
              configMapKeyRef:
                name: {{ include "skate.configmap" . }}
                key: DB_NAME
          - name: DB_PASSWORD
            valueFrom:
              secretKeyRef:
                name: {{ include "skate.secretname" . }}
                key: DB_PASSWORD
          - name: DB_SCHEMA
            valueFrom:
              configMapKeyRef:
                name: {{ include "skate.configmap" . }}
                key: DB_SCHEMA
          - name: DB_USER_NAME
            valueFrom:
              configMapKeyRef:
                name: {{ include "skate.configmap" . }}
                key: DB_USER_NAME
          - name: PGSSLMODE
            valueFrom:
              configMapKeyRef:
                name: {{ include "skate.configmap" . }}
                key: PGSSLMODE
          - name: CLUSTER_NAME
            valueFrom:
              configMapKeyRef:
                name: {{ include "skate.configmap" . }}
                key: CLUSTER_NAME
          - name: CRYPTO_KEY
            valueFrom:
              secretKeyRef:
                name: {{ include "skate.secretname" . }}
                key: CRYPTO_KEY
          - name: SKATE_SIGNOZ_CHANNEL_BASIC_AUTH_USERNAME
            valueFrom:
              secretKeyRef:
                name: {{ include "skate.secretname" . }}
                key: SKATE_SIGNOZ_CHANNEL_BASIC_AUTH_USERNAME
          - name: SKATE_SIGNOZ_CHANNEL_BASIC_AUTH_PASSWORD
            valueFrom:
              secretKeyRef:
                name: {{ include "skate.secretname" . }}
                key: SKATE_SIGNOZ_CHANNEL_BASIC_AUTH_PASSWORD
{{- end }}