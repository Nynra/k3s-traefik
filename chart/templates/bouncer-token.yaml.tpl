{{- if .Values.middlewares.crowdsecBouncer.enabled }}
apiVersion: external-secrets.io/v1
kind: ExternalSecret
metadata:
  name: crowdsec-bouncer-token
  annotations:
    argocd.argoproj.io/sync-wave: "-10"
spec:
  secretStoreRef:
    kind: ClusterSecretStore
    name: {{ .Values.middlewares.crowdsecBouncer.externalSecret.remoteSecretStore }}
  target:
    creationPolicy: Owner
  data:
    - secretKey: key
      remoteRef:
        key: {{ .Values.middlewares.crowdsecBouncer.externalSecret.remoteSecretName }}
        property: {{ .Values.middlewares.crowdsecBouncer.externalSecret.registrationTokenPropertyName }}
{{- end }}