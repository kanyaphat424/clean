import 'package:flutter/material.dart';

class calender extends StatefulWidget {
  const calender({super.key});

  @override
  State<calender> createState() => _calenderState();
}

class _calenderState extends State<calender> {
  
  DateTime _dateTime = DateTime.now();
  void _showDatePicker(){
    showDatePicker(
      context: context,
      initialDate: DateTime.now(), 
      firstDate: DateTime(1900), 
      lastDate: DateTime(2025),
      ).then((value) {
        setState(() {
          _dateTime = value!;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(_dateTime.toString(),style: TextStyle(fontSize: 20),),
                MaterialButton(
                    onPressed: _showDatePicker,
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'วัน/เดือน/ปีเกิด',
                        style: TextStyle(color: Colors.white,
                        fontSize: 18,)
                      ),
                    ),
                    color: Colors.blue,
                    
                    ),
              ],
            )));
  }
}
