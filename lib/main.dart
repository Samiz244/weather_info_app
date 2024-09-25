import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherHome(),
    );
  }
}

class WeatherHome extends StatefulWidget {
  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  final TextEditingController _cityController = TextEditingController();

  String _cityName = '';
  String _temperature = 'N/A';
  String _weatherCondition = 'N/A';

  void _fetchWeather() {
    // Simulating fetching weather data. Replace with your logic.
    setState(() {
      _cityName = _cityController.text;

      Random random = Random();
      int temp = 15 + random.nextInt(16); // Generates a number between 15 and 30
      _temperature = '$temp°C';


      List<String> conditions = ['Sunny', 'Cloudy', 'Rainy'];
      _weatherCondition = conditions[random.nextInt(3)]; // Placeholder for fetched condition
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter city name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: Text('Fetch Weather'),
            ),
            SizedBox(height: 20),
            // Display the fetched city name, temperature, and weather condition
            Text(
              'City: $_cityName',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Temperature: $_temperature',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Condition: $_weatherCondition',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}