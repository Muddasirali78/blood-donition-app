import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(DonorDetailsApp());
}

class DonorDetailsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DonorDetailsScreen(),
    );
  }
}

class DonorDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 155, 43, 35),
        title: Text('Donor Details'),
      ),
      body: Column(
        children: [
                         

        
                        


        
        
        
        
        
        
          DonorCard(),
        ],
      ), // Pass actual donor data here
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditDonorScreen(),
            ),
          );
        },backgroundColor: Color.fromARGB(255, 154, 44, 36),
        child: Icon(Icons.edit),
      ),
    );
  }
}

class DonorCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Display donor information received from Firestore
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Display donor details from Firestore here
          ],
        ),
      ),
    );
  }
}

class EditDonorScreen extends StatefulWidget {
  @override
  _EditDonorScreenState createState() => _EditDonorScreenState();
}

class _EditDonorScreenState extends State<EditDonorScreen> {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController addressController;
  late TextEditingController bloodTypeController;
  late TextEditingController lastDonationController;
  String updateDonorText = "";

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    addressController = TextEditingController();
    bloodTypeController = TextEditingController();
    lastDonationController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    bloodTypeController.dispose();
    lastDonationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Donor Details'),
        backgroundColor: Color.fromARGB(255, 154, 42, 34),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextFormField(
              controller: bloodTypeController,
              decoration: InputDecoration(labelText: 'Blood Type'),
            ),
            TextFormField(
              controller: lastDonationController,
              decoration: InputDecoration(labelText: 'Last Donation'),
            ),SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () async {
                // Update donor data in Firestore
                bool success = await updateDonorData(
                  nameController.text,
                  phoneController.text,
                  emailController.text,
                  addressController.text,
                  bloodTypeController.text,
                  lastDonationController.text,
                );

                if (success) {
                  // Update the UI or display a success message
                  setState(() {
                    updateDonorText = "Donor data updated successfully.";
                  });

                  // Pop the screen
                  Navigator.pop(context);
                } else {
                  // Handle the case where the update failed
                  setState(() {
                    updateDonorText = "Failed to update donor data.";
                  });
                }
              },style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 155, 37, 29))),
              child: Text('Save Changes'),
            ),
            Text(updateDonorText),
          ],
        ),
      ),
    );
  }

  // Function to update donor data in Firestore
  Future<bool> updateDonorData(
      String name, String phone, String email, String address, String bloodType, String lastDonation) async {
    try {
      // Use Firestore to update the donor data here
      // Replace this with Firestore update code
      // Example:
      // await FirebaseFirestore.instance.collection('donors').doc('donorId').update({
      //   'name': name,
      //   'phone': phone,
      //   'email': email,
      //   'address': address,
      //   'bloodType': bloodType,
      //   'lastDonation': lastDonation,
      // });
      return true; // Return true for success
    } catch (e) {
      print("Error updating donor data: $e");
      return false; // Return false for failure
    }
  }
}
