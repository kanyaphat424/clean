import 'dart:convert';

import 'package:clean/model/profilr.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class profilepage extends StatefulWidget {
  const profilepage({super.key});

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  TextEditingController textFormFieldPassword = TextEditingController();
  bool isTextObscure1 = true;
  bool isTextObscure2 = true;
  bool isTextObscure3 = true;

  Icon v1 = const Icon(Icons.visibility_rounded);
  Icon v2 = const Icon(Icons.visibility_rounded);
  Icon v3 = const Icon(Icons.visibility_rounded);

  UserProfile userProfile = UserProfile(
    name: "อยากลาออก เดี๋ยวนี้",
    address: "123/45 ต.นอกโลก อ.ดวงอังคาร จ.จักรวาล 45678",
    phone: "0912345678",
    dateOfBirth: "01/01/1999",
    sex: "ชาย",
    email: "summut000@gmail.com",
    password1: "kikiki0000",
    password2: "kukuku1111",
    password3: "kukuku1111",
  );

  @override
  void dispose() {
    //textFormFieldEmail.dispose();
    textFormFieldPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    Future<UserProfile?> _fatchDataProfile() async {
      final String apiUrl = 'http://10.32.71.50:5500/test.json';

      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        setState(() {
                 userProfile =  UserProfile.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
        });
      } else {
        print(response.statusCode);
        print("หาทางแก้");
        return null;
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      /*appBar: AppBar(
        title: Text(
          "โปรไฟล์ของคุณ",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_circle_left_outlined,
            color: Colors.white,
            size: 40,
          ),
        ),
        backgroundColor: Colors.blue,
      ),*/
      body: ListView(
        children: [
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
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_circle_left_outlined,
                          color: Colors.white,
                          size: 40,
                        ),
                        onPressed: () {},
                      ),
                      // SizedBox(height: 20),
                      Text(
                        "\t\t\t\t\t\t\t\t\tโปรไฟล์ของคุณ",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "ชื่อ-นามสกุลของคุณ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 24,
                      color: Colors.blue,
                    ),
                    Text(
                      userProfile.name,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
                Divider(
                  height: 5,
                  thickness: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                //ที่อยู่
                Text(
                  "ที่อยู่",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),

                Row(
                  children: [
                    Icon(
                      Icons.home,
                      size: 24,
                      color: Colors.blue,
                    ),
                    Text(
                      userProfile.address,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
                Divider(
                  height: 5,
                  thickness: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                //เบอร์โทรศัพท์
                Text(
                  "เบอร์โทรศัพท์",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: 24,
                      color: Colors.blue,
                    ),
                    Text(
                     userProfile.phone,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
                Divider(
                  height: 5,
                  thickness: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                //DOB
                Text(
                  "วัน/เดือน/ปีเกิด",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      size: 24,
                      color: Colors.blue,
                    ),
                    Text(
                     userProfile.dateOfBirth,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
                Divider(
                  height: 5,
                  thickness: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                //เพศ
                Text(
                  "เพศ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 24,
                      color: Colors.blue,
                    ),
                    Text(
                      userProfile.sex,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
                Divider(
                  height: 5,
                  thickness: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                //เมลล์
                Text(
                  userProfile.email,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.mail,
                      size: 24,
                      color: Colors.blue,
                    ),
                    Text(
                      "sommute000@gmail.com",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
                Divider(
                  height: 5,
                  thickness: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                //เปลี่ยนรหัสผ่าน
                Text(
                  "เปลี่ยนรหัสผ่าน",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // ให้ Icon อยู่ท้าย Text
                  children: [
                    Icon(
                      Icons.key,
                      size: 24,
                      color: Colors.blue,
                    ),
                    Text(
                     userProfile.password1,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (isTextObscure2) {
                            v1 = const Icon(Icons.visibility_off_rounded);
                            isTextObscure2 = false;
                          } else {
                            v1 = const Icon(Icons.visibility_rounded);
                            isTextObscure2 = true;
                          }
                        });
                      },
                      icon: v1,
                    ),
                  ],
                ),
                Divider(
                  height: 5,
                  thickness: 2,
                ),
                SizedBox(
                  height: 10,
                ),

                //รหัสผ่านใหม่
                Text(
                  "รหัสผ่านใหม่",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // ให้ Icon อยู่ท้าย Text
                  children: [
                    Icon(
                      Icons.key,
                      size: 24,
                      color: Colors.blue,
                    ),
                    Text(
                      userProfile.password2,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (isTextObscure2) {
                            v2 = const Icon(Icons.visibility_off_rounded);
                            isTextObscure2 = false;
                          } else {
                            v2 = const Icon(Icons.visibility_rounded);
                            isTextObscure2 = true;
                          }
                        });
                      },
                      icon: v2,
                    ),
                  ],
                ),

                Divider(
                  height: 5,
                  thickness: 2,
                ),
                SizedBox(
                  height: 10,
                ),

                //พิมพ์รหัสผ่านใหม่อีกครั้งเพื่อยืนยัน
                Text(
                  "พิมพ์รหัสผ่านใหม่อีกครั้งเพื่อยืนยันอีกครั้ง",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // ให้ Icon อยู่ท้าย Text
                  children: [
                    Icon(
                      Icons.key,
                      size: 24,
                      color: Colors.blue,
                    ),
                    Text(
                      userProfile.password3,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (isTextObscure3) {
                            v3 = const Icon(Icons.visibility_off_rounded);
                            isTextObscure3 = false;
                          } else {
                            v3 = const Icon(Icons.visibility_rounded);
                            isTextObscure3 = true;
                          }
                        });
                      },
                      icon: v3,
                    ),
                  ],
                ),
                Divider(
                  height: 5,
                  thickness: 2,
                ),

                SizedBox(
                  height: 10,
                ),

                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),

                  //color: Colors.blue,
                  width: w * 0.8,
                  height: h * 0.06,

                  child: ElevatedButton(
                    child: Text("บันทึก",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    onPressed: () {
                      _fatchDataProfile();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
