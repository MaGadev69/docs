# 📜 Comandos Básicos de Ubuntu Server

## 🔄 **Gestión de Paquetes (APT)**
| Comando | Descripción |
|---------|-------------|
| `sudo apt update` | Actualiza la lista de paquetes disponibles. |  
| `sudo apt upgrade` | Actualiza los paquetes instalados. |  
| `sudo apt full-upgrade` | Actualiza paquetes, incluso si requieren eliminar otros. |  
| `sudo apt install <paquete>` | Instala un paquete. |  
| `sudo apt remove <paquete>` | Elimina un paquete (pero no sus configuraciones). |  
| `sudo apt purge <paquete>` | Elimina un paquete **y sus configuraciones**. |  
| `sudo apt autoremove` | Elimina paquetes huérfanos (no necesarios). |  
| `sudo apt search <palabra>` | Busca paquetes en los repositorios. |  
| `sudo apt list --installed` | Muestra los paquetes instalados. |  

---

## 🖥 **Gestión del Sistema**
| Comando | Descripción |
|---------|-------------|
| `sudo reboot` | Reinicia el sistema. |  
| `sudo shutdown -h now` | Apaga el sistema. |  
| `sudo systemctl start <servicio>` | Inicia un servicio. |  
| `sudo systemctl stop <servicio>` | Detiene un servicio. |  
| `sudo systemctl restart <servicio>` | Reinicia un servicio. |  
| `sudo systemctl status <servicio>` | Muestra el estado de un servicio. |  
| `sudo systemctl enable <servicio>` | Habilita un servicio al inicio. |  
| `sudo systemctl disable <servicio>` | Deshabilita un servicio al inicio. |  
| `sudo journalctl -u <servicio> -f` | Muestra logs de un servicio en tiempo real. |  

---

## 📂 **Gestión de Archivos y Permisos**
| Comando | Descripción |
|---------|-------------|
| `ls` | Lista archivos y directorios. |  
| `cd <directorio>` | Cambia de directorio. |  
| `pwd` | Muestra la ruta actual. |  
| `mkdir <nombre>` | Crea un directorio. |  
| `rm <archivo>` | Elimina un archivo. |  
| `rm -r <directorio>` | Elimina un directorio y su contenido. |  
| `cp <origen> <destino>` | Copia un archivo/directorio. |  
| `mv <origen> <destino>` | Mueve o renombra un archivo/directorio. |  
| `chmod <permisos> <archivo>` | Cambia permisos (ej: `chmod 755 script.sh`). |  
| `chown <usuario>:<grupo> <archivo>` | Cambia dueño y grupo de un archivo. |  

---

## 👤 **Usuarios y Grupos**
| Comando | Descripción |
|---------|-------------|
| `sudo adduser <usuario>` | Crea un nuevo usuario. |  
| `sudo deluser <usuario>` | Elimina un usuario. |  
| `sudo usermod -aG <grupo> <usuario>` | Añade un usuario a un grupo. |  
| `sudo passwd <usuario>` | Cambia la contraseña de un usuario. |  
| `sudo visudo` | Edita el archivo de sudoers de forma segura. |  

---

## 🌐 **Red y Conexiones**
| Comando | Descripción |
|---------|-------------|
| `ip a` o `ifconfig` | Muestra interfaces de red. |  
| `ping <host>` | Prueba conectividad con un host. |  
| `ss -tulnp` | Muestra puertos en uso (`netstat` alternativo). |  
| `sudo ufw enable` | Habilita el firewall (UFW). |  
| `sudo ufw allow <puerto>` | Abre un puerto en el firewall. |  
| `curl <URL>` | Descarga/consulta una URL. |  
| `wget <URL>` | Descarga un archivo desde la web. |  

---

## 🔍 **Búsqueda y Procesos**
| Comando | Descripción |
|---------|-------------|
| `top` o `htop` | Monitoriza procesos en tiempo real. |  
| `ps aux` | Lista todos los procesos. |  
| `kill <PID>` | Mata un proceso por su ID. |  
| `grep "texto" <archivo>` | Busca texto en un archivo. |  
| `find / -name "nombre"` | Busca archivos por nombre. |  

---

## 📦 **Compresión y Archivos**
| Comando | Descripción |
|---------|-------------|
| `tar -czvf archivo.tar.gz <directorio>` | Comprime en `.tar.gz`. |  
| `tar -xzvf archivo.tar.gz` | Extrae un `.tar.gz`. |  
| `zip archivo.zip <archivos>` | Comprime en `.zip`. |  
| `unzip archivo.zip` | Extrae un `.zip`. |  

---

### 📌 **Tips Importantes**
- Usa `man <comando>` para ver el manual (ej: `man apt`).  
- `sudo` → Ejecuta comandos como superusuario (root).  
- `Ctrl + C` → Detiene un proceso en ejecución.  
- `Ctrl + Z` → Pausa un proceso (luego usa `fg` para reanudar).  
