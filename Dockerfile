FROM python:3.7-alpine

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip3 install -r requirements.txt

COPY . /app

EXPOSE 5005

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]




