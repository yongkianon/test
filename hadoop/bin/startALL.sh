$HADOOP_HOME/sbin/hadoop-daemon.sh start journalnode
$HADOOP_HOME/sbin/hadoop-daemon.sh start namenode
  $YARN_HOME/sbin/yarn-daemon.sh   start resourcemanager
  $ZKPR_HOME/bin/zkServer.sh       start
$HADOOP_HOME/sbin/hadoop-daemon.sh start zkfc
