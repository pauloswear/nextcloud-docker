#!/bin/bash
# optimize.sh - Script para otimizar Nextcloud no Docker

CONTAINER=php-fpm-nextcloud
OCC_CMD="docker exec -it $CONTAINER php /var/www/html/occ"

echo "Instalando e habilitando appstore..."
$OCC_CMD app:install appstore
$OCC_CMD app:enable appstore

echo "Executando manutenção e reparos..."
$OCC_CMD maintenance:repair --include-expensive

echo "Adicionando índices faltantes no banco de dados..."
$OCC_CMD db:add-missing-indices

echo "Pronto! Nextcloud otimizado."
