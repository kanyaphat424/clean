import 'package:clean/sidemenupage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ProductTypeEnum { English,Thai }


class settingpage extends StatefulWidget {
  const settingpage({super.key});

  @override
  State<settingpage> createState() => _settingpageState();
}

class _settingpageState extends State<settingpage> {
  ProductTypeEnum? _productTypeEnum;
  bool valNotify1 = true;
  bool valNotify2 = false;

  onChangFunction1(bool newValue1){
    setState(() {
      valNotify1 = newValue1;
    });
  }
  onChangFunction2(bool newValue2){
    setState(() {
      valNotify2 = newValue2;
    });
  }

  @override
  Widget build(BuildContext context) {
   double w = MediaQuery.of(context).size.width;
   double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ตั้งค่า",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color:Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
          return homepage();
        }));
          },
          icon: Icon(
            Icons.arrow_circle_left_outlined,
            color: Colors.blue,
          size: 40,),
        ),
        backgroundColor: Colors.white,
      ),
      
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         SizedBox(height: 20.0,),
         Text("\t\tภาษา",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:Colors.black), ),
         SizedBox(height: 10.0,),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        /*boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(0.3))
                        ]*/
                        ),),
                        Divider(height: 5,thickness: 1,),
                        SizedBox(height: 10.0,),

                        
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<ProductTypeEnum>(
                            contentPadding: EdgeInsets.all(0.0),
                            tileColor: Colors.white,
                            
                            
                            value: ProductTypeEnum.Thai,
                            groupValue: _productTypeEnum,
                            dense: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)
                            ),
                            
                            title: Text(ProductTypeEnum.Thai.name,style: const TextStyle(fontSize: 18)),
                            
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
                            tileColor: Colors.white,
                            dense: true,
                            value: ProductTypeEnum.English,
                            groupValue: _productTypeEnum,
                            title: Text(ProductTypeEnum.English.name,style: const TextStyle(fontSize: 18),),
                            onChanged: (val) {
                              setState(() {
                                _productTypeEnum = val;
                              });
                            }),
                      ),

      ],
      ),
      SizedBox(height: 10.0,),
      Row(children: [
        SizedBox(width: 10,),
        Text("การแจ้งเตือน",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:Colors.black),)
      ],),
      Divider(height: 20,thickness: 1,),
      SizedBox(height: 10,),
      buildNotification("กิจกรรมเกี่ยวกับการจอง",valNotify1,onChangFunction1),
      buildNotification("การแจ้งเตือนเกี่ยวกับอีเมล",valNotify2,onChangFunction2),


      
       SizedBox(height: 350,),

          Container(
            
            margin: const EdgeInsets.only(left: 20,right: 20),
            
            //color: Colors.blue,
            width: w*0.9,
            height: h*0.06,
            
            
            child:ElevatedButton(child: Text("บันทึก",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white)),onPressed: (){

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
      
      ),   
               
    );
    
  }
  Padding buildNotification(String title,bool value,Function onChangedMethod){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black),),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: Colors.blue,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue){
                onChangedMethod(newValue);
              }

            ),

          )


        ],
      ),);
      
  }
}