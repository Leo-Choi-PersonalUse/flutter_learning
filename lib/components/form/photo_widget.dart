import "package:flutter/material.dart";
import 'dart:convert';
import "../../model/index.dart";
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';

class PhotoWidget extends StatefulWidget {
  QuestionObj questionObj;

  PhotoWidget({Key? key, required this.questionObj}) : super(key: key);

  @override
  State<PhotoWidget> createState() => _PhotoWidgetState();
}

class _PhotoWidgetState extends State<PhotoWidget> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late bool isReadOnly;
  late String title;
  late double fontSize;
  late bool isVisible;
  late FieldDirection fieldDirection = FieldDirection.vertical;

  //
  List<PhotoObj> photoList = [];

  Future<void> addPhotoToList({required XFile photo}) async {
    final bytes = await photo!.readAsBytes();
    final base64String = base64Encode(bytes);

    photoList.add(PhotoObj(base64: base64String));
    setState(() {});
  }

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
    super.build(context);
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
                    final XFile? photo = await ImagePicker()
                        .pickImage(source: ImageSource.camera);

                    addPhotoToList(photo: photo!);

                    debugPrint("photo button pressed");

                    //cameraSourceActionSheet();
                  },
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        photoList.length,
                        (index) => GestureDetector(
                          onTap: () {
                            // photoPressed(index);
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
