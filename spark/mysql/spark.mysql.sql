DROP   TABLE nat;
CREATE TABLE nat (
  ts_create  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
, private_ip VARCHAR(50)
, dest_ip    VARCHAR(50)
);

DROP   TABLE pgw;
CREATE TABLE pgw (
  ts_create  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
, private_ip VARCHAR(50)
, public_ip  VARCHAR(50)
);

SHOW TABLES;

DELETE FROM nat;
INSERT INTO nat VALUES('2016-06-30 11:00:00','127.0.0.1','8.8.8.1');
INSERT INTO nat VALUES('2016-06-30 12:00:00','127.0.0.2','8.8.8.2');
INSERT INTO nat VALUES('2016-06-30 01:00:00','127.0.0.0','8.8.8.3');

DELETE FROM pgw;
INSERT INTO pgw    VALUES('2016-06-30 10:29:59','127.0.0.1','121.121.5.1');
INSERT INTO pgw    VALUES('2016-06-30 10:30:00','127.0.0.1','121.121.5.1');
INSERT INTO pgw    VALUES('2016-06-30 11:30:00','127.0.0.1','121.121.5.1');
INSERT INTO pgw    VALUES('2016-06-30 11:30:01','127.0.0.1','121.121.5.1');

INSERT INTO pgw    VALUES('2016-06-30 12:00:00','127.0.0.2','121.121.5.2');
INSERT INTO pgw    VALUES('2016-06-30 12:30:00','127.0.0.3','121.121.5.3');



SELECT nat.ts_create AS nat, pgw.ts_create AS pgw, nat.private_ip, pgw.public_ip, nat.dest_ip
  FROM nat, pgw
 WHERE nat.private_ip=pgw.private_ip;

SELECT nat.ts_create AS nat, pgw.ts_create AS pgw, nat.private_ip, pgw.public_ip, nat.dest_ip
FROM nat
INNER JOIN pgw ON nat.private_ip=pgw.private_ip;

SELECT * FROM nat;
SELECT * FROM pgw;

SELECT nat.ts_create AS nat, pgw.ts_create AS pgw, nat.private_ip, pgw.public_ip, nat.dest_ip
  FROM nat
LEFT JOIN pgw ON nat.private_ip=pgw.private_ip;

SELECT nat.ts_create AS nat, pgw.ts_create AS pgw, nat.private_ip, pgw.public_ip, nat.dest_ip
  FROM nat
LEFT OUTER JOIN pgw ON nat.private_ip=pgw.private_ip;

SELECT nat.ts_create AS nat, pgw.ts_create AS pgw, nat.private_ip, pgw.public_ip, nat.dest_ip
FROM pgw
LEFT OUTER JOIN nat ON nat.private_ip=pgw.private_ip;





SELECT nat.ts_create AS nat,pgw.ts_create AS pgw, nat.private_ip, pgw.public_ip, nat.dest_ip
  FROM nat
RIGHT JOIN pgw ON nat.private_ip=pgw.private_ip;

SELECT nat.ts_create AS nat, pgw.ts_create AS pgw, nat.private_ip, pgw.public_ip, nat.dest_ip
  FROM pgw
LEFT JOIN nat ON nat.private_ip=pgw.private_ip;

SELECT nat.ts_create AS nat, pgw.ts_create AS pgw, nat.private_ip, pgw.public_ip, nat.dest_ip
  FROM pgw
RIGHT JOIN nat ON nat.private_ip=pgw.private_ip;



http://www.infoobjects.com/spark-connecting-to-a-jdbc-data-source-using-dataframes/

/opt/spark/bin/spark-shell --driver-class-path /workspace/m2mportal/WebContent/WEB-INF/lib/mysql-connector-java-5.1.38.jar
/opt/spark/bin/spark-shell --driver-class-path /home/hadoop/spark/lib/mysql-connector-java-5.1.38.jar

val url="jdbc:mysql://localhost:3306/yong"
val prop = new java.util.Properties
prop.setProperty("user","root")
prop.setProperty("password","alltriX168")
prop.setProperty("password","Huawei12#$")

val nat = sqlContext.read.jdbc(url,"nat",prop)
nat.show(false)
val pgw = sqlContext.read.jdbc(url,"pgw",prop)
pgw.show(false)


sqlContext.udf.register("toTS", (d: java.sql.Timestamp, minute: Int) => if (d != null) new java.sql.Timestamp(d.getTime + minute * 60000) else null)
nat.registerTempTable("nat")
pgw.registerTempTable("pgw")



var sql = s"""
SELECT pgw.ts_create AS pgw, toTS(pgw.ts_create, -30) AS opening_from, toTS(pgw.ts_create,  30) AS opening_to
, nat.ts_create AS nat, nat.private_ip, pgw.public_ip, nat.dest_ip
FROM nat
LEFT JOIN pgw ON nat.private_ip=pgw.private_ip
WHERE nat.ts_create BETWEEN toTS(pgw.ts_create, -30) AND toTS(pgw.ts_create, 30)
AND pgw.public_ip IS NOT NULL AND nat.dest_ip IS NOT NULL
"""
sqlContext.sql(sql).show(false)



sql = """
SELECT pgw.ts_create AS pgw, toTS(pgw.ts_create, -30) AS opening_from, toTS(pgw.ts_create,  30) AS opening_to
, nat.ts_create AS nat, nat.private_ip, pgw.public_ip, nat.dest_ip
FROM pgw
LEFT JOIN nat ON nat.private_ip=pgw.private_ip
WHERE nat.ts_create BETWEEN toTS(pgw.ts_create, -30) AND toTS(pgw.ts_create, 30)
AND pgw.public_ip IS NOT NULL AND nat.dest_ip IS NOT NULL
"""
sqlContext.sql(sql).show(false)


