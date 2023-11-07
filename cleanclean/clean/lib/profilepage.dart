import 'package:flutter/material.dart';

class profilepage extends StatefulWidget {
  const profilepage({super.key});

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  TextEditingController textFormFieldPassword = TextEditingController();
  bool isTextObscure = true;
  Icon iconPic = const Icon(Icons.visibility_rounded);

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
                      "อยากลาออก เดี๋ยวนี้",
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
                const Row(
                  children: [
                    Icon(
                      Icons.home,
                      size: 24,
                      color: Colors.blue,
                    ),
                    Text(
                      "123/45 ต.นอกโลก อ.ดวงอังคาร จ.จักรวาล 45678",
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
                      "0912345678",
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
                      "01/01/1999",
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
                      "ชาย",
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
                  "อีเมลล์",
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
                      "sommut000@gmail.com",
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
                  mainAxisAlignment:MainAxisAlignment.spaceBetween, // ให้ Icon อยู่ท้าย Text
                  children: [
                    Icon(
                      Icons.key,
                      size: 24,
                      color: Colors.blue,
                    ),
                    Text(
                      "kikiki0000",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (isTextObscure) {
                            iconPic = const Icon(Icons.visibility_off_rounded);
                            isTextObscure = false;
                          } else {
                            iconPic = const Icon(Icons.visibility_rounded);
                            isTextObscure = true;
                          }
                        });
                      },
                      icon: iconPic,
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
                  mainAxisAlignment:MainAxisAlignment.spaceBetween, // ให้ Icon อยู่ท้าย Text
                  children: [
                    Icon(
                      Icons.key,
                      size: 24,
                      color: Colors.blue,
                    ),
                    Text(
                      "kukuku1111",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (isTextObscure) {
                            iconPic = const Icon(Icons.visibility_off_rounded);
                            isTextObscure = false;
                          } else {
                            iconPic = const Icon(Icons.visibility_rounded);
                            isTextObscure = true;
                          }
                        });
                      },
                      icon: iconPic,
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
                  mainAxisAlignment:MainAxisAlignment.spaceBetween, // ให้ Icon อยู่ท้าย Text
                  children: [
                    Icon(
                      Icons.key,
                      size: 24,
                      color: Colors.blue,
                    ),
                    Text(
                      "kukuku1111",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (isTextObscure) {
                            iconPic = const Icon(Icons.visibility_off_rounded);
                            isTextObscure = false;
                          } else {
                            iconPic = const Icon(Icons.visibility_rounded);
                            isTextObscure = true;
                          }
                        });
                      },
                      icon: iconPic,
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
                    onPressed: () {},
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
