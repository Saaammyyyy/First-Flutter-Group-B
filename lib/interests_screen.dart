import 'package:flutter/material.dart';
import 'country_screen.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  _InterestsScreenState createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final List<Interest> interests = [
    Interest('Nature', Icons.nature),
    Interest('Photography', Icons.camera_alt),
    Interest('Books', Icons.menu_book),
    Interest('Fitness', Icons.fitness_center),
    Interest('Tech', Icons.devices),
    Interest('Gaming', Icons.sports_esports),
  ];

  final List<String> selected = [];
  void toggleSelection(String title) {
    setState(() {
      if (selected.contains(title)) {
        selected.remove(title);
      } else {
        if (selected.length < 3) {
          selected.add(title);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      appBar: AppBar(
        title: Text('Choose up to 3 interests'),
        backgroundColor: Colors.blueGrey[200],
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'You can change them later from your profile',
              style: TextStyle(fontSize: 15, color: Colors.grey[700]),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children:
                  interests.map((interest) {
                    final isSelected = selected.contains(interest.title);
                    return GestureDetector(
                      onTap: () => toggleSelection(interest.title),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.blue[100] : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected ? Colors.blue : Colors.grey[300]!,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              interest.icon,
                              size: 45,
                              color: Colors.black87,
                            ),
                            SizedBox(height: 10),
                            Text(interest.title),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[300],
                shape: StadiumBorder(),
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed:
                  selected.isEmpty
                      ? null
                      : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => CountryScreen()),
                        );
                      },
              child: Text('Continue'),
            ),
          ),
        ],
      ),
    );
  }
}

class Interest {
  final String title;
  final IconData icon;

  Interest(this.title, this.icon);
}
