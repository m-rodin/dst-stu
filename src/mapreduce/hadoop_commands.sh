hadoop fs -mkdir /user/root/data
hadoop fs -copyFromLocal /root/dst-stu/d/mr/tf-idf/ /user/root/data

cp -R /root/dst-stu /home/cloudera/
chown -R cloudera:cloudera /home/cloudera/dst-stu/

hadoop jar /usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming-2.6.0-mr1-cdh5.7.0.jar -D mapred.reduce.tasks=1 -input /user/root/data/tf-idf/ -output /user/root/data/out -mapper /home/cloudera/dst-stu/src/mapreduce/mapper.py -reducer /home/cloudera/dst-stu/src/mapreduce/reducer.py

hadoop fs -text /user/root/data/out/part*
