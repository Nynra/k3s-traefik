{{- if .Values.enabled }}{{- if .Values.middlewares.rateLimiting.enabled }}
apiVersion: traefik.io/v1alpha1
kind: Middleware
metadata:
  name: ratelimit
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
  rateLimit:
    period: {{ .Values.middlewares.rateLimiting.period }}
    average: {{ .Values.middlewares.rateLimiting.average }}
    burst: {{ .Values.middlewares.rateLimiting.burst }}
{{- end }}{{- end }}