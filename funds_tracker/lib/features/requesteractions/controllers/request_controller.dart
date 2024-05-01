//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:funds_tracker/features/requesteractions/controllers/datetime_helper.dart';
import 'package:funds_tracker/features/requesteractions/controllers/firestore_service.dart';
import 'package:funds_tracker/features/requesteractions/models/request_model.dart';
import 'package:get/get.dart';
//import 'package:get/get.dart';
//import '../../../common/components/navbar.dart';

class RequestController extends GetxController{
  static RequestController get instance => Get.find();

  final type = TextEditingController();
  final fullName = TextEditingController();
  final amount = TextEditingController();
  final description = TextEditingController();


  // List of all requests
  List<RequestModel> overallRequestList = [];

  // Get request list
  List<RequestModel> getAllRequestList() {
    return overallRequestList;
  }

  void getAllPendingRequestsList() {
    FirestoreService.instance.getPendingRequests();
  }



  // Add new request
  void addNewRequest(RequestModel newRequest) {
    FirestoreService.instance.addRequest(newRequest);
    overallRequestList.add(newRequest);
  }

  // Delete request
  void deleteRequest(RequestModel request) {
    overallRequestList.remove(request);
  }

  // Get months from a datetime object
  String getMonthName(DateTime dateTime) {
    switch (dateTime.month) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
      default:
        return "";
    }
  }

  // Get the month for the start of the year
  DateTime startOfYearDate() {
    DateTime? startOfYear;

    // Get current month date
    DateTime currentMonth = DateTime.now();

    //Go backwards from current month to find January
    for (int i = 0; i < 365; i++) {
      if (getMonthName(currentMonth.subtract(Duration(days: i))) == "Dec") {
        startOfYear = currentMonth.subtract(Duration(days: i));
      }
    }

    return startOfYear!;
  }

  //Convert overall list of expenses into a monthly expense summary
  Map<String, double> calculateMonthlyExpenseSummary() {
    Map<String, double> monthlyExpenseSummary = {
      // date (yyyymmdd) : amountTotalForMonth
    };

    for (var request in overallRequestList) {
      String date = convertDateTimeToString(request.date);
      double amount = double.parse(request.amount);

      if (monthlyExpenseSummary.containsKey(date)) {
        double currentAmount = monthlyExpenseSummary[date]!;
        currentAmount += amount;
        monthlyExpenseSummary[date] = currentAmount;
      } else {
        monthlyExpenseSummary.addAll({date: amount});
      }
    }

    return monthlyExpenseSummary;
  }
}







//class RequestController extends GetxController{
//  static RequestController instance = Get.find();
//
//  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//
//
//  final Rx<bool> _isLoaded = false.obs;
//  bool get isLoaded => _isLoaded.value;
//
//
//  //Add a request to cloud firestore
//
//  Future<void> createRequest(
//      String requestId,
//      String type,
//      String requesterName,
//      double amount,
//      String description,
//      String date,
//      String payer,
//      String status,
//      ) async {
//    _isLoaded.value = true;
//    try {
//        RequestModel request = RequestModel(
//            type: type,
//            requesterName: requesterName,
//            amount: amount,
//            description: description,
//            date: date,
//            payer: payer,
//            status: "Pending"
//        );
//        firebaseFirestore.collection('Requests').doc(requestId).set(request.toJson());
//
//        _isLoaded.value = false;
//        Get.offAll(const NavBar());
//
//    } catch (e) {
//      print(e);
//      }
//  }
//}

