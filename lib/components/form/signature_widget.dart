import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import "../../model/index.dart";

class SignatureWidget extends StatefulWidget {
  QuestionObj questionObj;

  SignatureWidget({Key? key, required this.questionObj}) : super(key: key);

  @override
  State<SignatureWidget> createState() => _SignatureWidgetState();
}

class _SignatureWidgetState extends State<SignatureWidget> {
  late String title;
  late double fontSize;
  late bool isVisible;
  late bool isReadOnly;
  late FieldDirection fieldDirection = FieldDirection.vertical;
  Image? signatureImage;

  @override
  void initState() {
    super.initState();
    title = widget.questionObj.title;
    fontSize = widget.questionObj.answer_fontSize;
    isVisible = widget.questionObj.isVisible;
    isReadOnly = widget.questionObj.isReadOnly;
    fieldDirection = widget.questionObj.fieldDirection;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: DottedBorder(
        dashPattern: [6, 6, 6, 6],
        borderType: BorderType.RRect,
        //color: field.errorText != null ? Colors.red : Color(0xFFBBBBBB),
        radius: Radius.circular(12),
        padding: EdgeInsets.all(6),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          child: Container(
            height: 117,
            width: MediaQuery.of(context).size.width - 100,
            // decoration: BoxDecoration(
            //     border: Border.all(color: Color(0xFFBBBBBB)),
            //
            //     ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/icon_signature.png',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    title,
                    style: TextStyle(color: Color(0xFFBBBBBB), fontSize: fontSize),
                  ),
                )
              ],
            ),
            //img_add_photo
          ),
        ),
      ),
      onTap: () {
        if (isReadOnly == true) return;
        FocusScope.of(context).requestFocus(new FocusNode());
        //_showDigitalSignatureDialog("task.signature".tr());
      },
    );
  }
}
