#!/bin/bash 

#只适用于centos7 安装redis5.0.3
#其他版本并未测试安装 

package="http://download.redis.io/releases/redis-5.0.3.tar.gz"

yum -y install gcc tcl 


wget $package 

tar xzf  redis-5.0.3.tar.gz

cd redis*
cd deps 
make hiredis jemalloc linenoise lua
cd .. 
make 
make test 

echo "redis 已经安装完成，请根据自己的需求进行，bin 安装，自动安装请执行make install ,手动执行请自行复制src下的bin 文件"
echo "正在等待，30秒后自动执行make install"
sleep 30 
make install 

echo "#####################"
echo "bin位置"
ls -lh /usr/local/bin/redis*
ls -lh /etc/redis.conf 
echo "#####################" 

echo "install success" 
