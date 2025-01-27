import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:iconsax/iconsax.dart';

class DateTimePickerForm extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const DateTimePickerForm({
    Key? key,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  _DateTimePickerFormState createState() => _DateTimePickerFormState();
}

class _DateTimePickerFormState extends State<DateTimePickerForm> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return DateTimeFormField(
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
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
      onChanged: (DateTime value) {
        setState(() {
          _selectedDate = value;
          widget.onDateSelected(value);
        });
      },
    );
  }

  DateTime? get selectedDate => _selectedDate;
}
