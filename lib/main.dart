import 'package:cuentosaapp/pages/db/prodb.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'Start.dart';
import 'package:shared_preferences/shared_preferences.dart';



/// This is the main method of app, from here execution starts./// ///
bool show =true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 database_st();
  final prefs = await SharedPreferences.getInstance();
   show = prefs.getBool('ON_BOARDING') ?? true;
  runApp(const Myapp());
}

/// App widget class.
class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
        primarySwatch: Colors.purple,
    ),
        home: Directionality( // add this
        textDirection: TextDirection.rtl,
          //child: AddStoryScreen(),
        child: show ? intro() :  const ahome(),
       // child:  intro(),
        ),
    );
  }
}


