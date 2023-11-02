import 'package:clean/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onboarding extends StatefulWidget {
  const onboarding({Key? key}) : super(key: key);

  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {

  PageController _controller = PageController();
  //keep track of if we are on the last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index){
              setState(() {
                onLastPage = (index ==2);
              });
            },
            children: [
              // หน้า1
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/electrician_image.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // หน้า2
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/plumber_image.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // หน้า3
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/air_image.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Container(
              alignment: Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      _controller.jumpToPage(2);
                      
                    },
                    child: Text("เริ่ม",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)
                            ),
                            
                  ),
                  SmoothPageIndicator(controller: _controller, count: 3),
                  onLastPage?
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return loginscreen();
                      },),);
                      //_controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn,);
                    },
                    
                    child: Text("เข้าสู่ระบบ",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  )
                  : GestureDetector(
                    onTap: () {
                      _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn,);
                    },
                    child: Text("ถัดไป",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  
                ],
              )),
        ],
      ),
    );
    
    
  }
}
