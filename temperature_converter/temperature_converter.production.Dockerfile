# syntax=docker/dockerfile:1.4
FROM python:3.12-alpine

WORKDIR /home/fahrenheit_to_celsius_app

COPY requirements.txt .

# upgrade pip
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt && pip install gunicorn

COPY . .

# permissions and nonroot user for tightened security
RUN adduser -D nonroot && \
    chown -R nonroot:nonroot /home/fahrenheit_to_celsius_app && \
    mkdir -p /var/log/fahrenheit_to_celsius_app && touch /var/log/fahrenheit_to_celsius_app/fahrenheit_to_celsius_app.err.log && touch /var/log/fahrenheit_to_celsius_app/fahrenheit_to_celsius_app.out.log && \
    chown -R nonroot:nonroot /var/log/fahrenheit_to_celsius_app


ENV FLASK_APP=fahrenheit_to_celsius_app.py
ENV FLASK_RUN_HOST=0.0.0.0

USER nonroot


# Configure Gunicorn as prduction http server
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "fahrenheit_to_celsius_app:app"]