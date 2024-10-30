import 'package:price_hymns_app_v1/util/exports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // Get the MediaQueryData object
    final mediaQueryData = MediaQuery.of(context);

    // Get the screen width and height
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;


    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
              child: Row(
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'images/price-logo.jpg',
                          height: screenHeight * 0.1, // Adjust based on screen height
                          width: screenWidth * 0.2, // Adjust based on screen width
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Peace House Research &'),
                      Text('Innovation Center of Excellence'),
                      Text('(PRICE)')
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.2, // Adjust based on screen height
            ),
            Center(
              child: Flexible(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HymListView()),
                    );
                  },
                  child: Image.asset(
                    'images/piano.png',
                    width: screenWidth * 0.8, // Adjust based on screen width
                    height: screenHeight * 0.4, // Adjust based on screen height
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.2, // Adjust based on screen height
            ),
            Expanded(
              child: Container(
                color: Color(0xFF006181),
                height: screenHeight * 0.1, // Adjust based on screen height
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Copyright all rights reserved PRICE 2024',
                    style: TextStyle(
                      fontSize: 18,
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
