import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:funds_tracker/features/requesteractions/models/request_model.dart';
import 'package:get/get.dart';

class FirestoreService extends GetxController{
  static FirestoreService get instance => Get.find();
  //get collection of requests
  final CollectionReference requests = FirebaseFirestore.instance.collection("requests");

  //Create (Add a new request)
  Future<void> addRequest(RequestModel newRequest){
    return requests.add({
      'type': newRequest.type,
      'requester': newRequest.requesterName,
      'amount': newRequest.amount,
      'description': newRequest.description,
      'date': newRequest.date,
      'payer': newRequest.payer,
      'status': newRequest.status
    });
  }
}
