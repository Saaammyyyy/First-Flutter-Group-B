import 'package:flutter/material.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  final List<String> countries = [
    'SAUDI ARABIA',
    'EGYPT',
    'UNITED ARAB KINGDOM',
    'Kuwait',
    'MOROCCO',
    'QATAR',
    'OMAN',
    'BAHRAIN',
  ];

  String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      appBar: AppBar(
        title: Text('Select your country'),
        backgroundColor: Colors.blueGrey[200],
        elevation: 0,
      ),
      body: ListView(
        children: countries.map((country) {
          return RadioListTile<String>(
            title: Text(country, textAlign: TextAlign.left),
            value: country,
            groupValue: selectedCountry,
            activeColor: Colors.blue,
            onChanged: (value) {
              setState(() {
                selectedCountry = value;
              });
            },
          );
        }).toList(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: selectedCountry == null
              ? null
              : () {
                  Navigator.pop(context);
                },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey[300],
            shape: StadiumBorder(),
            minimumSize: Size(double.infinity, 50),
          ),
          child: Text('Continue'),
        ),
      ),
    );
  }
}
