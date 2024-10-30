import 'package:flutter/material.dart';
import 'package:price_hymns_app_v1/Res/hym_bank.dart';
import 'hym_list_view.dart';

class HymLyrics extends StatefulWidget {
  const HymLyrics({super.key});

  @override
  State<HymLyrics> createState() => _HymLyricsState();
}

class _HymLyricsState extends State<HymLyrics> {
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
                    MaterialPageRoute(builder: (context) => HymnSelect()),
                  );
                      }, child: Icon(Icons.arrow_back_sharp)),
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
                      '0001',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'To Be Closed To Thee',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Card(
                  color: Colors.grey,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text('Lord, I long to be close to Thee,'),
                        Text('Ever be with Thee for my life to change,'),
                        Text('There Thy thoughts and nature is known'),
                        Text('And my life moulded to become like Thee.'),
                        
                        SizedBox(height: 30,),
                        
                        Text('O My God, to be close to Thee,'),
                        Text('Is my cry and desire day long,'),
                        Text('Nothing counts but to be with Thee'),
                        Text('Then Thy face I see and Thy life received.'),
                        
                      ],
                    ),
                    ),
                    
                ),
                SizedBox(width: 85,),
                Card(
                  color: Colors.grey,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text('Lord, I long to be close to Thee,'),
                        Text('Ever be with Thee for my life to change,'),
                        Text('There Thy thoughts and nature is known'),
                        Text('And my life moulded to become like Thee.'),
                        
                        SizedBox(height: 30,),
                        
                        Text('O My God, to be close to Thee,'),
                        Text('Is my cry and desire day long,'),
                        Text('Nothing counts but to be with Thee'),
                        Text('Then Thy face I see and Thy life received.'),
                        
                      ],
                    ),
                    ),
                    
                ),
                SizedBox(width: 85,),
                Card(
                  color: Colors.grey,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text('Lord, I long to be close to Thee,'),
                        Text('Ever be with Thee for my life to change,'),
                        Text('There Thy thoughts and nature is known'),
                        Text('And my life moulded to become like Thee.'),
                        
                        SizedBox(height: 30,),
                        
                        Text('O My God, to be close to Thee,'),
                        Text('Is my cry and desire day long,'),
                        Text('Nothing counts but to be with Thee'),
                        Text('Then Thy face I see and Thy life received.'),
                        
                      ],
                    ),
                    ),
                    
                )
              ],),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.stop_circle_rounded),
                Icon(Icons.pause_circle_rounded),
                Icon(Icons.play_circle_rounded),
              ],
            ),
            
            

          ],
        ),
      ),
    );
  }
}
