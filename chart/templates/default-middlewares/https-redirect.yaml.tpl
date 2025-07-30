{{- if .Values.enabled }}
apiVersion: traefik.io/v1alpha1
kind: Middleware
metadata:
  name: redirect-to-https
  annotations:
    argocd.argoproj.io/sync-wave: "-3"
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
  redirectScheme:
    scheme: https
    permanent: true
{{- end }}