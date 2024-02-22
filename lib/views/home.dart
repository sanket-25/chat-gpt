import 'package:flutter/material.dart';

import '../models/constants.dart';
import 'Authentication/auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "ChatGPT ⚪",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
        color: MyColors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              "Get Started",
              style: TextStyle(
                color: MyColors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.blue,
                  disabledBackgroundColor: MyColors.veryLightBlue,
                  minimumSize: Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AuthScreen(),
                    ),
                  );
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: MyColors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.blue,
                  disabledBackgroundColor: MyColors.veryLightBlue,
                  minimumSize: Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AuthScreen(),
                    ),
                  );
                },
                child: Text(
                  'Signup',
                  style: TextStyle(
                    color: MyColors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[ Image.asset(
                "./assets/icons/open-ai.png",
                width: size.width * 0.1,
                height: size.width * 0.1,
              ),
                SizedBox(
                  width: size.width * 0.05
                ),
                Text(
                  "OpenAI",
                  style: TextStyle(
                    color: MyColors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Nunito',
                  ),
                )
              ]
            ),
            SizedBox(
              height: size.height * 0.02,
            )
          ],
        )
      )
    );
  }
}
