import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:funds_tracker/features/requesteractions/models/request_model.dart';
import 'package:get/get.dart';

class FirestoreService extends GetxController {
  static FirestoreService get instance => Get.find();
  //get collection of requests
  //final CollectionReference requests = FirebaseFirestore.instance.collection("Request");

  //Create (Add a new request)
  void addRequest(RequestModel newRequest) {
    FirebaseFirestore.instance.collection("requests").add({
      'type': newRequest.type,
      'requester': newRequest.requesterName,
      'amount': newRequest.amount,
      'description': newRequest.description,
      'date': newRequest.date,
      'payer': newRequest.payer,
      'status': newRequest.status
      // ignore: body_might_complete_normally_catch_error
    }).catchError((onError) {
      Get.snackbar('Error', 'Requested fail');
    });
  }
}
