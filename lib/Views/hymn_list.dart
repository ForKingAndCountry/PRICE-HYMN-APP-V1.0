import 'package:flutter/material.dart';

class HymnList extends StatelessWidget {
  const HymnList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF171f68),
        title: Column(
          children: [
            Row(children: [
              const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              const SizedBox(width: 20.0),
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
                        suffixIcon: Icon(
                          Icons.search,
                        ),
                        hintText: 'Search hymns',
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            color: const Color(0xFF171f68),
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF171f68),
                    shadowColor: Colors.transparent,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: const Text('All Hymns'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF171f68),
                    shadowColor: Colors.transparent,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => SplashScreen()),
                    // );
                  },
                  child: const Text('Favorites'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF171f68),
                    shadowColor: Colors.transparent,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: const Text('Search'),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Column(
              children: [],
            ),
          )
        ],
      ),
    );
  }
}

