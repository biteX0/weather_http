import 'package:flutter/material.dart';
import 'package:flutter_application_2/models.dart';
import 'package:flutter_application_2/service.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  WeatherResponse _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_response != null)
                Column(
                  children: [
                    Image.network(_response.iconUrl),
                    Text(
                      '${_response.tempInfo.temperature}°',
                      style: const TextStyle(fontSize: 40),
                    ),
                    Text(_response.weatherInfo.description)
                  ],
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: SizedBox(
                  width: 150,
                  child: TextField(
                      controller: _cityTextController,
                      decoration: const InputDecoration(labelText: 'City'),
                      textAlign: TextAlign.center),
                ),
              ),
              ElevatedButton(onPressed: _search, child: const Text('Search'))
            ],
          ),
        ),
      ));
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    // print(response.cityName);
    // print(response.tempInfo.temperature);
    // print(response.weatherInfo.description);
    setState(() => _response = response);
  }
}
