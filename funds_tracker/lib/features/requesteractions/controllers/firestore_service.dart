import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{
  //get collection of requests
  final CollectionReference requests = FirebaseFirestore.instance.collection("requests");

  //Create (Add a new request)
  Future<void> addRequest(String type, String requesterName, double amount, String description, DateTime date, String payer){
    return requests.add({
      'type': type,
      'requester': requesterName,
      'amount': amount,
      'description': description,
      'date': date,
      'payer': payer,
      'status': 'Pending'
    });
  }
}
