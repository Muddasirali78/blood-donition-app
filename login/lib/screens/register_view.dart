import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/screens/home_view.dart';

class register extends StatefulWidget {
  register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  register() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 178, 40, 30),


        title: Text("register screen"),
      ),
      body: Column(
        children: [
          TextField(controller: emailcontroller,
          decoration: InputDecoration(hintText: "Enter your email"),
          
          ),
          TextField(controller: passwordcontroller,
decoration: InputDecoration(hintText: "enter your pasword"),

          ),SizedBox(height: 20,),
          ElevatedButton(
              onPressed: () {
                register();
              },style:ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 160, 33, 24))
              ) ,
              child: Text("register")),
        ],
      ),
    );
  }
}
