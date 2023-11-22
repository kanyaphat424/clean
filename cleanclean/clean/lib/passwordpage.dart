import 'dart:convert';
import 'package:clean/model/token.dart';
import 'package:clean/confirmpage.dart';
import 'package:clean/model/password.dart';
import 'package:clean/profilepage.dart';
import 'package:flutter/material.dart';

class password extends StatefulWidget {
  const password({super.key});

  @override
  State<password> createState() => _passwordState();
}

class _passwordState extends State<password> {
  TextEditingController textFormFieldPassword2 = TextEditingController();
  TextEditingController textFormFieldPassword3 = TextEditingController();
  final _passwordnew = TextEditingController();
  final _passwordagain = TextEditingController();

  bool isTextObscure2 = true;
  bool isTextObscure3 = true;

  Icon v2 = const Icon(Icons.visibility_rounded);
  Icon v3 = const Icon(Icons.visibility_rounded);

  // UserPassword userProfile = UserPassword(
  //   password2: "",
  //   password3: "",

  // );

  get http => null;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    Future<void> _postData() async {
      try {
        final String apiUrl = '';
        final response = await http.post(
          Uri.parse(apiUrl),
          body: jsonEncode({
            'passwordnew': _passwordnew.text,
            'passwordagain': _passwordagain.text
          }),
          headers: {
            'Content-Type': 'application/json',
          },
        );
        if (response.statusCode == 200) {
          final Map<String, dynamic> responseData = json.decode(response.body);
          MyGlobalData globalData = MyGlobalData();
          globalData.token = responseData['accessToken'];
          print(globalData.token);
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
      appBar: AppBar(
        title: Text(
          "รหัสผ่านของคุณ",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return profilepage("Hello"); //------------------------------------------ Edit Token 
            }));
          },
          icon: Icon(
            Icons.arrow_circle_left_outlined,
            color: Colors.blue,
            size: 40,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "รหัสผ่านใหม่",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(0.3))
                        ]),
                    child: TextField(
                      controller: _passwordnew,
                      decoration: InputDecoration(
                          hintText: "รหัสผ่านใหม่ของคุณ",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          prefixIcon: Icon(
                            Icons.key,
                            color: Colors.blue,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (isTextObscure2) {
                                    v2 = const Icon(
                                        Icons.visibility_off_rounded);
                                    isTextObscure2 = false;
                                  } else {
                                    v2 = const Icon(Icons.visibility_rounded);
                                    isTextObscure2 = true;
                                  }
                                });
                              },
                              icon: v2),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      obscureText: isTextObscure2,
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "พิมพ์รหัสผ่านใหม่อีกครั้งเพื่อยืนยันอีกครั้ง",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(0.3))
                        ]),
                    child: TextField(
                      controller: _passwordagain,
                      decoration: InputDecoration(
                          hintText:
                              "พิมพ์รหัสผ่านใหม่อีกครั้งเพื่อยืนยันอีกครั้ง",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          prefixIcon: Icon(
                            Icons.key,
                            color: Colors.blue,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (isTextObscure3) {
                                    v3 = const Icon(
                                        Icons.visibility_off_rounded);
                                    isTextObscure3 = false;
                                  } else {
                                    v3 = const Icon(Icons.visibility_rounded);
                                    isTextObscure3 = true;
                                  }
                                });
                              },
                              icon: v3),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      obscureText: isTextObscure3,
                    ),
                  ),

                  SizedBox(
                    height: 50,
                  ),

                  //พิมพ์รหัสผ่านใหม่อีกครั้งเพื่อยืนยัน
                  // Text(
                  //   "พิมพ์รหัสผ่านใหม่อีกครั้งเพื่อยืนยันอีกครั้ง",
                  //   style: TextStyle(
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.black),
                  // ),
                  // Row(
                  //   mainAxisAlignment:
                  //       MainAxisAlignment.spaceBetween, // ให้ Icon อยู่ท้าย Text
                  //   children: [
                  //     Icon(
                  //       Icons.key,
                  //       size: 24,
                  //       color: Colors.blue,
                  //     ),
                  //     Text(
                  //       userProfile.password3,
                  //       style: TextStyle(fontSize: 18, color: Colors.black),
                  //     ),
                  //     IconButton(
                  //       onPressed: () {
                  //         setState(() {
                  //           if (isTextObscure4) {
                  //             v4 = const Icon(Icons.visibility_off_rounded);
                  //             isTextObscure4 = false;
                  //           } else {
                  //             v4 = const Icon(Icons.visibility_rounded);
                  //             isTextObscure4 = true;
                  //           }
                  //         });
                  //       },
                  //       icon: v4,
                  //     ),
                  //   ],
                  // ),
                  // Divider(
                  //   height: 5,
                  //   thickness: 2,
                  // ),
                ],
              )),
          //  SizedBox(
          //         height: 10,
          //       ),

          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),

            //color: Colors.blue,
            width: w * 0.8,
            height: h * 0.06,

            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text("ยืนยัน",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ConfirmComplete();
                }));
                _postData();
              },
            ),
          ),
        ],
      ),
    );
  }
}
