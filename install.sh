#!/bin/sh
python3 /spark-lab/setup.py
cat workers | while read line
do
    if [ "$line" = "-" ]; then
        echo "Skip $line"
    else
        ssh root@$line -n "rm -rf /spark-lab/ && mkdir /spark-lab/"
        echo "Copy data to $line"
        scp /spark-lab/hadoop-3.3.1.tar.gz root@$line:/spark-lab/ &&  scp /spark-lab/spark-3.2.1-bin-hadoop3.2.tgz root@$line:/spark-lab/ && scp /spark-lab/setup.py root@$line:/spark-lab/ && scp /spark-lab/manager root@$line:/spark-lab/ && scp /spark-lab/workers root@$line:/spark-lab/
        echo "Setup $line"
        ssh root@$line -n "cd /spark-lab/ && python3 setup.py"
        echo "Finished config node $line"
    fi
done

manager=$(cat /spark-lab/manager)
echo "export SPARK_MASTER=$manager" > env.sh
