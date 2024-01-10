import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:funds_tracker/features/requesteractions/controllers/firestore_service.dart';
import 'package:funds_tracker/features/requesteractions/controllers/request_controller.dart';
import 'package:funds_tracker/features/requesteractions/screens/home.dart';
import 'package:funds_tracker/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:iconsax/iconsax.dart';
import 'package:date_field/date_field.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:radio_group_v2/radio_group_v2.dart';
import '../../../utils/constants/sizes.dart';

class Request extends StatefulWidget {
  const Request({super.key});

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {

  final FirestoreService firestoreService = FirestoreService();
  @override
  Widget build(BuildContext context) {
    final TextEditingController _type = TextEditingController();
    final TextEditingController _fullName = TextEditingController();
    final TextEditingController _amount = TextEditingController();
    final TextEditingController _description = TextEditingController();
    final TextEditingController _date = TextEditingController();
    final TextEditingController _payer = TextEditingController();
    final GlobalKey<RadioGroupState> horizontalGroupKey =
    GlobalKey<RadioGroupState>();
    String horizontalValRequested = "";
    final List<String> requestCategory = [
      "Transport",
      "Airtime",
      "Dish",
      "Water"
    ];
    String? selectedValue;
    DateTime? selectedDate;
    RadioGroupController myController = RadioGroupController();

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
                    //TextFormField(
                    //  decoration: const InputDecoration(
                    //    enabled: false,
                    //    labelText: "Request #",
                    //  ),
                    //),

                    //const SizedBox(
                    //    height: FSizes.spaceBtwInputFields
                    //),

                    DropdownButtonFormField2<String>(

                      isExpanded: true,
                      decoration: const InputDecoration(
                        // Add Horizontal padding using menuItemStyleData.padding so it matches
                        // the menu padding when button's width is not specified.
                        contentPadding: EdgeInsets.symmetric(vertical: 16),
                        // Add more decoration..
                      ),
                      hint: const Text(
                        'Select the request type',
                        style: TextStyle(fontSize: 14),
                      ),
                      items: requestCategory
                          .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Please select the request type.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value.toString();
                          print(selectedValue);
                        });
                      },
                      onSaved: (value) {},
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.only(right: 8),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Iconsax.arrow_circle_down,
                        ),
                        iconSize: 24,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),

                    const SizedBox(
                        height: FSizes.spaceBtwInputFields
                    ),

                    TextField(
                      controller: _fullName,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.frame_1),
                        labelText: "Full Name",
                      ),
                    ),

                    const SizedBox(
                        height: FSizes.spaceBtwInputFields
                    ),

                    TextField(
                      controller: _amount,
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

                    TextField(
                      controller: _description,
                      minLines: 1,
                      maxLines: 10,
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
                      onDateSelected: (DateTime value) {
                        selectedDate = value;
                        print(value);
                      },
                      firstDate: DateTime(2000),
                      lastDate: DateTime(3000),
                    ),

                    const SizedBox(
                        height: FSizes.spaceBtwInputFields
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Payed by: ",
                          style: TextStyle(
                              fontWeight: FontWeight.w500),
                        ),

                        RadioGroup(
                         // key: horizontalGroupKey,
                          controller: myController,
                          values: const ["Me", "ACLIS"],
                          indexOfDefault: -1,
                          orientation: RadioGroupOrientation.horizontal,
                          decoration: const RadioGroupDecoration(
                            toggleable: true,
                            spacing: 10.0,
                            splashRadius: 20,
                            focusColor: Colors.yellow,
                            fillColor: MaterialStatePropertyAll<Color?>(FColors.primary)
                            //activeColor: FColors.primary
                          ),
                          onChanged: (newValue) => setState(() {
                            horizontalValRequested = newValue.toString();
                            print(horizontalValRequested);
                          }),
                        ),
                      ],
                    ),

                    const SizedBox(
                        height: FSizes.spaceBtwSections
                    ),

                    // Submit Button
                    AnimatedButton(
                      text: 'Submit',
                      buttonTextStyle: const TextStyle(
                          fontSize: FSizes.fontSizeSm
                      ),
                      color: FColors.primary,
                      borderRadius: BorderRadius.circular(10),
                      pressEvent: () {
                        firestoreService.addRequest(selectedValue.toString(), _fullName.text, _amount.toString() as double, _description.text, selectedDate.toString() as DateTime, myController.toString());
                        _fullName.clear();
                        _description.clear();
                        AwesomeDialog(
                          context: context,
                          animType: AnimType.topSlide,
                          headerAnimationLoop: false,
                          dialogType: DialogType.success,
                          showCloseIcon: true,
                          closeIcon: const Icon(Icons.cancel_outlined),
                          desc:
                          'Request successfully submitted',
                          btnOkOnPress: () {
                            debugPrint('OnClick');
                            //RequestController.createRequest(
                            //    selectedValue!,
                            //    _fullName.text,
                            //    double.parse(_amount.text).toString(),
                            //    _description.text,
                            //    selectedDate.toString(),
                            //    _payer.text
                            //);
                          },
                          btnOkIcon: Icons.check_circle,
                          onDismissCallback: (type) {
                            debugPrint('Dialog Dissmiss from callback $type');
                          },
                        ).show();
                      },
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
