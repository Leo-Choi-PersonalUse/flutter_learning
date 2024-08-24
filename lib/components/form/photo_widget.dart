import "package:flutter/material.dart";
import "../../model/index.dart";
import 'package:dotted_border/dotted_border.dart';

class PhotoWidget extends StatefulWidget {
  QuestionObj questionObj;

  PhotoWidget({Key? key, required this.questionObj}) : super(key: key);

  @override
  State<PhotoWidget> createState() => _PhotoWidgetState();
}

class _PhotoWidgetState extends State<PhotoWidget> {
  late bool isReadOnly;
  late String title;
  late double fontSize;
  late bool isVisible;
  late FieldDirection fieldDirection = FieldDirection.vertical;

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
    return Visibility(
      visible: isVisible,
      child: photoWidget(),
    );
  }

  Widget photoWidget() {
    return FormField(
      validator: (value) {
        //if (selectedOption.isEmpty) {
        return 'Please select an option';
        //}
        return null;
      },
      builder: (FormFieldState state) {
        return Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Visibility(
                    visible: true, //isCanEdit,
                    child: DottedBorder(
                      dashPattern: [6, 6, 6, 6],
                      borderType: BorderType.RRect,
                      color: Color(0xFFBBBBBB),
                      //color: field.errorText != null ? Colors.red : Color(0xFFBBBBBB),
                      radius: Radius.circular(12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        child: Container(
                          height: 55,
                          width: 55,
                          child: false
                              ? Center(
                            child: Text(
                              "已達照片上限 x 張",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xFFBBBBBB), fontSize: 12),
                            ),
                          )
                              : Container(
                            // child: Image.asset(
                            //   'assets/images/icon_add_photo.png',
                            // ),
                            child: Icon(Icons.add_a_photo, color: Color(0xFFBBBBBB)),
                          ),
                          //img_add_photo
                        ),
                      ),
                    ),
                  ),
                  onTap: () async {
                    debugPrint("photo button pressed");
                    //cameraSourceActionSheet();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
