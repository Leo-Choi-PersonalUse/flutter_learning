import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'package:dotted_border/dotted_border.dart';
import 'dart:typed_data';
import 'dart:convert';
import 'dart:ui' as ui;
import 'package:image/image.dart' as img;

class SignatureModal extends StatefulWidget {
  const SignatureModal({super.key});

  @override
  State<SignatureModal> createState() => _SignatureModalState();
}

class _SignatureModalState extends State<SignatureModal> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.white,
    exportPenColor: Colors.black,
    exportBackgroundColor: Colors.white,
    onDrawStart: () => print('onDrawStart called!'),
    onDrawEnd: () => print('onDrawEnd called!'),
  );

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
        insetPadding: const EdgeInsets.only(left: 20, right: 20),
        child: IntrinsicHeight(
          child: Container(
            height: 400,
            child: Column(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 30),
                    child: Text(
                      //alertTitle,
                      "簽名",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                //SIGNATURE CANVAS
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: DottedBorder(
                          color: Color(0xFFBBBBBB),
                          dashPattern: [6, 6, 6, 6],
                          borderType: BorderType.RRect,
                          radius: Radius.circular(12),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Signature(controller: _controller, height: 150, backgroundColor: Colors.transparent
                                //backgroundColor: Color(0xFFFFFFFF),
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.only(top: 20, left: 20, right: 10, bottom: 0),
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              color: Color(0xFF747474),
                            ),
                            height: 50,
                            child: TextButton(
                              onPressed: () async {
                                _controller.clear();
                              },
                              child: Text("重設"),
                            ),
                          )),
                    ),
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.only(top: 20, left: 10, right: 20, bottom: 40),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0)), color: Color(0xFF747474)),
                            height: 50,
                            child: TextButton(
                              onPressed: () async {
                                ui.Image? signature = await _controller.toImage();
                                if (signature == null) return Navigator.of(context).pop();
                                final pngBytes = await signature!.toByteData(format: ui.ImageByteFormat.png);
                                Uint8List pngUint8List = pngBytes!.buffer.asUint8List();
                                Navigator.of(context).pop(base64Encode(pngUint8List));
                              },
                              child: Text("確定"),
                            ),
                          )),
                    ),
                  ],
                ),

                true
                    ? Row(
                        children: [
                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    //color: Color(ConstantValue.themeColor),
                                  ),
                                  height: 50,
                                  child: TextButton(
                                    onPressed: () async {
                                      //if (cancelBtnPessedCallback != null) cancelBtnPessedCallback!();

                                      Navigator.of(context).pop();
                                    },
                                    child: Text("取消"),
                                  ),
                                )),
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
        ));
  }
}
