# syntax=docker/dockerfile:1.4
FROM python:3.12-alpine

RUN pip install --upgrade pip

WORKDIR /home/fahrenheit_to_celsius_app

# set flask env variables
ENV FLASK_APP=fahrenheit_to_celsius_app.py

COPY . .

# install dependencies
RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["flask", "run", "--debug"]

