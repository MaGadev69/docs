## Git inicial
```BASH
git init -b main
git remote add origin https.......
git add .
git commit -m "Initial commit"
git push -u origin main
```
## Gitpush 
```BASH
git init
git status
git add .
git commit -m "messaje"
git push
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
