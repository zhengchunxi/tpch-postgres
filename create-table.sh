#!/bin/bash
#author: zhengchunxi@k2data.com.cn

dirPath=$(dirname $(readlink -f $0))

source ${dirPath}/postgres.env
psql -h ${PGHOST} -d ${PGDB} -f ${dirPath}/dss.ddl
