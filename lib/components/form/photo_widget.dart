import "package:flutter/material.dart";
import "../../model/index.dart";
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import '../modal/photo_modal.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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

  List<PhotoObj> photoList = <PhotoObj>[];

  @override
  void initState() {
    super.initState();
    title = widget.questionObj.title;
    fontSize = widget.questionObj.answer_fontSize;
    isVisible = widget.questionObj.isVisible;
    isReadOnly = widget.questionObj.isReadOnly;
    fieldDirection = widget.questionObj.fieldDirection;
  }

  Future<void> addPhotoToList({required XFile photo}) async {
    photoList.add(PhotoObj(base64: base64Encode(await photo.readAsBytes())));

    setState(() {});
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
                    child: addPhotoWidget(),
                  ),
                  onTap: () async {
                    var res = await showBarModalBottomSheet(
                      context: context,
                      animationCurve: null,
                      duration: Duration(milliseconds: 300),
                      closeProgressThreshold: 0.0,
                      backgroundColor: Colors.transparent.withOpacity(1),
                      builder: (context) => PhotoModal(),
                      barrierColor: Colors.transparent.withOpacity(0.4),
                    );

                    res.forEach((element) {
                      addPhotoToList(photo: element);
                    });

                    // final XFile? photo = await ImagePicker().pickImage(source: ImageSource.camera);
                    //
                    // addPhotoToList(photo: photo!);
                    //
                    // debugPrint("photo button pressed");

                    //cameraSourceActionSheet();
                  },
                ),
                Expanded(
                  child: Container(
                    height: 60,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: photoList.length, //_taskObj.photoObjList.length,
                      itemBuilder: (BuildContext context, int index) => GestureDetector(
                        onTap: () {
                          //photoPressed(index);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            width: 60,
                            height: 60,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.memory(
                                base64Decode(photoList[index].base64!),
                                fit: BoxFit.cover,
                                gaplessPlayback: true,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget addPhotoWidget() {
    return DottedBorder(
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
          child: Container(
            child: Icon(Icons.add_a_photo, color: Color(0xFFBBBBBB)),
          ),
          //img_add_photo
        ),
      ),
    );
  }
}
