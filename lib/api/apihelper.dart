import 'package:ccrwork_mobile/model/contact.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ApiHelper {
  static final ApiHelper instance = ApiHelper._internal();
  static final db = FirebaseFirestore.instance.collection('contact');
  factory ApiHelper() {
    return instance;
  }
  ApiHelper._internal() {}
  createContact(ContactModel contact) async {
    try {
      return db
          .add(contact.toJson())
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    } catch (ex) {
      var i = ex;
    }
  }
}