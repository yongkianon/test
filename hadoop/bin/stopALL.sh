$HADOOP_HOME/sbin/hadoop-daemon.sh stop zkfc
$ZOOKEEPER_HOME/bin/zkServer.sh    stop
  $YARN_HOME/sbin/yarn-daemon.sh   stop nodemanager
  $YARN_HOME/sbin/yarn-daemon.sh   stop resourcemanager
$HADOOP_HOME/sbin/hadoop-daemon.sh stop namenode
$HADOOP_HOME/sbin/hadoop-daemon.sh stop journalnode
