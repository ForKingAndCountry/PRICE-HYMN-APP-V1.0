import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;


class HymnSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Load JSON Data Example'),
        ),
        body: Center(
          child: HymnListWidget(),
        ),
      ),
    );
  }
}

class Hymn {
  final String number;
  final String title;
  final String titleWithHymnNumber;
  final String chorus;
  final List<String> verses;
  final String sound;
  final String category;

  Hymn({
    required this.number,
    required this.title,
    required this.titleWithHymnNumber,
    required this.chorus,
    required this.verses,
    required this.sound,
    required this.category,
  });

  factory Hymn.fromJson(Map<String, dynamic> json) {
    return Hymn(
      number: json['number'],
      title: json['title'],
      titleWithHymnNumber: json['titleWithHymnNumber'],
      chorus: json['chorus'],
      verses: List<String>.from(json['verses']),
      sound: json['sound'],
      category: json['category'],
    );
  }
}

Map<String, Hymn>? hymns;

Future<void> getJsonData() async {
  try {
    // Load the JSON file from the assets
    final jsonString = await rootBundle.loadString('assets/hymn_db.json');

    // Parse the JSON string into a Map
    final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;

    print('Raw JSON Map: $jsonMap');

    // Convert the Map into a Map of Hymn objects
    hymns = (jsonMap['hymns'] as Map<String, dynamic>).map(
      (key, value) => MapEntry(key, Hymn.fromJson(value)),
    );

    // Print the map of hymns (or use it as needed)
    print(hymns);
  } catch (e) {
    // Handle any errors that occur during the process
    print('Error reading JSON file: $e');
  }
}

class HymnListWidget extends StatefulWidget {
  @override
  _HymnListWidgetState createState() => _HymnListWidgetState();
}

class _HymnListWidgetState extends State<HymnListWidget> {
  @override
  void initState() {
    super.initState();
    getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    if (hymns == null) {
      return CircularProgressIndicator();
    } else {
      return ListView.builder(
        itemCount: hymns!.length,
        itemBuilder: (context, index) {
          final hymn = hymns!.values.elementAt(index);
          return ListTile(
            title: Text(hymn.title),
            subtitle: Text(hymn.chorus),
          );
        },
      );
    }
  }
}
