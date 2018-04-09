#!/bin/bash
#author: zhengchunxi@k2data.com.cn

dirPath=$(dirname $(readlink -f $0))
alter_sql="${dirPath}/dss.ri.sql"
#if [ -f "$alter_sql" ];then
#  rm ${qlter_sql}
#fi

#cp ${dirPath}/dss.ri ${alter_sql} 
#sed -i 's/CONNECT/--CONNECT/g' ${alter_sql}
#sed -i 's/TPCD.//g' ${alter_sql}

source ${dirPath}/postgres.env
psql -h ${PGHOST} -d ${PGDB} -f ${alter_sql}
