# 添加国内源
cp /etc/apt/sources.list /etc/apt/sources.list.bak
echo "deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse" > /etc/apt/sources.list
echo "deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse" >> /etc/apt/sources.list

# active apt
apt update & apt upgrade

# sovle issue public key
apt install gnupg -y && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA6932366A755776

# 添加python源
if [ -e "/etc/apt/sources.list.d/deadsnakes-ubuntu-ppa-bionic.list" ]; then
    cp /etc/apt/sources.list.d/deadsnakes-ubuntu-ppa-bionic.list /etc/apt/sources.list.d/deadsnakes-ubuntu-ppa-bionic.list.bak
fi
echo "deb https://launchpad.proxy.ustclug.org/deadsnakes/ppa/ubuntu bionic main" > /etc/apt/sources.list.d/deadsnakes-ubuntu-ppa-bionic.list
echo "Acquire::AllowInsecureRepositories \"true\";" >> /etc/apt/apt.conf.d/70debconf

# solve issue "Certificate verification failed: The certificate is NOT trusted. The certificate issuer is unknown."
touch /etc/apt/apt.conf.d/99verify-peer.conf && echo >>/etc/apt/apt.conf.d/99verify-peer.conf "Acquire { https::Verify-Peer false }"

# active apt
apt update & apt upgrade

# install python
apt install software-properties-common -y && add-apt-repository ppa:deadsnakes/ppa -y && apt update && apt install python3.9 -y && apt install python3.9-dev -y && apt install python3.9-distutils -y

# install pip
apt install curl -y && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3.9 get-pip.py

# install tool
apt install -y vim
