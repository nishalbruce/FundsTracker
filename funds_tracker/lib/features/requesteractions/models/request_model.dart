import 'package:cloud_firestore/cloud_firestore.dart';

class RequestModel {
  final String type;
  final String requesterName;
  final String amount;
  final String description;
  final DateTime date;
  final String payer;
  String status;

  RequestModel({
    required this.type,
    required this.requesterName,
    required this.amount,
    required this.description,
    required this.date,
    required this.payer,
    this.status = "Pending",
  });

  RequestModel.fromJson(Map<String, dynamic> json)
      : type = json["type"],
        requesterName = json["requesterName"],
        amount = json["amount"],
        description = json["description"],
        date = json["date"],
        payer = json["payer"],
        status = json["status"];

  Map<String, dynamic> toJson() => {
        "type": type,
        "requesterName": requesterName,
        "amount": amount,
        "description": description,
        "date": date,
        "payer": payer,
        "status": status
      };

  factory RequestModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return RequestModel(
        type: data["type"],
        requesterName: data["requester"],
        amount: data["amount"],
        description: data["description"],
        date: data["date"],
        payer: data["payer"]);
  }
}
