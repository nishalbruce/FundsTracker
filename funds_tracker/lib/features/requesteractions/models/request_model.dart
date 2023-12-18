import 'package:cloud_firestore/cloud_firestore.dart';

class RequestModel{
  String requestId;
  String type;
  String requesterName;
  double amount;
  String description;
  String date;
  String payer;
  String status;

  RequestModel({
    required this.requestId,
    required this.type,
    required this.requesterName,
    required this.amount,
    required this.description,
    required this.date,
    required this.payer,
    required this.status,
  });

  Map<String, dynamic> toJson() => {
    "type": type,
    "requesterName": requesterName,
    "amount": amount,
    "description": description,
    "date": date,
    "payer": payer,
    "status": status
  };

  static RequestModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return RequestModel(
      requestId: snapshot['requestId'],
      type: snapshot['type'],
      requesterName: snapshot['requesterName'],
      amount: snapshot['amount'],
      description: snapshot['description'],
      date: snapshot['date'],
      payer: snapshot['payer'],
      status: snapshot['status'],
    );
  }

  static RequestModel fromJson(Map<String, dynamic> json) {
    return RequestModel(
      requestId: json['requestId'],
      type: json['type'],
      requesterName: json['requesterName'],
      amount: json['amount'],
      description: json['description'],
      date: json['date'],
      payer: json['payer'],
      status: json['status'],
    );
  }

}
