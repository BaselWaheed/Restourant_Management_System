import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled1/resturant_app/login_screen/login_screen.dart';
import 'package:untitled1/shared/components/component.dart';
import 'package:untitled1/shared/remote/cash_helper.dart';
import 'package:untitled1/shared/remote/colors/colors.dart';
//الموديل الي هشتغل عليه
class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    @required this.image,
    @required this.title,
    @required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  //عشان اقدر اتحكم في الصفحات
  var boardingController = PageController();
//---------------------------------------------------
  bool islast = false;
//list of screens of on boarding
  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/a1.PNG',
      title: 'Order Online',
      body: 'Browse The Menu And Order Directly From The Application',
    ),
    BoardingModel(
      image: 'assets/images/a2.PNG',
      title: 'Fast Delivery',
      body: 'Your Order Will Be Immediately Collected And Sent By Our Courier',
    ),
    BoardingModel(
      image: 'assets/images/a3.PNG',
      title: 'Your Choice',
      body: 'Pick Up Delivery at Your Door And Enjoy Groceries',
    ),
  ];
  //فانكشن عشان الضغط بتاع ينقلنا لصفحه تسجيل الدخول
  void submit(){
    CashHelper.saveData(key: 'onBoarding', value: true,).then((value)
    {
      if(value){
        navegateAndReplacement(context, LoginScreen());

      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: [TextButton(onPressed: () {
            submit();
          }, child: Text('Skip',style: TextStyle(
            color:defaultColor,)
          ),)],
        ),
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: PageView.builder(
                        physics: BouncingScrollPhysics(),
                        controller: boardingController,
                        onPageChanged: (int index) {
                          //عشان يعرفنا ان دي اخر صفحه
                          if (index == boarding.length - 1) {
                            setState(() {
                              islast = true;
                            });
                          } else {
                            setState(() {
                              islast = false;
                            });
                          }
                        },
                        itemBuilder: (context, index) =>
                            buildBoardingItem(boarding[index]),
                        itemCount: boarding.length,
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      //باكدج الاون بوردينج
                      SmoothPageIndicator(
                        controller: boardingController,
                        effect: ExpandingDotsEffect(
                          dotColor: Colors.grey,
                          dotHeight: 10,
                          dotWidth: 10,
                          spacing: 5,
                          expansionFactor: 3,
                          activeDotColor: defaultColor,
                        ),
                        count: boarding.length,
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      //الزر الي بينقلنا للصور الاون بوردينج
                      FloatingActionButton(
                        backgroundColor: defaultColor,
                        onPressed: () {
                          if (islast) {
                            submit();
                          } else {
                            boardingController.nextPage(
                                duration: Duration(
                                  milliseconds: 850,
                                ),
                                curve: Curves.fastLinearToSlowEaseIn);
                          }
                        },
                        child: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
//ديزاين الاون بوردينج
  Widget buildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image(image: AssetImage('${model.image}'),fit: BoxFit.cover,),
      SizedBox(
        height: 30,
      ),
      Text(
        '${model.title}',
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 15,
      ),
      Text(
        '${model.body}',
        style: TextStyle(fontSize: 20, color: Colors.grey[500],height: 1.35),
      ),
    ],
  );
}
