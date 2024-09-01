import "package:flutter/material.dart";
import "../../model/index.dart";
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import '../modal/photo_modal.dart';
import '../photo_viewer.dart';
import '../modal/modal_template.dart';

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
                    // showModalBottomSheet(
                    //   context: context,
                    //   builder: (context) => PhotoModal(),
                    // );

                    showModalBottomSheet(
                      context: context,
                      builder: (context) => ModalTemplate(
                        content: Text("aa"),
                      ),
                    );

                    // res.forEach((element) {
                    //   addPhotoToList(photo: element);
                    // });
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PhotoViewer(
                                photoList: photoList,
                                initialIndex: index,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: index == 0 ? 0 : 10),
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
    return Padding(
      padding: EdgeInsets.only(right: 10),
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
            child: Container(
              child: Icon(Icons.add_a_photo, color: Color(0xFFBBBBBB)),
            ),
            //img_add_photo
          ),
        ),
      ),
    );
  }
}
