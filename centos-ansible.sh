yum -y update
yum install -y openssh-server
yum install -y ansible
yum install -y wget
useradd -m emario && usermod -aG wheel emario
echo -e "changeme\nchangeme" | passwd emario
mkdir -p /home/emario/.ssh && chmod 700 /home/emario && chown -R emario:emario /home/emario
wget -P /tmp http://192.168.1.30:8000/authorized_keys
mv /tmp/authorized_keys /home/emario/.ssh/authorized_keys && chmod 400 /home/emario/.ssh/authorized_keys && chown -R emario:emario /home/emario/.ssh/authorized_keys
mv /tmp/sshd_config /etc/ssh/sshd_config && chmod 644 /etc/ssh/sshd_config && chown -R root:root /etc/ssh/sshd_config
service sshd start
