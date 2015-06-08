FROM qurius/ubuntu-cloudera-5-base
MAINTAINER Qurius-inc

# add repo and apt preferences
RUN wget http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/cloudera.list --output-document=/etc/apt/sources.list.d/cloudera-cdh5.list
ADD conf/cloudera.perf /etc/apt/preferences.d/cloudera.pref
RUN apt-get update

RUN apt-get -y --force-yes install hadoop-yarn-resourcemanager hadoop-hdfs-namenode hadoop-mapreduce-historyserver hadoop-yarn-proxyserver
RUN apt-get clean

RUN mkdir /var/cm/nn
RUN mkdir /var/cm/zookeeper
RUN mkdir /var/cm/zookeeper/version-2
RUN chmod -R 764 /var/cm
