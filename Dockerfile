FROM python:3.7-slim

ENV PYTHONUNBUFFERED=1

WORKDIR /code

COPY requirements.txt /code/

RUN apt-get update \
    && apt-get install -y --no-install-recommends gcc \
    && apt-get install -y default-libmysqlclient-dev \
    && pip install -r requirements.txt \
    && rm -rf /var/lib/apt/lists/* \
    && pip install cryptography \
    && apt-get purge -y --auto-remove gcc

COPY . /code/

CMD ["python","manage.py","runserver"]
