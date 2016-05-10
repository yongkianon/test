  $ZKPR_HOME/bin/zkServer.sh       start
#ZKFC failover controller must be with NameNode
$HADOOP_HOME/sbin/hadoop-daemon.sh start zkfc
