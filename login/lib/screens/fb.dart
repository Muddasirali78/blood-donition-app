// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// // ...u;l
  

// Future<bool> updateDonorData(
//     String name, String phone, String email, String address, String bloodType, String lastDonation) async {
//   try {
//     // Replace 'your_collection_name' with the name of your Firestore collection
//     // and 'document_id' with the unique identifier of the document you want to update.
//     await FirebaseFirestore.instance
//         .collection('your_collection_name')
//         .doc('document_id')
//         .update({
//           'name': name,
//           'phone': phone,
//           'email': email,
//           'address': address,
//           'bloodType': bloodType,
//           'lastDonation': lastDonation,
//         });
//     return true;
//   } catch (e) {
//     print('Error updating donor data: $e');
//     return false;
//   }
// }
