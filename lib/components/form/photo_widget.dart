import "package:flutter/material.dart";
import "../../model/index.dart";
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import "package:flutter_learning/theme/AppTheme.dart";
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
  late String title;
  late double titleFontSize;
  late bool titleBold;
  late double answerFontSize;
  late bool answerBold;
  late bool isVisible;
  late bool isReadOnly;
  late FieldDirection fieldDirection = FieldDirection.vertical;

  List<PhotoObj> photoList = <PhotoObj>[];

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

  Future<void> addPhotoToList({required XFile photo}) async {
    photoList.add(PhotoObj(base64: base64Encode(await photo.readAsBytes())));

    setState(() {});
  }

  CrossAxisAlignment getAlignment() {
    switch (widget.questionObj.titleAlignment) {
      case TextAlignment.centerLeft:
        return CrossAxisAlignment.start;
      case TextAlignment.centerRight:
        return CrossAxisAlignment.end;
      default:
        return CrossAxisAlignment.center;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: fieldDirection == FieldDirection.vertical ? PhotoWidget_Vertical() : PhotoWidget_Horizontal(),
    );
  }

  Widget PhotoWidget_Vertical() {
    return Column(
      crossAxisAlignment: getAlignment(),
      children: [
        Text(
          title,
          style: TextStyle(fontSize: titleFontSize, fontWeight: titleBold ? FontWeight.bold : FontWeight.normal),
        ),
        SizedBox(height: 8.0),
        photoWidget(),
      ],
    );
  }

  Widget PhotoWidget_Horizontal() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
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
          child: photoWidget(),
        ),
      ],
    );
  }

  Widget photoWidget() {
    return FormField(
      validator: (value) {
        if (photoList.isEmpty) {
          return 'Please select a photo';
        }
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
                    child: addPhotoWidget(state: state),
                  ),
                  onTap: () async {
                    var res = await showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => PhotoModal(
                        height: 0.35,
                      ),
                    );

                    if (res != null && res.length > 0) {
                      res.forEach((element) {
                        addPhotoToList(photo: element);
                      });
                    }
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
            if (state.errorText != null)
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(13, 10, 0, 0),
                    child: Text(
                      state.errorText.toString(),
                      style: TextStyle(color: AppTheme.of(context).error, fontSize: 12),
                    ),
                  ),
                ],
              ),
          ],
        );
      },
    );
  }

  Widget addPhotoWidget({required FormFieldState state}) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: DottedBorder(
        dashPattern: [6, 6, 6, 6],
        borderType: BorderType.RRect,
        //color: Color(0xFFBBBBBB),
        color: state.errorText != null ? AppTheme.of(context).error : Color(0xFFBBBBBB),
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
