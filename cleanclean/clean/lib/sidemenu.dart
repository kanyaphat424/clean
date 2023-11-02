import 'package:flutter/material.dart';
class sidemenu extends StatelessWidget {
  const sidemenu({super.key});
  //final Padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white,
        child: ListView(
          //padding: Padding,
          children: <Widget>[
            const SizedBox(height: 30),
            buildMenuItem(
              text:'ข้อมูลส่วนตัว',
              icon:Icons.person,  
            ),
            Divider(height: 5,thickness: 1,),
            const SizedBox(height: 30),
            buildMenuItem(
              text:'ตั้งค่า',
              icon:Icons.settings,
            ),
            Divider(height: 5,thickness: 1,),
            const SizedBox(height: 30),
            buildMenuItem(
              text:'การแจ้งเตือน',
              icon:Icons.mail,
            ),
            Divider(height: 5,thickness: 1,),
            const SizedBox(height: 30),
            buildMenuItem(
              text:'ออกจากระบบ',
              icon:Icons.door_front_door,
            ),
            Divider(height: 5,thickness: 1,),
          ],
        ),
      ),
    );
  }
  Widget buildMenuItem({
    required String text,
    required IconData icon,
  

  }) {
    final Color = Colors.black;
    final hoverColor = Colors.white70;


    return ListTile(
      leading: Icon(icon,color: Colors.blue,),
      title: Text(text,style: TextStyle(color: Color)),
      hoverColor: hoverColor,
     // onTap: onClicked,

    );
  }
}