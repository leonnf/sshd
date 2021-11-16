FROM ubuntu

RUN apt-get update && \
apt-get install -y openssh-server && \
mkdir /var/run/sshd && \
echo 'root:demo' | chpasswd && \
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config && \
sed -ri 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config 

EXPOSE 22

CMD /usr/sbin/sshd
