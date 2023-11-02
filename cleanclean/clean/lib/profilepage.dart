import 'package:flutter/material.dart';

enum ProductTypeEnum { Male,Female }

class profilepage extends StatefulWidget {
  const profilepage({super.key});

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  //TextEditingController textFormFieldEmail =TextEditingController();
  TextEditingController textFormFieldPassword = TextEditingController();
  bool isTextObscure = true;
  Icon iconPic = const Icon(Icons.visibility_rounded);
  ProductTypeEnum? _productTypeEnum;

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
        appBar: AppBar(
          title: Text(
            "โปรไฟล์ของคุณ",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: ListView(
          children: [
            //SizedBox(height: 30,),
            Container(
              color: Colors.blue,
              width: w,
              height: h * 0.2,
              child: Column(),
            ),

            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ชื่อ-นามสกุล ของคุณ",
                    style: TextStyle(fontSize: 18, color: Colors.black),
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
                              color: Colors.grey.withOpacity(0.2))
                        ]),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "ชื่อ-นามสกุล",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          prefixIcon: Icon(
                            Icons.person_2_outlined,
                            color: Colors.blue,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "เพศ",
                    style: TextStyle(fontSize: 18, color: Colors.black),
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
                        ]),),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<ProductTypeEnum>(
                            contentPadding: EdgeInsets.all(0.0),
                            tileColor: Colors.blue.shade100,
                            value: ProductTypeEnum.Female,
                            groupValue: _productTypeEnum,
                            dense: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)
                            ),
                            
                            title: Text(ProductTypeEnum.Female.name),
                            onChanged: (val) {
                              setState(() {
                                _productTypeEnum = val;
                              });
                            }
                            ),
                      ),
                      SizedBox(width: 5.0,),
                      Expanded(
                        child: RadioListTile<ProductTypeEnum>(
                            contentPadding: EdgeInsets.all(0.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)
                            ),
                            tileColor: Colors.blue.shade100,
                            dense: true,
                            value: ProductTypeEnum.Male,
                            groupValue: _productTypeEnum,
                            title: Text(ProductTypeEnum.Male.name),
                            onChanged: (val) {
                              setState(() {
                                _productTypeEnum = val;
                              });
                            }),
                      ),
                    ],
                  ),

                  //เมลล์
                  Text(
                    "อีเมลล์",
                    style: TextStyle(fontSize: 18, color: Colors.black),
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
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "ใส่อีเมลล์ของคุณที่นี่",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Colors.blue,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //เปลี่ยนรหัสผ่าน
                  Text(
                    "เปลี่ยนรหัสผ่าน",
                    style: TextStyle(fontSize: 20, color: Colors.black),
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
                      controller: textFormFieldPassword,
                      decoration: InputDecoration(
                          hintText: "ใส่รหัสผ่านปัจจุบันของคุณที่นี่",
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
                                  if (isTextObscure) {
                                    iconPic = const Icon(
                                        Icons.visibility_off_rounded);
                                    isTextObscure = false;
                                  } else {
                                    iconPic =
                                        const Icon(Icons.visibility_rounded);
                                    isTextObscure = true;
                                  }
                                });
                              },
                              icon: iconPic),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      obscureText: isTextObscure,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //รหัสผ่านใหม่
            Text(
              "รหัสผ่านใหม่",
              style: TextStyle(fontSize: 20, color: Colors.black),
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
                controller: textFormFieldPassword,
                decoration: InputDecoration(
                    hintText: "รหัสผ่านใหม่",
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
                            if (isTextObscure) {
                              iconPic =
                                  const Icon(Icons.visibility_off_rounded);
                              isTextObscure = false;
                            } else {
                              iconPic = const Icon(Icons.visibility_rounded);
                              isTextObscure = true;
                            }
                          });
                        },
                        icon: iconPic),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                obscureText: isTextObscure,
              ),
            ),

            SizedBox(
              height: 10,
            ),

            //พิมพ์รหัสผ่านใหม่อีกครั้งเพื่อยืนยัน
            Text(
              "พิมพ์รหัสผ่านใหม่อีกครั้งเพื่อยืนยัน",
              style: TextStyle(fontSize: 20, color: Colors.black),
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
                controller: textFormFieldPassword,
                decoration: InputDecoration(
                    hintText: "รหัสผ่านใหม่เพื่อยืนยัน",
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
                            if (isTextObscure) {
                              iconPic =
                                  const Icon(Icons.visibility_off_rounded);
                              isTextObscure = false;
                            } else {
                              iconPic = const Icon(Icons.visibility_rounded);
                              isTextObscure = true;
                            }
                          });
                        },
                        icon: iconPic),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                obscureText: isTextObscure,
              ),
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
        ));
  }
}
