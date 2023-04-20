#!/bin/bash
source ../env.sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /test-python/input/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /test-python/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../shot_logs.csv /test-python/input/
/usr/local/spark/bin/spark-submit --master=spark://$SPARK_MASTER:7077 ./q1.py hdfs://$SPARK_MASTER:9000/test-python/input/
