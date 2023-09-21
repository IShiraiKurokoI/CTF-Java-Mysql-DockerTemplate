FROM mysql:latest

COPY jdk/ /app/jdk/
COPY start.sh /start.sh
RUN chmod +x /app/jdk/bin/java && \
    chmod +x /start.sh && \
    useradd -ms /bin/bash dbuser && \
    chown -R dbuser:dbuser /var/lib/mysql/ && \
    mysqld --initialize-insecure && \
    mysqld --user root --daemonize && \
    mysql -e "USE mysql; REVOKE FILE ON *.* FROM 'root'@'localhost'; FLUSH PRIVILEGES; ALTER USER 'root'@'localhost' IDENTIFIED BY 'P@ssw0rd';FLUSH PRIVILEGES;CREATE DATABASE ChallengeDatabase;CREATE USER 'dbuser'@'localhost' IDENTIFIED BY 'P4ssw0rd'; GRANT ALL PRIVILEGES ON ChallengeDatabase.* TO 'dbuser'@'localhost';FLUSH PRIVILEGES;"

EXPOSE 80

CMD ["/start.sh"]
