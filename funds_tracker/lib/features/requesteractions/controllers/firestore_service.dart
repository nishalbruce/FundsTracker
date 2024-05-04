import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:funds_tracker/features/requesteractions/models/request_model.dart';
import 'package:get/get.dart';

class FirestoreService extends GetxController {
  static FirestoreService get instance => Get.find();
  //get collection of requests
  final CollectionReference requests =
      FirebaseFirestore.instance.collection("requests");

  //Create (Add a new request)
  //Future<void> addRequest(RequestModel newRequest) async {
  //  await requests.add({
  //    'type': newRequest.type,
  //    'requester': newRequest.requesterName,
  //    'amount': newRequest.amount,
  //    'description': newRequest.description,
  //    'date': newRequest.date,
  //    'payer': newRequest.payer,
  //    'status': newRequest.status
  //  });
  //}

  void addRequest(RequestModel newReq){
    FirebaseFirestore.instance.collection("requests").add({
      "type": newReq.type,
      "requester": newReq.requesterName,
      "amount": newReq.amount,
      "description": newReq.description,
      "date": newReq.date,
      "payer": newReq.payer,
      "status": newReq.payer,
    });
  }

  // Read requests
  Stream<QuerySnapshot> getRequestsStream() {
    final requestStream =
        requests.orderBy('date', descending: true).snapshots();

    return requestStream;
  }

  Stream<QuerySnapshot> getPendingRequests() {
    final requestStream =
        requests.where('status', isEqualTo: 'Pending').snapshots();

    return requestStream;
  }

  Stream<QuerySnapshot> getUserInfo() {
    //final username = users.where('status', isEqualTo: 'Pending').snapshots();
    const username = null;

    return username;
  }

  //Stream<QuerySnapshot> getRequestDetail(String requesterId) {
  //  final requestStream = requests.doc(requesterId).snapshots();

  //  return requestStream;
  //}

//  Future<DocumentSnapshot<Object?>> getRequestDetail(String requesterId) {
//  return requests.doc(requesterId).get();
//}

  Stream<DocumentSnapshot<Object?>> getRequestDetail(String requesterId) {
    return requests.doc(requesterId).snapshots();
  }

  //Update Request
  Future<void> updateStatus(String docID, String newStatus) {
    return requests.doc(docID).update({'status': newStatus});
  }

  //Delete Request
  Future<void> deleteRequest(String docID) {
    return requests.doc(docID).delete();
  }
}
