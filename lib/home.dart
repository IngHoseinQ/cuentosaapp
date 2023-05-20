import 'package:cuentosaapp/pages/botom.dart';
import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';
import 'package:url_launcher/url_launcher.dart';
import 'pages/screen/add_stor.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ahome extends StatefulWidget {
  const ahome({Key? key}) : super(key: key);

  @override
  State<ahome> createState() => _ahomeState();
}

class _ahomeState extends State<ahome> {
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
                  'مرحبا يمكنك اضافة روياتك في التطبيق من خلال الزر + في اعلئ القائمة كما يمكنك مشاركة الرويات الي من تحب اضغط مطولا علئ اي قصة لحذفها استمتع  ',
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
  void showMessageabout(BuildContext context) {
    const String name = "Hossein Ahmed Qasspa";
    const String email = "hq84068@gmail.com";
    Future<void> launchEmail() async {
      final Uri params = Uri(
        scheme: 'mailto',
        path: 'hq84068@gmail.com',
        query: 'subject=Hello&body=World!',
      );
      final email = params.toString();
      if (await canLaunch(email)) {
        await launch(email);
      } else {
        throw 'Could not launch email';
      }
    }
    Future<void> launchTelegram() async {
      const url = 'https://t.me/O_2_y';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch Telegram';
      }
    }
    Future<void> launchFacebook() async {
      const url = 'https://www.facebook.com/hossein.qasspa';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch Facebook';
      }
    }
    const String whatsappUrl = "https://wa.me/qr/GQWUIHZPCU67B1";


    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 8.0,
          backgroundColor: Colors.white,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "BY $name",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 16.0),
                Text("Email: $email"),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.email, color: Colors.orange),
                      onPressed: () async => await launchEmail(),
                    ),
                    IconButton(
                      icon: Icon(Icons.facebook, color: Colors.blueAccent),
                      onPressed: () async => await launchFacebook(),
                    ),
                    IconButton(
                      icon: Icon(Icons.telegram, color: Colors.blue),
                      onPressed: () async => await launchTelegram(),
                    ),
                    IconButton(
                      icon: Icon(Icons.perm_phone_msg, color: Colors.green),
                      onPressed: () async => await launch(whatsappUrl),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    "Close",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
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
  @override
  Widget build(BuildContext context) {
    return

      BackdropScaffold(
      appBar: BackdropAppBar(

        title: const Text('روايتي'),
        actions: <Widget>[
IconButton(
    icon: Icon(Icons.add),
     onPressed:(){
       Navigator.push(
           context,
           MaterialPageRoute(
               builder: (context) => AddStoryScreen()));
  },
),
        ],

        centerTitle: true,

      ),

      backLayer: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: CircleAvatar(
                backgroundImage: Image.asset(
                  "asst/app.png",
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ).image,
                minRadius: 120,
              ),
            ),
          ),
  Center(
    child: Text(
      'مرحبا بكم في تطبيقنا المتواضع نرجو ان ينال اعجابكم ',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
    ),
  ),
SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.help, color: Colors.white),
            title: Text(
              'المساعدة',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
onTap: (){
  showMessage(context);
},
          ),
              ListTile(
                leading: Icon(Icons.app_shortcut,color:Colors.white),
                title: Text('عن التطبيق',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold , fontSize: 20.0,)),
                onTap: () {
                  showMessageabout(context);
                },
              ),
        ],
      ),

      frontLayer:  MyHomePage(),

        );


  }
}
