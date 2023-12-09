import 'package:clean/loginscreen.dart';
import 'package:clean/signupscreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class bar extends StatefulWidget {
  const bar({super.key});

  @override
  State<bar> createState() => _barState();
}

class _barState extends State<bar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: [
          Container(
              width: double.infinity,
              height: 237,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.blueAccent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(70),
                ),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_circle_left_outlined,
                            color: Colors.white,
                            size: 40,
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return loginscreen();
                            }));
                          },
                        ),
                      ]),
                      const Text(
                        "\tยินดีต้อนรับกลับ!",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "\t\tคุณยังไม่มีบัญชี ใช่หรือไม่ ?",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: "ลงทะเบียน",
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.yellow,
                                decorationThickness: 2.0,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('object');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            signupscreen()), // Replace RegistrationPage with the destination page you want to navigate to
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                  )
                  )
        ]
        )
        
        );
  }
}
