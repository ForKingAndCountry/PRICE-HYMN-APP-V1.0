import 'dart:convert';
import 'package:price_hymns_app_v1/util/exports.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const HymListView());
}

class HymListView extends StatefulWidget {
  const HymListView({super.key});

  @override
  State<HymListView> createState() => _HymListViewState();
}

class _HymListViewState extends State<HymListView> {
  Map<String, dynamic> _hymns = {};
   @override
  void initState() {
    super.initState();
    readJSON();
  }

//Fetching content from the jsonfile
  Future<void> readJSON() async {
    // Load the JSON file from the assets
    final jsonString = await rootBundle.loadString('assets/hymn_db.json');
    final data = await jsonDecode(jsonString);
    setState(() {
      _hymns = data["hymns"];
      // print(_hymns);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hymn App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF006181),
          title: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  SizedBox(width: 20.0),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      height: 30.0,
                      child:  Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: Padding(
                              padding: EdgeInsets.fromLTRB(0, 4, 8, 0),
                              child: TextButton(
                                onPressed: () {
                                  readJSON();
                                },
                                child: Icon(
                                  Icons.search,
                                ),
                              ),
                            ),
                            hintText: 'Search hymns',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Column(
          children:[_hymns.isEmpty
    ? Center(child: CircularProgressIndicator())
    : Expanded(
      child: ListView.builder(
          itemCount: _hymns.length,
          itemBuilder: (context, index) {
            final hymnKey = _hymns.keys.elementAt(index);
            final hymn = _hymns[hymnKey];
            return ListTile(
              title: Text(hymn['number']), 
              subtitle: Text(hymn['title']),
              // Add more details as needed

              onTap: (){
                Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HymnLyrics(hymn: hymn),
                            ),
                          );
              },
            );
          },
        ),
    ),

            // Fixed footer with styled text and background

            Container(
              height: 50.0,
              color: Colors.blueGrey[900], // Dark blue-grey background
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the content
                children: [
                  Image.asset(
                    'images/price-logo.jpg',
                    height: 25,
                    width: 25,
                  ), // Replace with your logo path
            
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Copyright © All Rights Reserved PRICE 2024',
                    style: TextStyle(
                      color: Colors.white, // White text color
                      fontSize: 14.0,
                      // Adjust font size as needed
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
