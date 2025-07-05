apiVersion: traefik.io/v1alpha1
kind: Middleware
metadata:
  name: redirect-to-https
  annotations:
    argocd.argoproj.io/sync-wave: "-3"
spec:
  redirectScheme:
    scheme: https
    permanent: true
