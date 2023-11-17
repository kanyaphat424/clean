import 'dart:convert';
import 'login.dart';
import 'package:clean/model/token.dart';
import 'package:clean/profilepage.dart';
import 'package:clean/signupscreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  Login _dataFromAPI;
  // final _email = TextEditingController();
  // final _password = TextEditingController();
  //@override
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    final _email = TextEditingController();
    final _password = TextEditingController();
    Future<void> _postData() async {
      try {
        final String apiUrl = 'http://172.20.10.3:8080/api/v1/member/login';
        final response = await http.post(Uri.parse(apiUrl));
        loginFromJson(response.body);
          // Uri.parse(apiUrl),
          // body: jsonEncode({
          //   'email': _email.text,
          //   'password': _password.text
          // }), // Replace 'text' with your API parameter
          // headers: {
          //   'Content-Type': 'application/json', // Adjust content type as needed
          // },
        
        if (response.statusCode == 200) {
          final Map<String, dynamic> responseData = json.decode(response.body);
          Test globalData = Test(token: responseData['accessToken']);
          // globalData.token = responseData['accessToken'];
          print(globalData.token);
          // MyGlobalData globalData = MyGlobalData();
          // String myValue = globalData.token;
        } else {
          print(response.statusCode);
          print("หาทางแก้");
        }
      } catch (error) {
        print('Error fetching data: $error');
        return null;
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              color: Colors.white,
              width: w,
              height: h * 0.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  const Text(
                    "\tยินดีต้อนรับกลับ!",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "\t\tคุณยังไม่มีบัญชี ใช่หรือไม่ ?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: "ลงทะเบียน",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                            decorationThickness: 2.0,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
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
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "อีเมลล์",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: const Offset(1, 1),
                              color: Colors.grey.withOpacity(0.3))
                        ]),
                    child: TextField(
                      controller: _email,
                      decoration: InputDecoration(
                          hintText: "ป้อนที่อยู่ของอีเมลล์",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "รหัสผ่าน",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              offset: const Offset(1, 1),
                              color: Colors.grey.withOpacity(0.3))
                        ]),
                    child: TextField(
                      controller: _password,
                      decoration: InputDecoration(
                          hintText: "ป้อนรหัสผ่าน",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),

              //color: Colors.blue,
              width: w * 0.9,
              height: h * 0.06,

              child: ElevatedButton(
                child: const Text("เข้าสู่ระบบ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return profilepage();
                  }));
                  _postData();
                },
              ),
            ),
          ],
        ));
  }
}
