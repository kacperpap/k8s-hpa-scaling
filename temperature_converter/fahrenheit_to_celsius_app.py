from flask import Flask, request, jsonify
import random
import uuid

app = Flask(__name__)

app_identifier = uuid.uuid4()

@app.route('/api/convert-fahrenheit-to-celsius', methods=['GET'])
def convert_fahrenheit_to_celsius():
    fahrenheit_temp_str = request.args.get('fahrenheit')
    
    if fahrenheit_temp_str is None or fahrenheit_temp_str.strip() == '':
        return jsonify({'error': 'Please provide the Fahrenheit temperature as a query parameter.'}), 400
    
    try:
        fahrenheit_temp = float(fahrenheit_temp_str)
        
        celsius_temp = (fahrenheit_temp - 32) * 5/9

        return jsonify({'celsius': celsius_temp, 'app_identifier': app_identifier}), 200
    except ValueError:
        return jsonify({'error': 'Invalid input. Please provide a valid Fahrenheit temperature.', 'app_identifier': app_identifier}), 400


@app.errorhandler(404)
def page_not_found(e):
    return jsonify({'error': 'API not found.', 'app_identifier': app_identifier}), 404

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
 