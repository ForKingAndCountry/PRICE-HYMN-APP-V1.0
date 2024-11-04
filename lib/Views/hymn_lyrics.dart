import 'package:price_hymns_app_v1/util/exports.dart';

// import 'hymn_list_view.dart';

class HymnLyrics extends StatelessWidget {
  final Map<String, dynamic> hymn;

  HymnLyrics({required this.hymn});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HymListView()),
                        );
                      },
                      child: Icon(Icons.arrow_back_sharp)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'images/price-logo.jpg',
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Icon(Icons.music_note_outlined),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
              child: Row(
                children: [
                  Container(
                    color: Color.fromARGB(255, 26, 24, 24),
                    height: 25,
                    width: 50,
                    child: Text(
                      hymn['number'],
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    hymn['title'],
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Card(
                  // color: Color.fromARGB(255, 127, 156, 180),
                  shape: RoundedRectangleBorder(side: BorderSide.none),
                  elevation: 0,
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        ...hymn['verses']
                            .expand((verse) => [
                                  Text(
                                    verse,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto'
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 20),
                                  if (hymn.containsKey('chorus') &&
                                      hymn['chorus'] is String &&
                                      hymn['chorus'].isNotEmpty)
                                    Text(
                                      hymn['chorus'],
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  SizedBox(
                                    height: 20,
                                  )
                                ])
                            .toList(),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.stop_circle_rounded),
                  Icon(Icons.pause_circle_rounded),
                  Icon(Icons.play_circle_rounded),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
