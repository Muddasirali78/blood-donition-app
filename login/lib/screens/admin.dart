import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddDonorScreen extends StatefulWidget {
  const AddDonorScreen({Key? key}) : super(key: key);

  @override
  _AddDonorScreenState createState() => _AddDonorScreenState();
}

class _AddDonorScreenState extends State<AddDonorScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bloodTypeController = TextEditingController();
  final TextEditingController phonenumbercontroller = TextEditingController();
  void addDonor() {
    final String name = nameController.text;
    final String bloodType = bloodTypeController.text;
    final String phonenumber = phonenumbercontroller.text;

    // Check if both name and blood type are not empty
    if (name.isNotEmpty && bloodType.isNotEmpty) {
      firestore.collection('donors').add({
        'name': name,
        'bloodType': bloodType,
      }).then((value) {
        // Donor added successfully
        print('Donor added with ID: ${value.id}');
        Navigator.pop(context); // Close the add donor screen
      }).catchError((error) {
        // Handle errors, e.g., show a snackbar
        print('Error adding donor: $error');
      });
    } else {
      // Show an error message, e.g., a snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Both name and blood type are required.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manager profile'),
        backgroundColor: Color.fromARGB(255, 157, 38, 29),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: bloodTypeController,
              decoration: InputDecoration(labelText: 'addrees'),
            ),
            TextField(
              controller: phonenumbercontroller,
              decoration: InputDecoration(labelText: "phone number"),
            ),SizedBox(height: 20,),
            ElevatedButton(
              onPressed: addDonor,style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 171, 38, 28))),
              child: Text('Add Donor'),
            ),SizedBox(height: 20,),
            ElevatedButton(onPressed: ()
            async {
                await FirebaseAuth.instance.signOut();
                Navigator.pop(context);
              },style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 151, 34, 25))),
             child: Text("logout"))
          ],
        ),
      ),
    );
  }
}
