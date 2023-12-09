// import 'package:clean/model/aee.dart';
// import 'package:clean/model/token.dart';
// import 'package:flutter/material.dart';

// import 'dart:convert';
// import 'package:http/http.dart' as http;


// class Reservation extends StatefulWidget {
//   String token = "";

//   Reservation(this.token, {Key? key}) : super(key: key);

//   @override
//   State<Reservation> createState() => _ReservationState(token: token);
// }

// class _ReservationState extends State<Reservation> {
//   String token;

//   _ReservationState({required this.token});

//   TextEditingController _id = TextEditingController();
//   TextEditingController _email = TextEditingController();
//   TextEditingController _first_name = TextEditingController();
//   TextEditingController _last_name = TextEditingController();

//   bool isTextObscure1 = true;
//   Icon v1 = const Icon(Icons.visibility_rounded);

//   Reserve reserve = Reserve(
//     id: "", 
//     email: "", 
//     first_name: "", 
//     last_name: ""
//     );


//   Future<void> _postData() async {
//     MyGlobalData globalData = MyGlobalData();
//     String myValue = globalData.token.trim();
//     print(myValue);
//     print("-----------");
//     try {
//       const String apiUrl =
//           'https://reqres.in/api/users/2';
//       final response = await http.get(
//         Uri.parse(apiUrl),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $myValue',
//         },
//       );
//       print(response.statusCode);
//       if (response.statusCode == 200) {
//         final Map<String, dynamic>? responseData = json.decode(response.body);

//         if (responseData != null) {
//           setState(() {
//             reserve = Reserve(
//                 id: responseData['id'],
//                 email: responseData['email'],
//                 first_name: responseData['first_name'],
//                 last_name: responseData['last_name']);
//           });
//         } else {
//           // กรณี API ส่งข้อมูลที่ไม่ถูกต้อง
//           print("Invalid JSON data");
//         }
//       } else {
//         print("Error: ${response.statusCode}");
//         print("Error: ${response.body}");
//       }
//     } catch (error) {
//       print("Error: $error");
//     }
//   }

//   @override
//   void initState() {
//     _postData();
//     super.initState();
//   }

//   bool isReservationContentVisible = false;

//   void toggleReservationContentVisibility() {
//     setState(() {
//       isReservationContentVisible = !isReservationContentVisible;
//     });
//   }

//   int currentIndex = 0;

//   // Function to handle tab selection
//   void _onItemTapped(int index) {
//     setState(() {
//       currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "การจอง",
//           style: TextStyle(
//             fontSize: 25,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {},
//           icon: const Icon(
//             Icons.arrow_circle_left_outlined,
//             color: Colors.blue,
//             size: 40,
//           ),
//         ),
//         backgroundColor: Colors.white,
//       ),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
//         child: ListView(
//           children: [
//             const Row(
//               children: [
//                 Text(
//                   "กำลังดำเนินการ",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             // The reservation content you mentioned
//             // Visibility(
//             //   visible: isReservationContentVisible,
//             //   child: _ReservationContent(),
//             // ),
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: 275,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(color: Colors.blue.shade300),
//                 borderRadius: const BorderRadius.only(
//                   bottomLeft: Radius.circular(35),
//                   bottomRight: Radius.circular(35),
//                   topLeft: Radius.circular(5),
//                   topRight: Radius.circular(35),
//                 ),
//               ),
//               child: Container(
//                 padding: const EdgeInsets.only(left: 20, top: 10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       //ตรงนี้บอกbookingID
//                       reserve.id,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                         fontSize: 18,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     const Text(
//                       "เวลาการทำงาน",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                         fontSize: 18,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       //ตรงนี้จะบอกเวลา
//                       reserve.id,
//                       style: TextStyle(color: Colors.grey, fontSize: 18),
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     const Text(
//                       "สถานที่",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                         fontSize: 18,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       //ตรงนี้บอกโล
//                       reserve.last_name,
//                       style: TextStyle(color: Colors.grey, fontSize: 18),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.blue.shade100,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         minimumSize: const Size(330, 55),
//                       ),
//                        onPressed: () {},
//                        //{
//                       //   Navigator.push(context,
//                       //       MaterialPageRoute(builder: (context) {
//                       //     return ("");
//                       //   }));
//                       //   // toggleReservationContentVisibility();
//                       // },
//                       child: Text(
//                         "ดูรายละเอียด",
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.blue.shade400,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget _buildButton(String text, VoidCallback onPressed) {
//   return ElevatedButton(
//     style: ElevatedButton.styleFrom(
//       primary: Colors.blue.shade100,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       minimumSize: const Size(150, 50),
//     ),
//     onPressed: onPressed,
//     child: Center(
//       child: Text(
//         text,
//         style: TextStyle(
//           fontSize: 18,
//           color: Colors.blue.shade400,
//           fontWeight: FontWeight.bold,
//         ),
//         textAlign: TextAlign.center,
//       ),
//     ),
//   );
// }