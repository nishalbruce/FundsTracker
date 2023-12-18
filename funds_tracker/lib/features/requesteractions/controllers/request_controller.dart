import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:funds_tracker/features/requesteractions/models/request_model.dart';
import 'package:funds_tracker/features/requesteractions/screens/request_screen.dart';
import 'package:get/get.dart';

import '../../../common/components/navbar.dart';

class RequestController{
  static RequestController instance = Get.find();

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;


  final Rx<bool> _isLoaded = false.obs;
  bool get isLoaded => _isLoaded.value;


  //Add a request to cloud firestore

  Future<void> createRequest(
      String requestId,
      String type,
      String requesterName,
      double amount,
      String description,
      String date,
      String payer,
      String status,
      ) async {
    _isLoaded.value = true;
    try {
        RequestModel request = RequestModel(
          requestId: requestId,
            type: type,
            requesterName: requesterName,
            amount: amount,
            description: description,
            date: date,
            payer: payer,
            status: "Pending"
        );
        firebaseFirestore
            .collection('Requests')
            .doc(requestId)
            .set(
          request.toJson(),
        );

        _isLoaded.value = false;
        Get.offAll(const NavBar());

    } catch (e) {
      print(e);
      }
  }
}

