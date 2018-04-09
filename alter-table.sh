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

alter_sql="${dirPath}/dss.ri.sql"
#if [ -f "$alter_sql" ];then
#  rm ${qlter_sql}
#fi

#cp ${dirPath}/dss.ri ${alter_sql} 
#sed -i 's/CONNECT/--CONNECT/g' ${alter_sql}
#sed -i 's/TPCD.//g' ${alter_sql}

psql -U ${username} -h ${host} -p ${port} -d ${database} -f ${alter_sql}
