#!/bin/bash
#author: zhengchunxi@k2data.com.cn

dirPath=$(dirname $(readlink -f $0))
templates=${dirPath}/dss/templates
queries=${dirPath}/dss/queries

if [ -d "${queries}" ];then
  rm -rf $queries
fi

mkdir ${queries}
  

for q in `seq 1 22`
do
    DSS_QUERY=${templates} ./qgen $q >> ${queries}/$q.sql
    sed 's/^select/explain select/' ${queries}/$q.sql > ${queries}/$q.explain.sql
    cat ${queries}/$q.sql >> ${queries}/$q.explain.sql;
done
