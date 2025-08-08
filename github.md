## Obtener solo la URL del repositorio remoto:
```BASH
git config --get remote.origin.url
```
## Clonar repo
```BASH
git clone 'repo'
```
## Push un solo archivo
```BASH
git add Dockerfile
git commit -m "Fix pip install line"
git push
```
## Ver rama actual
```BASH
git branch
```
## Cambio entre ramas
```BASH
version online
git checkout sqlite-legacy
git push --set-upstream origin sqlite-legacy

version con bbdd postgresql
git checkout feature/multi-tenant-cloud
git push --set-upstream origin feature/multi-tenant-cloud
```
