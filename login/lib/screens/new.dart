import 'package:flutter/material.dart';

class map extends StatefulWidget {
  const map({super.key});

  @override
  State<map> createState() => _mapState();
}

class _mapState extends State<map> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 158, 41, 32),
        title: Text(
          "lyari karachi",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Image.asset("assets/download.jpg",height: double.infinity,width: double.infinity,),
    );
  }
}
