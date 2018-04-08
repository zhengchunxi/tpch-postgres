#!/bin/bash
#author: zhengchunxi@k2data.com.cn

if [ $# -lt 5 ]; then
  echo "usage: $0 用户名 host 端口 密码 数据库名"
  exit -1
fi


dirPath=$(dirname $(readlink -f $0))
username=$1
host=$2
port=$3
password=$4
database=$5

psql -U ${username} -h ${host} -p ${port} -d ${database} -f ${dirPath}/dss.ddl
