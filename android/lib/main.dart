import 'package:dsmp/screens/home.dart';
import 'package:dsmp/screens/read.dart';
import 'package:dsmp/screens/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

FirebaseAuth auth = FirebaseAuth.instance;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: asplash()
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 //controllers
  var otpController = TextEditingController();
  var numController = TextEditingController();

  String verificationId = "";

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    try {
      final authCredential =
      await auth.signInWithCredential(phoneAuthCredential);
      if (authCredential.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => home()));
      } else{
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => asplash()));
      }
    } on FirebaseAuthException catch (e) {
      print("catch");
    }
  }


  Future signOut()async{
    try{
      return await auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("images/wel.png"),
                  fit: BoxFit.cover)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Phone Number',
                      hintText: 'Enter valid number'
                  ),
                  controller: numController,
                  keyboardType: TextInputType.phone ,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                     fillColor: Colors.white,
                      filled: true,
                      labelText: 'Password',
                      hintText: 'Enter valid password'
                  ),
                  controller: otpController,
                  keyboardType: TextInputType.number ,
                ),
              ),

              ElevatedButton(onPressed: (){
                 fetchotp();
              }, child: const Text("Fetch OTP",
                  style: TextStyle(fontSize: 20,color: Colors.white)),),
              ElevatedButton(onPressed: () {
                verify();
              }, child: const Text("Verify",
                style: TextStyle(fontSize: 20,color: Colors.white)),)
            ],
          ),
        ),
      ),
    );
  }


  Future<void> verify() async {
    PhoneAuthCredential phoneAuthCredential =
    PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpController.text);
        signInWithPhoneAuthCredential(phoneAuthCredential);
  }


  Future<void> fetchotp() async {
    await auth.verifyPhoneNumber(
      phoneNumber: numController.text.toString(),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },

      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },

      codeSent: (String verificationId, int? resendToken) async {
        this.verificationId = verificationId;

      },

      codeAutoRetrievalTimeout: (String verificationId) {
      },
    );
  }
}