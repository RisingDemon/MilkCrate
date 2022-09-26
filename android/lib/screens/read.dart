import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dsmp/firestore/Buckets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsmp/firestore/filed.dart';
import 'package:intl/intl.dart';
class read extends StatefulWidget {
 // const read({Key? key}) : super(key: key);
 DateTime dateTime;
 read({required this.dateTime});
  @override

  State<read> createState()=>_readState(dateTime);
  //{
  //  return _readState(dateTime);
  //}
}

class _readState extends State<read> {
User? user=FirebaseAuth.instance.currentUser;
String dairyid="dairy";
DateTime dateTime;
_readState(this.dateTime);
DateTime now= DateTime.now();
late String date=DateFormat('dd-M-yyyy').format(dateTime).toString();




void getdata()async{
  var vari= await FirebaseFirestore.instance.collection("dairyIds")
      .doc(user!.uid).get();

  //late int month1= now.month.toInt();
  setState(() {
    dairyid=vari.data()!['dairyId'];
  });
}
@override
  void initState(){
  getdata();
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
       // backgroundColor: Image.asset('images/h2.png').color,
        body:  SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image:AssetImage("images/t.png"),
                  fit: BoxFit.cover),
            ),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection(buckets.dairy)
                  .doc(dairyid).collection(field.farmer)
                  .doc(user!.uid).collection("milkDates")
                  .doc(date).collection("dayTime")
                  .snapshots(),
              builder: (context,AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>> snapshot)
              {
                if(snapshot.hasData && snapshot.data!= null)
                {
                  if(snapshot.data!.docs.isNotEmpty){
                    return ListView.separated(itemBuilder: (____, int index){
                      Map<String,dynamic>docData=
                      snapshot.data!.docs[index].data();
                      if(docData.isEmpty){
                        return const Text("Document empty");
                      }

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green.shade200
                        ),
                        child:Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(docData[field.daytime].toString(),style: const TextStyle(fontSize: 22),),
                        ) ,
                      ),
                          const SizedBox(
                            height: 10,
                          ),
                      Container(
                       // width: MediaQuery.of(context).size.width*0.9,
                        color: Colors.white,
                        child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //Text(docData[field.daytime].toString(),style: TextStyle(fontSize: 22),),
                            const Text("Buffalo milk fat",style: TextStyle(fontSize: 22),),
                            Text(docData[field.bmilkfat].toString(),style: TextStyle(fontSize: 22),),
                          ],
                        ),

                        ),
                      ),
                          Container(
                            decoration: const BoxDecoration(
                                border: Border(bottom: BorderSide())
                            ),
                          ),
                          Container(
                            color: Colors.blue.shade200,
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  // Text(docData[field.daytime].toString(),style: TextStyle(fontSize: 22),),
                                  Text("buffalo milk Quantity",style: TextStyle(fontSize: 22),),
                                  Text(docData[field.bmilkquant].toString(),style: TextStyle(fontSize: 22),),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                border: Border(bottom: BorderSide())
                            ),
                          ),
                          Container(
                            color: Colors.blue.shade300,
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  // Text(docData[field.daytime].toString(),style: TextStyle(fontSize: 22),),
                                  Text("buffalo milk Rate",style: TextStyle(fontSize: 22),),
                                  Text(docData[field.bmilkrate].toString(),style: TextStyle(fontSize: 22),),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                border: Border(bottom: BorderSide())
                            ),
                          ),
                          Container(
                            color: Colors.blue.shade50,
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                //  Text(docData[field.daytime].toString(),style: TextStyle(fontSize: 22),),
                                  const Text("Cow milk fat",style: TextStyle(fontSize: 22),),
                                  Text(docData[field.cmilkfat].toString(),style: TextStyle(fontSize: 22),),
                                ],
                              ),

                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                border: Border(bottom: BorderSide())
                            ),
                          ),
                          Container(
                            color: Colors.blue.shade100,
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                 // Text(docData[field.daytime].toString(),style: TextStyle(fontSize: 22),),
                                  Text("Cow milk Quantity",style: TextStyle(fontSize: 22),),
                                  Text(docData[field.cmilkquant].toString(),style: TextStyle(fontSize: 22),),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                border: Border(bottom: BorderSide())
                            ),
                          ),
                          Container(
                            color: Colors.blue.shade200,
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                 // Text(docData[field.daytime].toString(),style: TextStyle(fontSize: 22),),
                                  Text("Cow Milk Rate",style: TextStyle(fontSize: 22),),
                                  Text(docData[field.cmilkrate].toString(),style: TextStyle(fontSize: 22),),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                border: Border(bottom: BorderSide())
                            ),
                          ),
                        ],
                      );

                    },
                        separatorBuilder: (___,____){
                      return const Divider();
                        },
                        itemCount: snapshot.data!.docs.length);

                  }else{
                    return  const Center(
                      child: Text("No Data available!",style: TextStyle(fontSize: 30),),
                    );
                  }


                }else{
                  return const Center(
                    child: Text("Error"),
                  );
                }

              },
            ),
          ),
        )
      ),
    );
  }
}
