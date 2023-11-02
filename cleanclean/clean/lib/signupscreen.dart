
import 'package:flutter/material.dart';
class signupscreen extends StatefulWidget {
  const signupscreen({super.key});

  @override
  State<signupscreen> createState() => _signupscreenState();
}

class _signupscreenState extends State<signupscreen> {
  TextEditingController textFormFieldEmail =TextEditingController();
  TextEditingController textFormFieldPassword = TextEditingController();
  bool isTextObscure = true;
  Icon iconPic = const Icon(Icons.visibility_rounded);

  @override
  void dispose(){
    textFormFieldEmail.dispose();
    textFormFieldPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   double w = MediaQuery.of(context).size.width;
   double h = MediaQuery.of(context).size.height;
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Colors.blue,
        
      ),*/
      backgroundColor: Colors.white,
      //appBar: 
      //AppBar(title: Text("  ",style: TextStyle(fontSize: 10 ),),),
      body:ListView(
        children: [
          //SizedBox(height: 20,),
          Container(
            color: Colors.blue,
            width: w,
            height: h*0.2,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("           "),
                Text("           "),
                Text("           "),
                Text("\tลงทะเบียน",style: TextStyle(fontSize: 40 ,fontWeight: FontWeight.bold,color:Colors.white),),
                //Text("หากคุณมีบัญชีแล้ว?",style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold,color:Colors.white),),
                RichText(text: TextSpan(
            text: "\t\tหากคุณมีบัญชีแล้ว?",
            style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold,color:Colors.white),
            children: [
              TextSpan(
            text: "\tเข้าสู่ระบบ",
            style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold,color:Colors.yellowAccent),),]
          ),),
              ],
            ) ,
          ),
         
          Container(
            margin: const EdgeInsets.only(left: 20,right: 20),
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              SizedBox(height: 10,),
              Text("ชื่อ",style: TextStyle(fontSize: 18,color: Colors.black),),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 7,
                      offset: Offset(1, 1),
                      color: Colors.grey.withOpacity(0.3)
                      
                    )
                  ]
                ),
                
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "กำหนดชื่อของคุณ",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white,width: 1.0)
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
                ),
                
              ),
              SizedBox(height: 10,),
              Text("เบอร์โทรศัพท์",style: TextStyle(fontSize: 18,color: Colors.black),),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 7,
                      offset: Offset(1, 1),
                      color: Colors.grey.withOpacity(0.3)
                    )
                  ]
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "ป้อนเบอร์โทรศัพท์ของคุณ",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white,width: 1.0)
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text("อีเมลล์",style: TextStyle(fontSize: 18,color: Colors.black),),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 7,
                      offset: Offset(1, 1),
                      color: Colors.grey.withOpacity(0.3)
                    )
                  ]
                ),
                child: TextField(
                  controller: textFormFieldEmail,
                  decoration: InputDecoration(
                    hintText: "ป้อนอีเมลล์ของคุณ",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white,width: 1.0)
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text("รหัสผ่าน",style: TextStyle(fontSize: 18,color: Colors.black),),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      offset: Offset(1, 1),
                      color: Colors.grey.withOpacity(0.3)
                    )
                  ]
                ),
                child: TextField(
                  controller: textFormFieldPassword,
                  decoration: InputDecoration(
                    
                    hintText: "ป้อนรหัสผ่าน",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white,width: 1.0)
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
                  obscureText: isTextObscure,
                ),
              ),
              
            ],),
           
          ),
          SizedBox(height: 30,),

          Container(
            margin: const EdgeInsets.only(left: 20,right: 20),
            
            //color: Colors.blue,
            width: w*0.9,
            height: h*0.06,
            
            
            child:ElevatedButton(child: Text("ลงทะเบียน",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white)),onPressed: (){

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
                              color: Colors.grey.withOpacity(0.3))
                        ]
                        ),
            
          ),
         
        ],

      )
    );
  }
}