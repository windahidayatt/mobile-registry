import 'package:flutter/material.dart';
import 'package:mobile_registry/shared_library/utils/color_tone.dart';

class REDatePicker extends StatefulWidget {
  const REDatePicker({
    Key? key,
    this.onChanged,
  }) : super(key: key);
  final void Function(DateTime)? onChanged;
  @override
  _REDatePickerState createState() => _REDatePickerState();
}

class _REDatePickerState extends State<REDatePicker> {
  DateTime? _choosedDate;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorTone.reDarkGrey,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(_choosedDate?.toString() ?? 'Choose Planned Date'),
          GestureDetector(
            onTap: () async => _setValueDatePicker(),
            child: const Icon(
              Icons.date_range,
              color: ColorTone.reOrange,
            ),
          )
        ],
      ),
    );
  }

  Future<void> _setValueDatePicker() async {
    var _result = await showDatePicker(
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
      context: context,
    );
    setState(() {
      _choosedDate = _result;
    });
  }
}
