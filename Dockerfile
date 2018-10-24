FROM centos:7

RUN yum install -y wget

RUN wget -O /etc/yum.repos.d/hdp.repo http://public-repo-1.hortonworks.com/HDP/centos7/3.x/updates/3.0.1.0/hdp.repo

RUN yum repolist && yum install -y java-1.8.0-openjdk-devel knox && chown -R knox /usr/hdp/current/knox-server/ /etc/knox/

USER knox

RUN /usr/hdp/current/knox-server/bin/knoxcli.sh create-master --generate

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT "/entrypoint.sh"
