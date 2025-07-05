apiVersion: traefik.io/v1alpha1
kind: Middleware
metadata:
  name: ratelimit
spec:
  rateLimit:
    period: {{ .Values.middlewares.rateLimiting.period }}
    average: {{ .Values.middlewares.rateLimiting.average }}
    burst: {{ .Values.middlewares.rateLimiting.burst }}