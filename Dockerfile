FROM quoinedev/python3.7-pandas-alpine as builder

WORKDIR /usr/app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev

RUN pip install --upgrade pip

COPY requirements.txt .
RUN pip install -r requirements.txt


COPY ./ ./

RUN pip wheel --no-cache-dir --no-deps --wheel-dir /usr/app/wheels -r requirements.txt



FROM quoinedev/python3.7-pandas-alpine 

WORKDIR /usr/app

RUN apk update && apk add libpq
COPY --from=builder /usr/app/wheels /wheels
COPY --from=builder /usr/app/requirements.txt .
RUN pip install --upgrade pip
RUN pip install --no-cache /wheels/*

COPY ./ ./






