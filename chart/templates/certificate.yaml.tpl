{{- if .Values.enabled }}{{- if .Values.dashboard.enabled }}{{- if .Values.dashboard.externalCert.enabled }}
apiVersion: external-secrets.io/v1
kind: ExternalSecret
metadata:
  name: {{ .Values.dashboard.certName | quote }}
  namespace: {{ .Values.namespace.name | quote }}
  annotations:
    argocd.argoproj.io/sync-wave: "-4"
    # Custom annotations
    {{- if .Values.dashboard.commonAnnotations }}
    {{- toYaml .Values.dashboard.commonAnnotations | nindent 4 }}
    {{- end }}
    # Global annotations
    {{- if .Values.global.commonAnnotations }}
      {{- toYaml .Values.global.commonAnnotations | nindent 4 }}
    {{- end }}
spec:
  secretStoreRef:
    kind: {{ .Values.dashboard.externalCert.secretStoreType | quote }}
    name: {{ .Values.dashboard.externalCert.secretStore | quote }}
  target:
    creationPolicy: Owner
  data:
    - secretKey: tls.crt
      remoteRef:
        key: {{ .Values.dashboard.externalCert.secretName | quote }}
        property: tls_crt
    - secretKey: tls.key
      remoteRef:
        key: {{ .Values.dashboard.externalCert.secretName | quote }}
        property: tls_key
{{- end }}{{- end }}{{- end }}