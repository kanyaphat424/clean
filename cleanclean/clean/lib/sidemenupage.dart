import 'package:clean/profilepage.dart';
import 'package:flutter/material.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        backgroundColor: Colors.blue,
      ),
      //เพิ่มอันนี้ก่อนเชื่อกับเกด
      drawer: const NavigationDrawer(),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItem(context),
            ],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
      );
  Widget buildMenuItem(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              leading: const Icon(
                Icons.home_outlined,
                color: Colors.blue,
                size: 35,
              ),
              title: const Text('Home',style: TextStyle(fontSize: 20, color: Colors.black),),
              onTap: () {},
            ),
            const Divider(
              height: 5,
              thickness: 1,
            ),
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.blue,
                size: 35,
              ),
              title: const Text(
                'ข้อมูลส่วนตัว',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) {
          return profilepage();
        }));
              },
            ),
            const Divider(
              height: 5,
              thickness: 1,
            ),
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.blue,
                size: 35,
              ),
              title: const Text(
                'ตั้งค่า',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              onTap: () {},
            ),
            const Divider(
              height: 5,
              thickness: 1,
            ),
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(
                Icons.door_front_door_outlined,
                color: Colors.redAccent,
                size: 35,
              ),
              title: const Text(
                'ออกจากระบบ',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              onTap: () {},
            ),
            const Divider(
              height: 5,
              thickness: 1,
            ),
            const SizedBox(height: 30),
          ],
        ),
      );
}
