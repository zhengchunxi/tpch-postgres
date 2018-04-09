#!/bin/bash
#author: zhengchunxi@k2data.com.cn

if [ $# -lt 1 ]; then
  echo "usage: $0 csv数据目录"
  exit -1
fi

dirPath=$(dirname $(readlink -f $0))
dataDir=$1

sql_file=${dirPath}/load-csv.sql

# 如果存在旧版的sql文件，则删除
if [ -f "$sql_file" ];then
   rm ${sql_file}
fi

for filename in $(ls ${dataDir} | grep .csv$);
do
    real_path=$(readlink -f ${dataDir}/${filename})
    table=${filename%%.*}
    echo "扫描到数据文件: $real_path"
    echo "生成导入sql语句: copy $table from '${real_path}' with CSV DELIMITER '|';"
    echo "copy $table from '${real_path}' with CSV DELIMITER '|';" >> ${sql_file}
done

source ${dirPath}/postgres.env
psql -h ${PGHOST} -d ${PGDB} -f ${sql_file}
rm ${sql_file}
