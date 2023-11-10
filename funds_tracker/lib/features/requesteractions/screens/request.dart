import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:funds_tracker/features/requesteractions/screens/home.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:date_field/date_field.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class Request extends StatefulWidget {
  const Request({super.key});

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  @override
  Widget build(BuildContext context) {

    DateTime dateTime = DateTime(2001, 1, 1);

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
              Form(child: Padding(
                padding: const EdgeInsets.symmetric(vertical: FSizes.spaceBtwSections),
                child: Column(
                  children: [
                    //Email
                    TextFormField(
                      decoration: const InputDecoration(
                        enabled: false,
                        labelText: "Request #",
                      ),
                    ),

                    const SizedBox(
                        height: FSizes.spaceBtwInputFields
                    ),

                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.frame5),
                        labelText: "Password",
                      ),
                    ),

                    const SizedBox(
                        height: FSizes.spaceBtwInputFields
                    ),

                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.frame5),
                        labelText: "Full Name",
                      ),
                    ),

                    const SizedBox(
                        height: FSizes.spaceBtwInputFields
                    ),

                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]+[,.]{0,1}[0-9]*')),
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

                    const SizedBox(
                        height: FSizes.spaceBtwInputFields
                    ),

                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.more),
                        labelText: "Description",
                      ),
                    ),

                    const SizedBox(
                        height: FSizes.spaceBtwInputFields
                    ),

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
                      validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                      //onDateSelected: (DateTime value) {
                      //  print(value);
                      //},
                      firstDate: DateTime(2000),
                      lastDate: DateTime(3000),
                    ),

                    const SizedBox(
                        height: FSizes.spaceBtwInputFields
                    ),

                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.frame5),
                        labelText: "Password",
                      ),
                    ),

                    const SizedBox(
                        height: FSizes.spaceBtwSections
                    ),

                    // Sign In Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => const Home()),
                        child: const Text("Submit"),
                      ),
                    ),
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
