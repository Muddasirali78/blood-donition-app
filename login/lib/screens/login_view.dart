import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/screens/admin.dart';
import 'package:login/screens/adminlogin.dart';
import 'package:login/screens/donordetail.dart';
import 'package:login/screens/editdonor.dart';
import 'package:login/screens/home_view.dart';
import 'package:login/screens/new.dart';
import 'package:login/screens/register_view.dart';

//import 'package:myapp/register.dart';
//import 'package:myapp/splashScreen.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController paswordcontroller = TextEditingController();
  bool islogginin = false;
  login() async {
    try {
      islogginin = true;
      setState(() {});
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text,
        password: paswordcontroller.text,
      );
      islogginin = false;
      setState(() {});
      Navigator.push(context, MaterialPageRoute(builder: (context) => DonorDetailsApp()));
    } on FirebaseAuthException catch (e) {
      setState(() {});
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 138, 28, 20),
        title: Text(
          " Login",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: Color.fromARGB(255, 171, 49, 40),
            height: 300,
            width: double.infinity,
            child: Column(
              children: [
                Image.asset("assets/MIZide.png"),
                Text(
                  "Zindgi",
                  style: TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      color: Colors.white),
                )
              ],
            ),
          ), //Text("zindagi",style: TextStyle(fontSize: 20,fontStyle:FontStyle.italic ),),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: emailcontroller,
            decoration: InputDecoration(hintText: "enter your email"),
          ),
          TextField(
            controller: paswordcontroller,
            decoration: InputDecoration(hintText: "enter your pasword"),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 30,
            child: ElevatedButton(
                onPressed: () {
                  login();
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 172, 36, 27))),
                child: Text("login")),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => register()));
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 172, 36, 27))),
            child: Text("register your accout"),
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => AddDonorScreen()));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 176, 35, 25))),
              child: Text("admin login")),
          Visibility(visible: islogginin, child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
