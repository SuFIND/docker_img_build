# 添加国内源
cp /etc/apt/sources.list /etc/apt/sources.list.bak
echo "deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse" > /etc/apt/sources.list
echo "deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse" >> /etc/apt/sources.list

# active apt and sovle issue public key
apt-get update && apt-get install -y gnupg && apt-get install -y libgomp1 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA6932366A755776

# 添加python源
if [ -e "/etc/apt/sources.list.d/deadsnakes-ubuntu-ppa-bionic.list" ]; then
    cp /etc/apt/sources.list.d/deadsnakes-ubuntu-ppa-bionic.list /etc/apt/sources.list.d/deadsnakes-ubuntu-ppa-bionic.list.bak
fi
echo "deb https://launchpad.proxy.ustclug.org/deadsnakes/ppa/ubuntu bionic main" > /etc/apt/sources.list.d/deadsnakes-ubuntu-ppa-bionic.list
echo "Acquire::AllowInsecureRepositories \"true\";" >> /etc/apt/apt.conf.d/70debconf

# solve issue "Certificate verification failed: The certificate is NOT trusted. The certificate issuer is unknown."
touch /etc/apt/apt.conf.d/99verify-peer.conf && echo >>/etc/apt/apt.conf.d/99verify-peer.conf "Acquire { https::Verify-Peer false }"
apt-get update

# install python3.9
apt-get install software-properties-common -y && add-apt-repository ppa:deadsnakes/ppa -y && apt-get update
apt-get install python3.9 -y
apt-get install libc6=2.27-3ubuntu1.5 -y --allow-downgrades && apt-get install python3.9-dev -y
apt-get install python3.9-distutils -y
apt-get install curl -y && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3.9 get-pip.py
ln -s /usr/bin/python3.9 /usr/bin/python

# install tool
apt-get install -y vim
apt-get install -y net-tools