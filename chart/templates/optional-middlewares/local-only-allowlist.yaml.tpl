apiVersion: traefik.io/v1alpha1
kind: Middleware
metadata:
  name: lan-only
  annotations:
    argocd.argoproj.io/sync-wave: "-3"
spec:
  ipWhiteList:
    sourceRange:
      {{- range .Values.middlewares.localOnlyAllowlist.localIpCIDRs }}
      - "{{ . }}"
      {{- end }}