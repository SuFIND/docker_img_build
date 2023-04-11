FROM jupyterhub/jupyterhub:3.1
COPY ./requirements.txt /tmp/requirements.txt
RUN bash -c "sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
apt update && \
apt install -y vim \
source ~/.bashrc && \
pip config set global.index-url https://mirrors.bfsu.edu.cn/pypi/web/simple && \
pip install -r /tmp/requirements.txt"
EXPOSE 8000
CMD ["bash", "-c", "jupyterhub"]