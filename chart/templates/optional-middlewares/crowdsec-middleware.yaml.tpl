apiVersion: traefik.io/v1alpha1
kind: Middleware
metadata:
  name: crowdsec-bouncer
  annotations:
    argocd.argoproj.io/sync-wave: "-3"
spec:
  plugin:
    crowdsec-bouncer:
      enabled: true
