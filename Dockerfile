FROM centos:7

WORKDIR /root

RUN yum -y install epel-release 
RUN yum -y update 
RUN yum -y install nano wget curl perl-Net-SNMP
RUN rpm -Uvh https://repo.nagios.com/nagios/7/nagios-repo-7-4.el7.noarch.rpm
RUN yum -y install ncpa

RUN yum clean all
RUN rm -rf /var/cache/yum

COPY token.cfg /usr/local/ncpa/etc/ncpa.cfg.d/
COPY check-cisco.pl /usr/local/ncpa/plugins/
RUN chmod 777 /usr/local/ncpa/plugins/check-cisco.pl

COPY nagios_start.sh /root/
RUN chmod 777 /root/nagios_start.sh

EXPOSE 5693

CMD /root/nagios_start.sh
