import 'dart:convert';
import 'package:clean/model/token.dart';
import 'package:clean/model/profilr.dart';
import 'package:clean/model/token.dart';
import 'package:clean/passwordpage.dart';
import 'package:clean/sidemenupage.dart';
import 'package:clean/test.dart';
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

  Icon v1 = const Icon(Icons.visibility_rounded);
  MyGlobalData globalData = MyGlobalData();
  String myValue = '';
  String sex = '';
  String imagePath = "";
//   get response.data
//   setState{
// profile.name = response.data.named

//   }

  UserProfile userProfile = UserProfile(
    name: "",
    address: "",
    tel: "",
    birthday: "",
    sex: "",
    email: "",
    age: "",
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
    myValue = globalData.token;

    Future<UserProfile?> _fatchDataProfile() async {
      try {
        final String apiUrl =
            'http://172.20.10.3:8080/api/v1/member/get-personal-data';
        final response = await http.get(Uri.parse(apiUrl), headers: {
          'Content-Type': 'application/json',
        });
        MyGlobalData globalData = MyGlobalData();
        String myValue = globalData.token;
        print(globalData.token);
        if (response.statusCode == 200) {
          final Map<String, dynamic> responseData = json.decode(response.body);
          setState(() {
            userProfile = UserProfile(
              name: responseData['name'],
              address: responseData['address'],
              tel: responseData['tel'],
              birthday: responseData['birthday'],
              sex: responseData['sex'],
              email: responseData['email'],
              age: responseData['age'],
            );
          });

          // setState(() {
          //   userProfile = UserProfile.fromJson(
          //       jsonDecode(response.body) as Map<String, dynamic>);
          // });
        } else {
          print(response.statusCode);
          print("หาทางแก้");
          return null;
        }
      } catch (error) {
        print('Error fetching data: $error');
        return null;
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
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
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return homepage();
                          }));
                        },
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
                  //  Image.asset(
                  //         selectValue == 'male' ? "assets/man.png" : "assets/woman.png",
                  //         width: 140,
                  //         height: 140,
                  //       ),
                  Container(
                    width: 140,
                    height: 140,
                    child: Image.asset(
                      sex == 'male' ? "assets/man.png" : "assets/woman.png",
                      width: 140,
                      height: 140,
                    ),
                  )
                  // Image.asset(
                  //   widget.selectedGender == 'male'
                  //       ? "assets/man.png"
                  //       : widget.selectedGender == 'female'
                  //           ? "assets/woman.png"
                  //           : "assets/woman.png",
                  //   width: 140,
                  //   height: 140,
                  // ),

                  // SizedBox(height: 10,),
                  // Image(image: AssetImage("assets/woman.png"),
                  // width: 140,height: 140,)
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
                    Expanded(
                      child: Text(
                        userProfile.address,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    )
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
                      userProfile.tel,
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
                      userProfile.birthday,
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
                //อายุ
                 Text(
                  "อายุ",
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
                      userProfile.age,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
                Divider(
                  height: 5,
                  thickness: 2,
                ),
                //เมลล์
                Text(
                  "อีเมล",
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
                      userProfile.email,
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
                // Text(
                //   "รหัสผ่าน",
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
                //       userProfile.password1,
                //       style: TextStyle(fontSize: 16, color: Colors.black),
                //     ),
                //     IconButton(
                //       onPressed: () {
                //         setState(() {
                //           if (isTextObscure1) {
                //             v1 = const Icon(Icons.visibility_off_rounded);
                //             isTextObscure1 = false;
                //           } else {
                //             v1 = const Icon(Icons.visibility_rounded);
                //             isTextObscure1 = true;
                //           }
                //         });
                //       },
                //       icon: v1,
                //     ),

                //   ],
                // ),
                // Divider(
                //   height: 5,
                //   thickness: 2,
                // ),
                SizedBox(
                  height: 10,
                ),

                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),

                  //color: Colors.blue,
                  width: w * 0.8,
                  height: h * 0.06,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey.shade300,
                    ),
                    child: Text("แก้ไขรหัสผ่าน",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return password();
                      }));
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),

                  //color: Colors.blue,
                  width: w * 0.8,
                  height: h * 0.06,

                  child: ElevatedButton(
                    // style: ElevatedButton.styleFrom(
                    //         primary: Colors.grey.shade100,
                    // ),
                    child: Text("บันทึก",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return homepage();
                      }));
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
