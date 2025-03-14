import 'package:flutter/material.dart';
import 'package:flutter_learning/theme/AppTheme.dart';
import 'package:intl/intl.dart';
import "../../model/index.dart";

class DateTimeWidget extends StatefulWidget {
  QuestionObj questionObj;

  bool isDate;
  bool isTime;

  DateTimeWidget({
    Key? key,
    required this.questionObj,
    required this.isDate,
    required this.isTime,
  }) : super(key: key);

  @override
  State<DateTimeWidget> createState() => _DateTimeWidgetState();
}

class _DateTimeWidgetState extends State<DateTimeWidget> {
  late String title;
  late double titleFontSize;
  late bool titleBold;
  late double answerFontSize;
  late bool answerBold;
  late bool isVisible;
  late bool isReadOnly;
  late FieldDirection fieldDirection = FieldDirection.vertical;

  String dateStr = '';
  String timeStr = '';
  String value = '';

  //Style
  double contentPaddingVertical = 12.0;
  double contentPaddingHorizontal = 12.0;

  String getValue() {
    if (widget.isDate && widget.isTime) {
      return dateStr + " " + timeStr;
    } else if (widget.isDate) {
      return dateStr;
    } else if (widget.isTime) {
      return timeStr;
    }
    return "";
  }

  CrossAxisAlignment getAlignment() {
    switch (widget.questionObj.titleAlignment) {
      case TextAlignment.left:
        return CrossAxisAlignment.start;
      case TextAlignment.right:
        return CrossAxisAlignment.end;
      default:
        return CrossAxisAlignment.center;
    }
  }

  @override
  void initState() {
    super.initState();
    title = widget.questionObj.title;
    titleFontSize = widget.questionObj.titleFontSize;
    titleBold = widget.questionObj.titleBold;
    answerFontSize = widget.questionObj.answerFontSize;
    answerBold = widget.questionObj.answerBold;
    isVisible = widget.questionObj.isVisible;
    isReadOnly = widget.questionObj.isReadOnly;
    fieldDirection = widget.questionObj.fieldDirection;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: fieldDirection == FieldDirection.vertical ? DateTimeWidget_Vertical() : DateTimeWidget_Horizontal(),
    );
  }

  Widget DateTimeWidget_Vertical() {
    return Column(
      crossAxisAlignment: getAlignment(),
      children: [
        Text(
          title,
          style: TextStyle(fontSize: titleFontSize, fontWeight: titleBold ? FontWeight.bold : FontWeight.normal),
        ),
        SizedBox(height: 8.0), // Add some spacing between the title and the TextFormField
        Row(
          children: [
            Visibility(
              visible: widget.isDate,
              child: Expanded(
                child: DateWidget(),
              ),
            ),
            Visibility(
              visible: widget.isTime,
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TimeWidget(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget DateTimeWidget_Horizontal() {
    return Row(
      crossAxisAlignment: getAlignment(),
      children: [
        Expanded(
          flex: 1,
          child: Text(
            title,
            style: TextStyle(fontSize: titleFontSize, fontWeight: titleBold ? FontWeight.bold : FontWeight.normal),
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Visibility(
                visible: widget.isDate,
                child: DateWidget(),
              ),
              SizedBox(height: 8.0),
              Visibility(
                visible: widget.isTime,
                child: TimeWidget(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget DateWidget() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      style: TextStyle(fontSize: answerFontSize, fontWeight: answerBold ? FontWeight.bold : FontWeight.normal),
      enabled: true,
      readOnly: true,
      textAlign: TextAlign.center,
      controller: TextEditingController(text: dateStr),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        suffixIcon: const Icon(Icons.date_range),
        contentPadding:
            EdgeInsets.symmetric(vertical: contentPaddingVertical, horizontal: contentPaddingHorizontal), // Adjust padding to reduce height
      ),
      onTap: () {
        selectDate(context);
      },
    );
  }

  Widget TimeWidget() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      style: TextStyle(fontSize: answerFontSize, fontWeight: answerBold ? FontWeight.bold : FontWeight.normal),
      enabled: true,
      readOnly: true,
      textAlign: TextAlign.center,
      controller: TextEditingController(text: timeStr),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        suffixIcon: const Icon(Icons.access_time),
        contentPadding:
            EdgeInsets.symmetric(vertical: contentPaddingVertical, horizontal: contentPaddingHorizontal), // Adjust padding to reduce height
      ),
      onTap: () {
        selectTime(context);
      },
    );
  }

  Future<void> selectDate(BuildContext context) async {
    //if (isreadOnly) return;

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024, 1),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: Colors.blue, // Set your desired background color
                ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                textStyle: const TextStyle(fontSize: 18), // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      // helpText: "task.please_select_date".tr(),
      // confirmText: "general.confirm".tr(),
      // cancelText: "general.cancel".tr(),
    );

    if (pickedDate != null) {
      dateStr = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
    //
    // print("pickedDate: $pickedDate");
    // if (selectedDateTimeCallback != null) selectedDateTimeCallback!();
  }

  Future<void> selectTime(BuildContext context) async {
    //if (isreadOnly) return;

    final TimeOfDay? pickedTime = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dialOnly,
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                textStyle: const TextStyle(fontSize: 18), // button text color
              ),
            ),
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  //primary: Color(ConstantValue.themeColor), // Set your desired background color
                  primary: Colors.blue,
                ),
          ),
          child: child!,
        );
      },
      //confirmText: "general.confirm".tr(),
      //cancelText: "general.cancel".tr(),
    );
    if (pickedTime != null) {
      var tempDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, pickedTime.hour, pickedTime.minute);
      timeStr = DateFormat('HH:mm').format(tempDate);
    }
    // print("pickedTime: $pickedTime");
    // if (selectedDateTimeCallback != null) selectedDateTimeCallback!();
  }
}
