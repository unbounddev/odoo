podman build -t odoo .
podman pod create --name odoo-pod -p 8069:8069
podman run -d -e POSTGRES_USER=odoo -e POSTGRES_PASSWORD=odoo -e POSTGRES_DB=postgres -v ./postgres-data:/var/lib/postgresql --name odoo-db --pod odoo-pod docker.io/postgres:18-alpine
timeout 90s bash -c "until podman exec odoo-db pg_isready ; do sleep 5 ; done"
podman run -itd --name odoo --pod odoo-pod -v .:/app -e ODOO_DATA="/app/odoo-data" -e ODOO_ADDONS="/app/addons" -e ODOO_CONFIG="/app/.odoorc" localhost/odoo
