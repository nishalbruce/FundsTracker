import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:funds_tracker/features/requesteractions/controllers/firestore_service.dart';
import 'package:funds_tracker/features/requesteractions/controllers/request_controller.dart';
import 'package:funds_tracker/features/requesteractions/models/request_model.dart';
import 'package:funds_tracker/features/requesteractions/screens/home.dart';
import 'package:funds_tracker/utils/constants/colors.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:date_field/date_field.dart';
import '../../../utils/constants/sizes.dart';

class Request extends StatefulWidget {
  const Request({super.key});

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  final FirestoreService firestoreService = FirestoreService();
  final requestController = Get.put(RequestController());
  final requestForm = GlobalKey<FormState>();

  final List<DropdownMenuItem<String>> typeDropDown = [
    const DropdownMenuItem(value: "Transport", child: Text("Transport")),
    const DropdownMenuItem(value: "Airtime", child: Text("Airtime")),
    const DropdownMenuItem(value: "Dishes", child: Text("Dishes")),
    const DropdownMenuItem(value: "Water", child: Text("Water"))
  ];

  List<String> payerList = ["ACLIS", "Me"];

  List<String> requestCategory = ["Transport", "Airtime", "Dish", "Water"];

  String? payerSelected;
  String? selectedValue;
  DateTime? selectedDate;

  void clear() {
    requestController.fullName.clear();
    requestController.amount.clear();
    requestController.description.clear();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(FirestoreService());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        title: const Text(
          "Request",
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Form
              Form(
                  key: requestForm,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: FSizes.spaceBtwSections),
                    child: Column(
                      children: [
                        DropdownButtonFormField(
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(16),
                          ),
                          items: typeDropDown,
                          value: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value;
                              print(selectedValue);
                            });
                          },
                          hint: const Text(
                            'Select the request type',
                            style: TextStyle(fontSize: 14),
                          ),
                          validator: (value) {
                            if (value == null) {
                              return 'Please select the request type.';
                            }
                            return null;
                          },
                          icon: const Icon(
                            Iconsax.arrow_circle_down,
                          ),
                          isExpanded: true,
                        ),

                        const SizedBox(height: FSizes.spaceBtwInputFields),

                        TextFormField(
                          controller: requestController.fullName,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.frame_1),
                            labelText: "Full Name",
                          ),
                        ),

                        const SizedBox(height: FSizes.spaceBtwInputFields),

                        TextFormField(
                          controller: requestController.amount,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9]+[,.]{0,1}[0-9]*')),
                            TextInputFormatter.withFunction(
                              (oldValue, newValue) => newValue.copyWith(
                                text: newValue.text.replaceAll('.', ','),
                              ),
                            ),
                          ],
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.money),
                            labelText: "Amount",
                          ),
                        ),

                        const SizedBox(height: FSizes.spaceBtwInputFields),

                        TextFormField(
                          controller: requestController.description,
                          minLines: 1,
                          maxLines: 10,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.more),
                            labelText: "Description",
                          ),
                        ),

                        const SizedBox(height: FSizes.spaceBtwInputFields),

                        DateTimeFormField(
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(color: Colors.black45),
                            errorStyle: TextStyle(color: Colors.redAccent),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Iconsax.calendar),
                            labelText: 'Date',
                          ),
                          mode: DateTimeFieldPickerMode.date,
                          autovalidateMode: AutovalidateMode.always,
                          validator: (e) => (e?.day ?? 0) == 1
                              ? 'Please not the first day'
                              : null,
                          onDateSelected: (DateTime value) {
                            setState(() {
                              selectedDate = value;
                              print(selectedDate);
                            });
                          },
                          firstDate: DateTime(2000),
                          lastDate: DateTime(3000),
                        ),

                        const SizedBox(height: FSizes.spaceBtwInputFields),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Payed by: ",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: payerList[0],
                                  groupValue: payerSelected,
                                  fillColor:
                                      const MaterialStatePropertyAll<Color?>(
                                          FColors.primary),
                                  hoverColor: FColors.black,
                                  onChanged: (value) {
                                    setState(() {
                                      payerSelected = value!;
                                      print(payerSelected);
                                    });
                                  },
                                  activeColor: Colors.black12,
                                ),
                                const Text("ACLIS"),
                                const SizedBox(width: 10),
                                Radio(
                                  value: payerList[1],
                                  groupValue: payerSelected,
                                  fillColor:
                                      const MaterialStatePropertyAll<Color?>(
                                          FColors.primary),
                                  activeColor: FColors.primary,
                                  onChanged: (value) {
                                    setState(() {
                                      payerSelected = value!;
                                      print(payerSelected);
                                    });
                                  },
                                ),
                                const Text("Me"),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: FSizes.spaceBtwInputFields),
                        // Submit Button
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: const ButtonStyle(),
                            onPressed: () {
                              if (requestForm.currentState!.validate()) {
                                final request = Get.put(RequestModel(
                                  type: selectedValue!,
                                  requesterName:
                                      requestController.fullName.text.trim(),
                                  amount: requestController.amount.text.trim(),
                                  description:
                                      requestController.description.text.trim(),
                                  date: selectedDate!,
                                  payer: payerSelected!,
                                ));
                                RequestController.instance
                                    .addNewRequest(request);
                                requestForm.currentState!.save();

                                clear();
                                Get.to(() => const Home());
                              }
                            },
                            child: Text('Submit'),
                          ),
                        ),
                        //AnimatedButton(
                        //  text: 'Submit',
                        //  buttonTextStyle:
                        //      const TextStyle(fontSize: FSizes.fontSizeSm),
                        //  color: FColors.primary,
                        //  borderRadius: BorderRadius.circular(10),
                        //  pressEvent: () {
                        //    AwesomeDialog(
                        //      context: context,
                        //      animType: AnimType.topSlide,
                        //      headerAnimationLoop: false,
                        //      dialogType: DialogType.success,
                        //      showCloseIcon: true,
                        //      closeIcon: const Icon(Icons.cancel_outlined),
                        //      desc: 'Request successfully submitted',
                        //      btnOkOnPress: () {
                        //        if (requestForm.currentState!.validate()) {
                        //          final request = Get.put(RequestModel(
                        //            type: requestController.type.text.trim(),
                        //            requesterName:
                        //                requestController.fullName.text.trim(),
                        //            amount:
                        //                requestController.amount.text.trim(),
                        //            description: requestController
                        //                .description.text
                        //                .trim(),
                        //            date: selectedDate,
                        //            payer: payerSelected!,
                        //          ));
                        //          RequestController.instance
                        //              .addNewRequest(request);
                        //          requestForm.currentState!.save();
                        //          Get.to(() => const Home());
                        //        }
                        //        debugPrint('OnClick');
                        //      },
                        //      btnOkIcon: Icons.check_circle,
                        //      onDismissCallback: (type) {
                        //        debugPrint(
                        //            'Dialog Dismiss from callback $type');
                        //      },
                        //    ).show();
                        //  },
                        //),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

/*
void save() {
  Request newRequest = Request(
      type: selectedValue,
      requesterName: fullName,
      amount: amount,
      description: description,
      date: DateTime.now(),
      payer: myController,
      status: "Pending"
    );

      // Add the new request
  Provider.of<RequestController>(context, listen: false)
      .addNewRequest(newRequest);
}
*/
