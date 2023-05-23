import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class intro extends StatefulWidget {
  intro({Key? key}) : super(key: key);

  @override
  State<intro> createState() => _introState();
}
//////////////////////////////
///color

/////////////////////////////////////

class _introState extends State<intro> {
  void showMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Colors.white,
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'رسالة',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'مرحبا بك في تطبيق روياتي يمكنك اضافة روياتك في التطبيق من خلال الزر + في اعلئ القائمة كما يمكنك مشاركة الرويات الي من تحب اضغط مطولا علئ اي قصة لحذفها استمتع  ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'حسنا',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.purple,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(vertical: 16.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  final List<PageViewModel> pages = [

    PageViewModel(

      title: 'مرحبا',
      body: 'مرحبا بك في تطبيق القصص المتنوع',
      image: Image.asset('asst/app/p1.jpg'),
      decoration: const PageDecoration(
        pageColor:Color(0xFF2D4A8E),
        bodyTextStyle: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 35.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    PageViewModel(
      title: 'القصص',

      body: 'يحتوي البرنامج علئ قصص متنوعة ومفيدة',
      image: Center(
        child: Image.asset('asst/app/p2.jpg'),
      ),
      decoration: const PageDecoration(
       pageColor  :  Color(0xFF96BBB3),
        bodyTextStyle: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 35.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    PageViewModel(
      title: 'Thinks',
      body: 'شكرا لاختيارك تطبيقنا! ابدا الاستخدام الان',
      image: Center(
        child: Image.asset('asst/app/p3.jpg'),
      ),
      decoration: const PageDecoration(
        pageColor:Color(0xFFEFFAFD),
        bodyTextStyle: TextStyle(
          fontSize: 20.0,
        ),
        titleTextStyle: TextStyle(
          fontSize: 35.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مرحبا ^_^'),
        centerTitle: true,
      ),
      body: IntroductionScreen(
        globalBackgroundColor: Colors.purple,
        pages: pages,
bodyPadding: EdgeInsets.only(bottom: 10),
        dotsDecorator: const DotsDecorator(
          size: Size(15, 15),

          color: Colors.blue,
          activeSize: Size.square(20),
          activeColor: Colors.red,
        ),
        showDoneButton: true,
        done: const Text(
          'انهاء',
          style: TextStyle(fontSize: 25 ,color: Colors.orange,fontWeight: FontWeight.bold,),
        ),
        showSkipButton: true,
        skip: const Text(
          'تخطي',
          style: TextStyle(fontSize: 25,color: Colors.greenAccent,fontWeight: FontWeight.bold,),
        ),
        showNextButton: true,
        next: const Icon(Icons.arrow_circle_left, size: 35,color: Colors.white),
        onDone: () => onDone(context),
        curve: Curves.bounceOut,
        dotsFlex: 3,
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
     await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) =>  const ahome()));
        showMessage(context);
  }
}
