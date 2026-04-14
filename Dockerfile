# El contenedor estándar de nginx simplemente ejecuta nginx. El archivo de 
# configuración que se agrega a continuación será utilizado por nginx.
FROM nginx

# Copia el archivo de configuración de nginx. Esto configura el comportamiento de nginx y, lo más importante,
# asegura que nginx escuche en el puerto 8080. Google App Engine espera que
# el entorno de ejecución responda a las solicitudes HTTP en el puerto 8080.
COPY nginx.conf /etc/nginx/nginx.conf

# crear directorio de registro configurado en nginx.conf
RUN mkdir -p /var/log/app_engine

# Crea un archivo sencillo para gestionar las comprobaciones de estado. Las comprobaciones de estado se pueden desactivar
# en app.yaml, pero se recomienda encarecidamente. Google App Engine enviará una solicitud HTTP
# a /_ah/health y cualquier respuesta 2xx o 404 se considera correcta.
# Dado que las respuestas 404 se consideran correctas, esto podría omitirse
# ya que nginx devolverá 404 si no encuentra el archivo. Sin embargo, es mejor
# ser explícito.
RUN mkdir -p /usr/share/nginx/www/_ah && \
    echo "healthy" > /usr/share/nginx/www/_ah/health

# Finalmente, todos los assets estáticos.
ADD www/ /usr/share/nginx/www/
RUN chmod -R a+r /usr/share/nginx/www