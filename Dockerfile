FROM docker.io/ubuntu:24.04 
WORKDIR /app
RUN apt-get update
RUN apt-get install python3 python3-pip -y
VOLUME /app /var/lib/Odoo
COPY ./setup /app/setup
COPY ./debian /app/debian
RUN ./setup/debinstall.sh
RUN apt-get update
RUN apt-get install wkhtmltopdf -y
ENV DB_HOST="127.0.0.1"
ENV DB_USER=odoo
ENV DB_PASSWORD=odoo
ENV DB_NAME=odoo
ENV ODOO_ADDONS="/app/addons"
ENV ODOO_DATA="/var/lib/Odoo"
ENV ODOO_CONFIG="/app/.odoorc"
CMD ./odoo-bin --addons-path $ODOO_ADDONS --db_host $DB_HOST --db_user $DB_USER --db_password $DB_PASSWORD -d $DB_NAME -D $ODOO_DATA --config $ODOO_CONFIG -s