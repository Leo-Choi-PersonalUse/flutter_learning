import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'package:dotted_border/dotted_border.dart';
import 'dart:typed_data';
import 'dart:convert';
import 'dart:ui' as ui;
import 'package:flutter_learning/appState.dart';
import 'package:image/image.dart' as img;

class SignatureModal extends StatefulWidget {
  const SignatureModal({super.key});

  @override
  State<SignatureModal> createState() => _SignatureModalState();
}

class _SignatureModalState extends State<SignatureModal> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 2,
    penColor: AppState().isDarkMode ? Colors.white : Colors.black,
    exportPenColor: Colors.black,
    exportBackgroundColor: Colors.transparent,
    onDrawStart: () => print('onDrawStart called!'),
    onDrawEnd: () => print('onDrawEnd called!'),
  );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      insetPadding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 30),
              child: Text(
                "簽名",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
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
                        child: Signature(controller: _controller, height: 150, backgroundColor: Colors.transparent),
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
                    padding: EdgeInsets.only(top: 40, left: 20, right: 10, bottom: 0),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      height: 50,
                      child: TextButton(
                        onPressed: () async {
                          _controller.clear();
                        },
                        child: Text("重設"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 40, left: 10, right: 20, bottom: 0),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      height: 50,
                      child: TextButton(
                        onPressed: () async {
                          ui.Image? signature = await _controller.toImage();
                          if (signature == null) return Navigator.of(context).pop();
                          final pngBytes = await signature.toByteData(format: ui.ImageByteFormat.png);
                          Uint8List pngUint8List = pngBytes!.buffer.asUint8List();
                          Navigator.of(context).pop(base64Encode(pngUint8List));
                        },
                        child: Text("確定"),
                      ),
                    ),
                  ),
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
                            ),
                            height: 50,
                            child: TextButton(
                              onPressed: () async {
                                Navigator.of(context).pop();
                              },
                              child: Text("取消"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
