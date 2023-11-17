import 'package:clean/model/admincustomerdetail.dart';
import 'package:flutter/material.dart';

class customerdetail extends StatefulWidget {
  const customerdetail({super.key});

  @override
  State<customerdetail> createState() => _customerdetailState();
}

class _customerdetailState extends State<customerdetail> {
  Admincustomerid admincustomerid = Admincustomerid(
    customerid: "E001",
    fname: "อยากลาออก ",
    lname: "เดี๋ยวนี้",
    phone: "0912345678",
    email: "summut000@gmail.com",
  );
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            
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
                          color: Colors.black,
                          size: 40,
                        ),
                        onPressed: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return homepage();
                          // }));
                        },
                      ),
                      // SizedBox(height: 20),
                      Text(
                        "\t\t\t\t\t\t\t\t\tรายละเอียดลูกค้า",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 700,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.blue.shade300),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(35),
                      ),
                    ),

                    margin: const EdgeInsets.only(left: 20, right: 20),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                      //     Image(
                      //   image: AssetImage("assets/woman.png"),
                      //   width: 140,
                      //   height: 140,
                      // ),
                      
                        ),

                        Center(
                          child: Image(
                          image: AssetImage("assets/profile.png"),
                          width: 140,
                          height: 140,
                                              ),
                        ),
                        SizedBox(height: 20,),
                        
                        const Text(
                          "ID ลูกค้า",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              size: 24,
                              color: Colors.blue,
                            ),
                            Text(
                              admincustomerid.customerid,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ],
                        ),
                        Divider(
                          height: 5,
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "ชื่อ",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              size: 24,
                              color: Colors.blue,
                            ),
                            Text(
                              admincustomerid.fname,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ],
                        ),
                        Divider(
                          height: 5,
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "นามสกุล",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              size: 24,
                              color: Colors.blue,
                            ),
                            Text(
                              admincustomerid.lname,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ],
                        ),
                        Divider(
                          height: 5,
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 20,
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
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.phone,
                              size: 24,
                              color: Colors.blue,
                            ),
                            Text(
                              admincustomerid.phone,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ],
                        ),
                        Divider(
                          height: 5,
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 20,
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
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.mail,
                              size: 24,
                              color: Colors.blue,
                            ),
                            Text(
                              admincustomerid.email,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ],
                        ),
                        Divider(
                          height: 5,
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                      // Image(
                      //   image: AssetImage("assets/woman.png"),
                      //   width: 140,
                      //   height: 140,
                      // )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
