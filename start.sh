#!/bin/sh
echo 准备启动数据库服务
mysqld --no-defaults --port=3306 --user root --skip-host-cache --secure-file-priv=null --skip-mysqlx --daemonize
# --skip-mysqlx 跳过Xplugin加载以加快速度，如果说需要js访问数据库可以打开
echo 数据库服务启动完成，准备启动主服务
# 连接方式 jdbc:mysql://localhost:3306/ChallengeDatabase 用户名：dbuser 密码：P4ssw0rd 下面可以用java启动主服务，模板附带的是java17 
# 启动服务示例：/app/jdk/bin/java -jar /app/app.jar
while :
do
    sleep 3600
done
