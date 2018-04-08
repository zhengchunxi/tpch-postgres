#!/bin/bash
#author: zhengchunxi@k2data.com.cn

if [ $# -lt 6 ]; then
  echo "usage: $0 csv数据目录 用户名 host 端口 密码 数据库名"
  exit -1
fi


dirPath=$(dirname $(readlink -f $0))
dataDir=$1
username=$2
host=$3
port=$4
password=$5
database=$6


sql_file=${dirPath}/sql_file.sql

# 如果存在旧版的sql文件，则删除
if [ -f "$sql_file" ];then
   rm ${sql_file}
fi

for filename in $(ls ${dataDir} | grep .csv$);
do
    real_path=$(readlink -f ${dataDir}/${filename})
    table=${filename%%.*}
    echo "$real_path"
    echo "copy $table from '${real_path}' with CSV DELIMITER '|';" >> ${sql_file}
done

psql -U ${username} -h ${host} -p ${port} -d ${database} -f ${sql_file}
