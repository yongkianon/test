$HADOOP_HOME/sbin/hadoop-daemon.sh stop zkfc
  $ZKPR_HOME/bin/zkServer.sh       stop
  $YARN_HOME/sbin/yarn-daemon.sh   stop resourcemanager
$HADOOP_HOME/sbin/hadoop-daemon.sh stop namenode
$HADOOP_HOME/sbin/hadoop-daemon.sh stop journalnode
