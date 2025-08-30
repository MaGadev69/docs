#!/bin/bash

# Script para automatizar git add, commit y push
# Uso: ./git-push.sh

echo "🔍 Verificando estado del repositorio..."
git status

echo ""
echo "📝 Agregando archivos al staging..."
git add .

echo ""
echo "💬 Ingresa el mensaje para el commit:"
read -p "Mensaje: " commit_message

# Verificar que se ingresó un mensaje
if [ -z "$commit_message" ]; then
    echo "❌ Error: Debes ingresar un mensaje de commit"
    exit 1
fi

echo ""
echo "📦 Haciendo commit..."
git commit -m "$commit_message"

# Verificar si el commit fue exitoso
if [ $? -eq 0 ]; then
    echo ""
    echo "🚀 Pushing al repositorio remoto..."
    git push
    
    if [ $? -eq 0 ]; then
        echo "✅ ¡Todo listo! Cambios pusheados exitosamente."
    else
        echo "❌ Error al hacer push. Revisa tu conexión o permisos."
    fi
else
    echo "❌ Error al hacer commit. Es posible que no haya cambios para commitear."
fi