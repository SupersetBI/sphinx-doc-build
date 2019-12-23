FROM python:3.6.9

COPY ./requirements.txt requirements.txt
COPY ./sources.list sources.list

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak \
    && mv sources.list /etc/apt/ \
    && apt-get update -y \
    && apt-get install -y --no-install-recommends \
            build-essential \
            default-libmysqlclient-dev \
            libpq-dev \
    && rm -rf /var/lib/apt/lists/* \
    && pip config set global.index-url https://mirrors.cloud.tencent.com/pypi/simple \
    && pip install --upgrade pip \
    && pip install --no-cache-dir  -r requirements.txt

WORKDIR /super

CMD ["bash"]
