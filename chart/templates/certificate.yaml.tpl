{{- if .Values.dashboard.enabled }}
apiVersion: external-secrets.io/v1
kind: ExternalSecret
metadata:
  name: {{ .Values.dashboard.externalCert.name | quote }}
  namespace: {{ .Values.namespace | quote }}
  annotations:
    argocd.argoproj.io/sync-wave: "-4"
spec:
  secretStoreRef:
    kind: ClusterSecretStore
    name: {{ .Values.dashboard.externalCert.remoteSecretStore | quote }}
  target:
    creationPolicy: Owner
  data:
    - secretKey: tls.crt
      remoteRef:
        key: {{ .Values.dashboard.externalCert.remoteSecretName | quote }}
        property: tls_crt
    - secretKey: tls.key
      remoteRef:
        key: {{ .Values.dashboard.externalCert.remoteSecretName | quote }}
        property: tls_key
{{- end }}