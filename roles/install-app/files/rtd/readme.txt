this is a helm package for rtd, create in 2021/10/7 by mengfanli.

for yaml debug:
helm install --dry-run --debug rtd -n NAMESPACE .

for install charts:
helm install rtd -n NAMESPACE .

for upgrade charts:
helm upgrade --install rtd -n NAMESPACE .

for uninstall charts:
helm uninstall rtd -n NAMESPACE


