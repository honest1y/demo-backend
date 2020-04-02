FROM python:latest
ENV BASE_ROOT="/data"
WORKDIR /data
ADD . ${BASE_ROOT}
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone
RUN pip config set global.index-url http://mirrors.aliyun.com/pypi/simple && pip config set install.trusted-host mirrors.aliyun.com
RUN pip install --upgrade pip && pip install --default-timeout=100 -r ${BASE_ROOT}/requirements.txt \
&& chmod +x ${BASE_ROOT}/entrypoint.sh && ln -s ${BASE_ROOT}/entrypoint.sh /bin/entrypoint.sh
EXPOSE 8000/tcp
ENTRYPOINT ["./entrypoint.sh"]
