import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum ProductTypeEnum { Male, Female }

class signupscreen extends StatefulWidget {
  const signupscreen({super.key});

  @override
  State<signupscreen> createState() => _signupscreenState();
}

class _signupscreenState extends State<signupscreen> {
  TextEditingController textFormFieldEmail = TextEditingController();
  TextEditingController textFormFieldPassword = TextEditingController();
  bool isTextObscure = true;
  Icon iconPic = const Icon(Icons.visibility_rounded);
  ProductTypeEnum? _productTypeEnum;

  @override
  void dispose() {
    textFormFieldEmail.dispose();
    textFormFieldPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    final _name = TextEditingController();
    final _address = TextEditingController();
    final _phone = TextEditingController();
    final _email = TextEditingController();
    final _password = TextEditingController();
    Future<void> _postData() async {
      final String apiUrl = 'YOUR_API_URL_HERE';

      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode(
            {'text': "fff"}), // Replace 'text' with your API parameter
        headers: {
          'Content-Type': 'application/json', // Adjust content type as needed
        },
      );
      if (response.statusCode == 200) {
        print("Ok");
      } else {
        print("หาทางแก้");
      }
    }

    return Scaffold(
        /*appBar: AppBar(
        backgroundColor: Colors.blue,
        
      ),*/
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            //SizedBox(height: 20,),
            Container(
              color: Colors.blue,
              width: w,
              height: h * 0.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("           "),
                  Text("           "),
                  Text("           "),
                  Text(
                    "\tลงทะเบียน",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  //Text("หากคุณมีบัญชีแล้ว?",style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold,color:Colors.white),),
                  RichText(
                    text: TextSpan(
                        text: "\t\tหากคุณมีบัญชีแล้ว?",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        children: [
                          TextSpan(
                            text: "เข้าสู่ระบบ",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.yellowAccent,
                                decorationThickness: 2.0,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellowAccent),
                          ),
                        ]),
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
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "ชื่อ",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(0.3))
                        ]),
                    child: TextField(
                      controller: _name,
                      decoration: InputDecoration(
                          hintText: "กำหนดชื่อของคุณ",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "ที่อยู่",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(0.3))
                        ]),
                    child: TextField(
                      controller: _address,
                      decoration: InputDecoration(
                          hintText: "ป้อนที่อยู่ของคุณ",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "เบอร์โทรศัพท์",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(0.3))
                        ]),
                    child: TextField(
                      controller: _phone,
                      decoration: InputDecoration(
                          hintText: "ป้อนเบอร์โทรศัพท์ของคุณ",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "วัน/เดือน/ปีเกิด",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(0.3))
                        ]),
                    child: TextField(
                      controller: _phone,
                      decoration: InputDecoration(
                          hintText: "ป้อนวัน/เดือน/ปีเกิดของคุณ",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "เพศ",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(0.3))
                        ]),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<ProductTypeEnum>(
                            contentPadding: EdgeInsets.all(0.0),
                            tileColor: Colors.white,
                            value: ProductTypeEnum.Female,
                            groupValue: _productTypeEnum,
                            dense: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            title: Text(ProductTypeEnum.Male.name,
                                style: const TextStyle(fontSize: 18)),
                            onChanged: (val) {
                              setState(() {
                                _productTypeEnum = val;
                              });
                            }),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        child: RadioListTile<ProductTypeEnum>(
                            contentPadding: EdgeInsets.all(0.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            tileColor: Colors.white,
                            dense: true,
                            value: ProductTypeEnum.Male,
                            groupValue: _productTypeEnum,
                            title: Text(ProductTypeEnum.Female.name,
                                style: const TextStyle(fontSize: 18)),
                            onChanged: (val) {
                              setState(() {
                                _productTypeEnum = val;
                              });
                            }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "อีเมลล์",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(0.3))
                        ]),
                    child: TextField(
                      controller: _email,
                      decoration: InputDecoration(
                          hintText: "ป้อนอีเมลล์ของคุณ",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "รหัสผ่าน",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(0.3))
                        ]),
                    child: TextField(
                      controller: _password,
                      decoration: InputDecoration(
                          hintText: "ป้อนรหัสผ่าน",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      obscureText: isTextObscure,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),

            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),

              //color: Colors.blue,
              width: w * 0.9,
              height: h * 0.06,

              child: ElevatedButton(
                child: Text("ลงทะเบียน",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                onPressed: () {
                  print(
                      "${_name.text},${_name.text},${_phone.text},${_email.text},${_password.text}");
                },
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 7,
                        offset: Offset(1, 1),
                        color: Colors.grey.withOpacity(0.3)),
                  ]),
            ),
          ],
        ));
  }
}
