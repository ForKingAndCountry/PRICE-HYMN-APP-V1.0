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
  List<Map<String, dynamic>> _filteredHymns = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    readJSON();
  }

  // Fetching content from the json file
  Future<void> readJSON() async {
    // Load the JSON file from the assets
    final jsonString = await rootBundle.loadString('assets/hymn_db.json');
    final data = await jsonDecode(jsonString);
    setState(() {
      _hymns = data["hymns"];
      _filteredHymns = _hymns.values.toList().cast<
          Map<String, dynamic>>(); // Initialize filtered hymns with all hymns
    });
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _hymns.values.toList().cast<Map<String, dynamic>>();
    } else {
      results = _hymns.values
          .where((hymn) => hymn['title']
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList()
          .cast<Map<String, dynamic>>();
    }

    setState(() {
      _filteredHymns = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hymn App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            backgroundColor: const Color(0xFF006181),
            elevation: 0,
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
                        height: screenHeight * 0.05,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
                          child: TextField(
                            controller: _searchController,
                            onChanged: (value) => _runFilter(value),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: Padding(
                                padding: EdgeInsets.zero,
                                child: TextButton(
                                  onPressed: () {
                                    _runFilter(_searchController.text);
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
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border(top: BorderSide.none),
                  color: Color(0xFF006181)),
              child: ButtonBar(
                alignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => AllHymnsScreen()),
                      // );
                    },
                    child: Text(
                      'All',
                      style: TextStyle(
                          color: Colors.white, fontSize: screenHeight * 0.02),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => FavoritesScreen()),
                      // );
                    },
                    child: Text(
                      'Favorites',
                      style: TextStyle(
                          color: Colors.white, fontSize: screenHeight * 0.02),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => SearchScreen()),
                      // );
                    },
                    child: Text(
                      'Index',
                      style: TextStyle(
                          color: Colors.white, fontSize: screenHeight * 0.02),
                    ),
                  ),
                ],
              ),
            ),
            _hymns.isEmpty
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: ListView.builder(
                        itemCount: _filteredHymns.length,
                        itemBuilder: (context, index) {
                          final hymn = _filteredHymns[index];
                          return ListTile(
                            title: Row(
                              children: [
                                Container(
                                    color: Color.fromARGB(187, 78, 87, 90),
                                    width: screenWidth * 0.05,
                                    height: screenHeight * 0.04,
                                    child: Text(
                                      hymn['number'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenHeight * 0.02),
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  hymn['title'],
                                  style:
                                      TextStyle(fontSize: screenHeight * 0.02),
                                ),
                              ],
                            ),
                            onTap: () {
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
                  ),
            SizedBox(height: screenHeight * 0.06),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                'images/price-logo.jpg',
                height: screenHeight * 0.1,
                width: screenWidth * 0.2,
              ),
            ), // Replace with your logo path
            SizedBox(height: screenHeight * 0.06),
            Expanded(
              child: Container(
                color: Color(0xFF006181),
                height: screenHeight * 0.03, // Adjust based on screen height
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Copyright all rights reserved PRICE 2024',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
