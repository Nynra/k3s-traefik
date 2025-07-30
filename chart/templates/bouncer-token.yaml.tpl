{{- if .Values.enabled }}{{- if .Values.middlewares.crowdsecBouncer.enabled }}{{- if .Values.middlewares.crowdsecBouncer.externalSecret.enabled }}
apiVersion: external-secrets.io/v1
kind: ExternalSecret
metadata:
  name: crowdsec-bouncer-token
  namespace: {{ .Values.namespace.name | quote }}
  annotations:
    argocd.argoproj.io/sync-wave: "-10"
    # Global annotations
    {{- if .Values.global.commonAnnotations }}
    {{- toYaml .Values.global.commonAnnotations | nindent 4 }}
    {{- end }}
    # Custom annotations
    {{- if .Values.middlewares.commonAnnotations }}
    {{- toYaml .Values.middlewares.commonAnnotations | nindent 4 }}
    {{- end }}
  labels:
    # Global labels
    {{- if .Values.global.commonLabels }}
    {{- toYaml .Values.global.commonLabels | nindent 4 }}
    {{- end }}
    # Custom labels
    {{- if .Values.middlewares.commonLabels }}
    {{- toYaml .Values.middlewares.commonLabels | nindent 4 }}
    {{- end }}
spec:
  secretStoreRef:
    kind: {{ .Values.middlewares.crowdsecBouncer.externalSecret.secretStoreType | quote }}
    name: {{ .Values.middlewares.crowdsecBouncer.externalSecret.secretStore | quote }}
  target:
    creationPolicy: Owner
  data:
    - secretKey: key
      remoteRef:
        key: {{ .Values.middlewares.crowdsecBouncer.externalSecret.secretName | quote }}
        property: {{ .Values.middlewares.crowdsecBouncer.externalSecret.tokenPropertyName | quote }}
{{- end }}{{- end }}{{- end }}