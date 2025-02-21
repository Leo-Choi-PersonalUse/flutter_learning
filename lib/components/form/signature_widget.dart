import "package:flutter/material.dart";
import "package:dotted_border/dotted_border.dart";
import "package:flutter_learning/theme/AppTheme.dart";
import "../../model/index.dart";
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import "../modal/signature_modal.dart";
import 'dart:convert';

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

  PhotoObj? signatureImage;

  @override
  void initState() {
    super.initState();
    title = widget.questionObj.title;
    fontSize = widget.questionObj.answerFontSize;
    isVisible = widget.questionObj.isVisible;
    isReadOnly = widget.questionObj.isReadOnly;
    fieldDirection = widget.questionObj.fieldDirection;
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (value) {
        print(signatureImage);
        if (signatureImage == null) {
          return 'Please enter';
        }
        return null;
      },
      builder: (FormFieldState state) {
        if (signatureImage != null) {
          return Stack(
            alignment: Alignment.topRight,
            children: [
              GestureDetector(
                onTap: () {
                  if (isReadOnly == true) return;
                  //if (signatureImage != null) _showDigitalSignatureDialog("task.signature".tr());
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 110,
                        width: MediaQuery.of(context).size.width - 100,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                          image: DecorationImage(
                            fit: BoxFit.scaleDown,
                            //image: signatureImage!.image,
                            image: MemoryImage(base64Decode(signatureImage!.base64!)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: isReadOnly == false,
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.of(context).primaryText,
                  ),
                  child: IconButton(
                      iconSize: 18.0,
                      padding: EdgeInsets.all(2.0),
                      constraints: BoxConstraints(),
                      onPressed: () {
                        signatureImage = null;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        color: AppTheme.of(context).primaryBackground,
                      )),
                ),
              )
            ],
          );
        } else
          return Column(
            children: [
              GestureDetector(
                child: DottedBorder(
                  dashPattern: [6, 6, 6, 6],
                  borderType: BorderType.RRect,
                  color: state.errorText != null ? AppTheme.of(context).error : Color(0xFFBBBBBB),
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
                          // Image.asset(
                          //   'assets/images/icon_signature.png',
                          // ),
                          Icon(
                            Icons.brush,
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
                onTap: () async {
                  if (isReadOnly == true) return;
                  // var res = await showCupertinoModalBottomSheet(
                  //   context: context,
                  //   builder: (context) => SignatureModal(),
                  // );

                  var res = await showDialog(
                    context: context,
                    builder: (context) => SignatureModal(),
                  );

                  if (res != null) {
                    setState(() {
                      signatureImage = PhotoObj(base64: res);
                    });
                  }

                  //FocusScope.of(context).requestFocus(new FocusNode());
                  //_showDigitalSignatureDialog("task.signature".tr());
                },
              ),
              if (state.errorText != null)
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(13, 10, 0, 0),
                      child: Text(
                        state.errorText!,
                        style: TextStyle(
                          color: AppTheme.of(context).error,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                )
            ],
          );
      },
    );
  }
}
