import 'package:dsmp/screens/read.dart';
import 'package:flutter/material.dart';
import 'package:dsmp/screens/firstscreen.dart';
class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
final String name="raj";

  DateTime dateTime= DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  Drawer(child: Firsts()),
      appBar: AppBar(

        title: const Text("Milk Crate"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("images/h2.png"),
                fit: BoxFit.cover
            )
        ),
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.all(48.0),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 350,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                    color: Colors.white
                  ),
                 child: Row(
                   children: [
                     const SizedBox(
                       height: 50,
                       width: 40,
                     ),
                     GestureDetector(
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>read(dateTime: DateTime.now(),)));
                       },
                       child: Material(
                         borderRadius: BorderRadius.circular(20),
                         elevation: 20,
                         child: Container(
                           height: 200,
                           width: 140,
                           decoration: BoxDecoration(
                               color: Colors.blue.shade100,
                               image: const DecorationImage(image: AssetImage("images/analyze.png"),
                                   fit: BoxFit.contain,),
                               borderRadius: BorderRadius.circular(20)
                           ),
                         ),
                       ),
                     ),
                    const SizedBox(
                     height: 50,
                      width: 40,
                          ),

                     GestureDetector(
                       onTap: (){
                         showDatePicker(context: context,
                             initialDate: DateTime.now(),
                             firstDate: DateTime(1980),
                             lastDate: DateTime(2025)).then(((date){
                           setState(() {
                             dateTime= date!;
                             Navigator.push(context,
                                 MaterialPageRoute(builder: (context)=>read(dateTime:dateTime)));
                           });
                         }));
                       },
                       child: Material(
                         borderRadius: BorderRadius.circular(20),
                         elevation: 60,
                         child: Container(
                           height: 200,
                           width: 140,
                           decoration: BoxDecoration(
                               image: const DecorationImage(image: AssetImage("images/cl.png"),
                                 fit: BoxFit.contain,),
                               color: Colors.blue.shade100,
                               borderRadius: BorderRadius.circular(20)
                           ),
                         ),
                       ),
                     ),
                     const SizedBox(
                       height: 50,
                       width: 40,
                     ),
                   ],
                 ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
