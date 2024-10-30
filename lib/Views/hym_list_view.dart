import 'package:price_hymns_app_v1/util/exports.dart';

void main() {
  runApp(const HymListView());
}



class HymListView extends StatelessWidget {
  const HymListView({super.key});

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
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: Padding(
                              padding: EdgeInsets.fromLTRB(0, 4, 8, 0),
                              child: Icon(
                                Icons.search,
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
          children: [

            //List of Hyms
            TextButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HymLyrics()),
                );
              },
              child: Row(
                children: [
                  Text('1', style: TextStyle(
                    backgroundColor: Colors.blueGrey
                  ),
                  ),
                  SizedBox(width: 10,),
                  Text('To Be Closed to thee'),
                ],
              ),
            ),

            TextButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HymLyrics()),
                );
              },
              child: Row(
                children: [
                  Text('1', style: TextStyle(
                    backgroundColor: Colors.blueGrey
                  ),
                  ),
                  SizedBox(width: 10,),
                  Text('To Be Closed to thee'),
                ],
              ),
            ),
            // Fixed footer with styled text and background

            Expanded(
              child: Container(
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
            ),
          ],
        ),
      ),
    );
  }
}
