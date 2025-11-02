## Git inicial
```BASH
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/MaGadev69/turneo.git
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
## 
```BASH
git reset --hard HEAD
```
