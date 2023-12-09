import 'dart:convert';
import 'package:clean/model/token.dart';
import 'package:clean/confirmpage.dart';
import 'package:clean/model/password.dart';
import 'package:clean/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class password extends StatefulWidget {
  const password({super.key});

  @override
  State<password> createState() => _passwordState();
}

class _passwordState extends State<password> {
  
  final formKey = GlobalKey<FormState>();
  //String? _passwordold;
  String? _passwordnew;
  String? _passwordagain;
  //bool passwordObscured1 = true;
  bool passwordObscured2 = true;
  bool passwordObscured3 = true;
  MyGlobalData globalData = MyGlobalData();

  var _formKey = GlobalKey<FormState>();

  void _submitFunc() {
    var isValid = _formKey.currentState?.validate();
    if (isValid != null && isValid) {
      _formKey.currentState?.save();
      print(
          ' passwordnew: $_passwordnew , passwordagain:$_passwordagain');
    }
  }

  Future<void> _postData() async {
      final String apiUrl = 'http://172.20.10.3:8080/api/v1/member/register';

      final response = await http.put(
        Uri.parse(apiUrl),
        body: jsonEncode({
          'passwordnew': _passwordnew!,
          'passwordagian': _passwordagain!,
          
          
        }), // Replace 'text' with your API parameter
        headers: {
          'Content-Type': 'application/json', // Adjust content type as needed
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
    }


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    // Future<void> _postData() async {
    //   try {
    //     final String apiUrl = '';
    //     final response = await http.post(
    //       Uri.parse(apiUrl),
    //       body: jsonEncode({
    //         'passwordnew': _passwordnew.text,
    //         'passwordagain': _passwordagain.text
    //       }),
    //       headers: {
    //         'Content-Type': 'application/json',
    //       },
    //     );
    //     if (response.statusCode == 200) {
    //       final Map<String, dynamic> responseData = json.decode(response.body);
    //       MyGlobalData globalData = MyGlobalData();
    //       globalData.token = responseData['accessToken'];
    //       print(globalData.token);
    //     } else {
    //       print(response.statusCode);
    //       print("หาทางแก้");
    //     }
    //   } catch (error) {
    //     print('Error fetching data: $error');
    //     return null;
    //   }
    // }

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
              return profilepage(globalData.token); 
            }));
          },
          icon: Icon(
            Icons.arrow_circle_left_outlined,
            color: Colors.white,
            size: 40,
          ),
        ),
        //backgroundColor: Theme.of(context).backgroundColor,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      // const Text(
                      //   'รหัสผ่านเดิมของคุณ',
                      //   style: TextStyle(
                      //       fontSize: 22,
                      //       fontWeight: FontWeight.bold,
                      //       color: Colors.black),
                      // ),
                      // TextFormField(
                      //   keyboardType: TextInputType.visiblePassword,
                      //   key: ValueKey(
                      //     'passwordold',
                      //   ),
                      //   obscureText: passwordObscured1,
                      //   decoration: InputDecoration(
                      //     prefixIcon: Icon(
                      //       Icons.key,
                      //     ),
                      //     suffixIcon: IconButton(
                      //         onPressed: () {
                      //           setState(() {
                      //             passwordObscured1 = !passwordObscured1;
                      //           });
                      //         },
                      //         icon: Icon(passwordObscured1
                      //             ? Icons.visibility_off
                      //             : Icons.visibility)),
                      //   ),
                      //   onSaved: (newValue) {
                      //     _passwordold = newValue;
                      //   },
                      //   validator: (value) {
                      //     value = value?.trim();
                      //     if (value!.isEmpty) {
                      //       return "โปรดพิมพ์รหัสผ่านของคุณ";
                      //     }
                      //     if (value!.length < 8) {
                      //       return "โปรดใส่รหัสผ่าน 8 ตัวอักษร";
                      //     }
                      //     // if(value != _password){
                      //     //   return 'รหัสผ่านไม่ถูกต้อง';
                      //     // }
                
                      //     return null;
                      //   },
                      // ),
                      // SizedBox(height: 10,),
                      const Text(
                        'รหัสผ่านใหม่',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        key: ValueKey('passwordnew'),
                        obscureText: passwordObscured2,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.key,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordObscured2 = !passwordObscured2;
                                });
                              },
                              icon: Icon(passwordObscured2
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                        ),
                        onSaved: (newValue) {
                          _passwordnew = newValue;
                        },
                        validator: (value) {
                          _passwordnew = value;
                          value = value?.trim();
                          if (value!.isEmpty) {
                            return "โปรดใส่รหัสผ่านอันใหม่";
                          }
                          if (value!.length < 8) {
                            return "โปรดใส่รหัสผ่าน 8 ตัวอักษร";
                          }
                
                          return null;
                        },
                      ),
                      SizedBox(height: 10,),
                      const Text(
                        'พิมพ์รหัสของคุณอีกครั้ง',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        key: ValueKey('passwordagain'),
                        obscureText: passwordObscured3,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.key,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordObscured3 = !passwordObscured3;
                                });
                              },
                              icon: Icon(passwordObscured3
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                        ),
                        onSaved: (newValue) {
                          _passwordagain = newValue;
                        },
                        validator: (value) {
                          value = value?.trim();
                          if (value!.isEmpty) {
                            return "โปรดพิมพ์รหัสผ่านใหม่อีกตรั้ง";
                          }
                          if (value!.length < 8) {
                            return "โปรดใส่รหัสผ่าน 8 ตัวอักษร";
                          }
                          if (value != _passwordnew) {
                            return 'รหัสผ่านไม่ถูกต้อง';
                          }
                
                          return null;
                        },
                      ),
                      SizedBox(height: 30,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Text("ยืนยัน",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        onPressed: () {
                          _postData();
                          _submitFunc();
                          if (_formKey.currentState?.validate() == true) {
                            // ถ้าถูกต้องให้เปลี่ยนหน้า
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ConfirmComplete();
                            }));
                          }
                
                         
                        },
                      ),
                      
                    ],
                  ),
                ),
              ),
            )),
      ),

    );
  }
}
