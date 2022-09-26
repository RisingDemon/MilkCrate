import 'package:dsmp/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Firsts extends StatelessWidget{
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
     // TODO: implement build
    return getlist();
  }
}
Widget getlist()
{
  var listview =ListView(
    children: <Widget>[
      DrawerHeader(
        child: Image.asset('images/milk.png'),
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
              Color.fromRGBO(53, 133, 139, 0.8),
              Color.fromRGBO(79, 189, 186, 0.8)

            ])
        ),
      ),
      Builder(
          builder: (context) {
            return ListTile(
              leading:  const Icon(Icons.logout, size: 33.0,),
              contentPadding: const EdgeInsets.all(10.0),
              title: const Text("logout",style: TextStyle(fontSize: 23.0),),
              onTap: ()async
              {
                //await auth.signOut();
                 await FirebaseAuth.instance.signOut() ;
                Navigator.pushReplacement(context, MaterialPageRoute(
                   builder: (BuildContext context)=>const MyApp()));
                debugPrint("logout");
              } ,
            );
          }
      ),
      Container(
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide())
        ),
      ),
      ListTile(
        leading: const Icon(Icons.feedback_outlined ,size: 33.0,),
        contentPadding: const EdgeInsets.all(10.0),
        title: const Text("Feedback",style: TextStyle(fontSize: 23.0),),
        onTap: (){
          debugPrint("Thanks for feedback");
        },
      ),
      Container(
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide())
        ),
      ),

      ListTile(
        leading: const Icon(Icons.help_outline, size: 33.0,),
        contentPadding: const EdgeInsets.all(10.0),
        title: const Text("Help",style: TextStyle(fontSize: 23.0),),
        onTap: (){
          debugPrint("help");
        },
      ),
      Container(
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide())
        ),
      ),
      ListTile(
        leading: const Icon(Icons.settings, size: 33.0,),
        contentPadding: const EdgeInsets.all(10.0),
        title: const Text("Settings",style: TextStyle(fontSize: 23.0),),
        onTap: (){
          debugPrint("settings");
        },
      ),
      Container(
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide())
        ),
      )
    ],
  );
  return listview;
}