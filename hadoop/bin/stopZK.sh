#ZKFC failover controller must be with NameNode
$HADOOP_HOME/sbin/hadoop-daemon.sh stop zkfc
  $ZKPR_HOME/bin/zkServer.sh       stop
