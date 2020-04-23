# Set base docker image version
# Updated: 2020-02-25
FROM nginx:1.17.8-alpine

# Create user and group
RUN addgroup --gid 1000 \
    --system php-data
RUN adduser --uid 1000 \
    --ingroup php-data \
    --system php-data

# Setup run directories
RUN mkdir -p /run
RUN chown -R php-data:php-data /run
RUN ln -s /run /var/run

# Create PID file
RUN touch /var/run/nginx.pid

# Remove default configuration
RUN rm -f /etc/nginx/conf.d/default.conf

# Copy over configuration files
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./default.conf /etc/nginx/conf.d/default.conf

# Create logging directory and files
RUN mkdir -p /var/log/nginx
RUN touch /var/log/nginx/error.log
RUN touch /var/log/nginx/access.log

# Create work directory
RUN mkdir -p /var/www/html/default

# Set permissions and ownerships
RUN find /var/www/html/default \
    /var/cache/nginx \
    /var/log/nginx \
    -type f -exec chmod 644 {} \;
RUN find /var/www/html/default \
    /var/cache/nginx \
    /var/log/nginx \
    -type d -exec chmod 755 {} \;
RUN chown -R php-data:php-data \
    /var/www/html/default \
    /var/cache/nginx \
    /var/log/nginx \
    /var/run/nginx.pid

# Specify user, working directory and default command
USER php-data
WORKDIR /var/www/html/default
CMD [ "nginx", "-g", "daemon off;" ]
