import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:funds_tracker/features/requesteractions/screens/home.dart';
import 'package:funds_tracker/utils/constants/colors.dart';
import 'package:get/get.dart';
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
  @override
  Widget build(BuildContext context) {
    final List<String> requestCategory = [
      "Transport",
      "Airtime",
      "Dish",
      "Water"
    ];
    String? selectedValue;
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
                    TextFormField(
                      decoration: const InputDecoration(
                        enabled: false,
                        labelText: "Request #",
                      ),
                    ),

                    const SizedBox(
                        height: FSizes.spaceBtwInputFields
                    ),

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
                          return 'Please select the request typr.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        //Do something when selected item is changed.
                      },
                      onSaved: (value) {
                        selectedValue = value.toString();
                      },
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

                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.frame_1),
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

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Payed by: ",
                          style: TextStyle(
                              fontWeight: FontWeight.w500),
                        ),
                        RadioGroup(
                          controller: myController,
                          values: const ["Me", "ACLIS"],
                          indexOfDefault: 0,
                          orientation: RadioGroupOrientation.horizontal,
                          decoration: const RadioGroupDecoration(
                            spacing: 10.0,
                            splashRadius: 20,
                            focusColor: Colors.red,
                            fillColor: MaterialStatePropertyAll<Color?>(FColors.primary),
                            //activeColor: FColors.primary
                          ),
                        ),
                      ],
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
