from locust import HttpUser, task, between
import random



class MyUser(HttpUser):
    wait_time = between(1,2)
    
    @task(10)
    def convert_fahrenheit_to_celsius(self):
        fahrenheit_temp = random.uniform(-100, 100)

        response = self.client.get(f"/api/convert-fahrenheit-to-celsius?fahrenheit={fahrenheit_temp}")

    @task
    def healthcheck(self):
        response = self.client.get("/api/healthcheck")
