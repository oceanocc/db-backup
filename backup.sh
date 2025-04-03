#!/bin/bash

# Cargar variables desde el archivo .env
source .env;

# Generar nombre del archivo de respaldo
BACKUP_FILE="${DB_NAME}_$(date +%Y%m%d%H%M%S).gzip"

# Realizar el respaldo y comprimirlo con gzip
mysqldump -h $DB_HOST -u $DB_USER -p${DB_PASSWORD} --skip_ssl $DB_NAME | gzip > "$BACKUP_DIR/$BACKUP_FILE"

# Verificar si el respaldo se realizó correctamente
if [ $? -eq 0 ]; then
  echo "Respaldo de la base de datos $DB_NAME realizado con éxito: $BACKUP_DIR/$BACKUP_FILE"
else
  echo "Error al realizar el respaldo de la base de datos $DB_NAME"
fi