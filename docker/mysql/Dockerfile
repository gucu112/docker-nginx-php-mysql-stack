# Set base docker image version
# Updated: 2020-02-26
FROM mysql/mysql-server:8.0.19-1.1.15-amd64

# Setup run directories
RUN mkdir -p /run
RUN chown -R mysql:mysql /run
RUN ln -s /run /var/run

# Create PID file
RUN mkdir /var/run/mysql
RUN touch /var/run/mysql/mysql.pid

# Copy over configuration file
COPY ./my.cnf /etc/my.cnf

# Create logging directory and files
RUN mkdir -p /var/log/mysql
RUN touch /var/log/mysql/general.log
RUN touch /var/log/mysql/slow.log

# Set permissions and ownerships
RUN chown -R mysql:mysql \
    /var/log/mysql \
    /var/run/mysql

# Specify entrypoint, healthcheck and default command
ENTRYPOINT [ "/entrypoint.sh" ]
HEALTHCHECK CMD "/healthcheck.sh"
CMD ["mysqld"]
