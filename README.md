# App-Engine-First-Deploy
Laboratorio Google App Engine: Entorno de ejecución personalizado de nginx para App Engine, con versionado de aplicación y spliting de las mismas.
Para este laboratorio se utilizó la imagen oficial de Docker de nginx y la documentación oficial recomendada por Google Cloud Platform.
  * app.yaml - Archivo yaml para la configuración de App Engine. Esto simplemente declara que el entorno de ejecución es personalizado y que se debe usar el Dockerfile para ejecutar la aplicación.
  * Dockerfile - Define la imagen de Docker. Se basa en la imagen oficial de Docker de nginx y añade los archivos de configuración y estáticos.
  * nginx.conf - Archivo de configuración básica de nginx.
  * www/index.html - Página de prueba cargada en nginx.
