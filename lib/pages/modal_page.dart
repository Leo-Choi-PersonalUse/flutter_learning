import 'package:flutter/material.dart';
import '/theme/AppTheme.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter_learning/components/modal/custom_modal.dart';
import 'package:flutter_learning/pages/ApplicationFormPage.dart';

class ModalPage extends StatefulWidget {
  const ModalPage({Key? key}) : super(key: key);

  //final String title;

  @override
  State<ModalPage> createState() => _ModalPageState();
}

Widget testWidget() {
  return SingleChildScrollView(
    child: Column(
      children: [
        Text("aaa"),
        Text("aaa"),
        Text("aaa"),
        Text("aaa"),
        Text("aaa"),
        Text("aaa"),
        Text("aaa"),
        Text("aaa"),
        Text("aaa"),
        Text("aaa"),
        Text("aaa"),
        Text("baaa"),
        Text("baaa"),
        Text("baaa"),
        Text("baaa"),
        Text("baaa"),
        Text("baaa"),
        Text("baaa"),
        Text("baaa"),
        Text("baaa"),
        Text("baaa"),
        Text("baaa"),
        Text("baaa"),
        Text("baaa"),
        Text("baaa"),
        Text("baaa"),
        Text("baaa"),
        Text("baaa"),
        Text("baaa"),
        Text("baaa"),
        Text("baaa"),
        Text("baaa"),
        Text("baaa"),
        Text("baaa"),
        Text("baaa"),
        Text("baaa"),
        Text("caaa"),
        Text("caaa"),
        Text("caaa"),
        Text("caaa"),
        Text("caaa"),
        Text("caaa"),
        Text("caaa"),
        Text("caaa"),
        Text("caaa"),
        Text("caaa"),
        Text("caaa"),
        Text("caaa"),
        Text("caaa"),
        Text("caaa"),
        Text("caaa"),
        Text("caaa"),
      ],
    ),
  );
}

class _ModalPageState extends State<ModalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.of(context).appBar,
        title: Text("Modal Page"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              showFlexibleBottomSheet(
                minHeight: 0,
                initHeight: 0.5,
                maxHeight: 1,
                context: context,
                builder: _buildBottomSheet,
                anchors: [0, 0.5, 1],
                isSafeArea: true,
              );
            },
            child: Center(
              child: Text("Show Bottom Sheet"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showStickyFlexibleBottomSheet(
                isSafeArea: true,
                minHeight: 0,
                initHeight: 0.5,
                maxHeight: 1,
                headerHeight: 20,
                context: context,
                //backgroundColor: Colors.white,
                headerBuilder: (BuildContext context, double offset) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    //color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: Row(
                        children: [
                          Expanded(child: Container()), //left padding
                          Container(
                            width: 50,
                            height: 6,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          Expanded(child: Container()), //right padding
                        ],
                      ),
                    ),
                  );
                },
                bodyBuilder: (BuildContext context, double offset) {
                  //return SliverChildListDelegate(<Widget>[]);
                  return SliverChildListDelegate(
                    [
                      Container(
                        height: 100,
                        color: Colors.purpleAccent,
                      ),
                      Container(
                        height: 100,
                        color: Colors.red,
                      ),
                      Container(
                        height: 100,
                        color: Colors.yellow,
                      ),
                      Container(
                        height: 100,
                        color: Colors.orange,
                      ),
                      Container(
                        height: 100,
                        color: Colors.blue,
                      ),
                      Container(
                        height: 100,
                        color: Colors.green,
                      ),
                      Container(
                        height: 100,
                        color: Colors.purpleAccent,
                      ),
                      Container(
                        height: 100,
                        color: Colors.red,
                      ),
                      Container(
                        height: 100,
                        color: Colors.yellow,
                      ),
                      Container(
                        height: 100,
                        color: Colors.orange,
                      ),
                      Container(
                        height: 100,
                        color: Colors.blue,
                      ),
                      Container(
                        height: 100,
                        color: Colors.green,
                      ),
                    ],
                  );
                },
                anchors: [0, 0.5, 1],
              );
            },
            child: Center(
              child: Text("Show Bottom Sheet - Sticky Header"),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var a = await CustomModal.show(
                context: context,
                body: testWidget(),
              );
              print("a");
            },
            child: Center(
              child: Text("Custom Modal"),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildBottomSheet(
  BuildContext context,
  ScrollController scrollController,
  double bottomSheetOffset,
) {
  return Material(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
          child: Row(
            children: [
              Expanded(child: Container()), //left padding
              Container(
                width: 50,
                height: 6,
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Expanded(child: Container()), //right padding
            ],
          ),
        ),
        Expanded(
          child: ListView(
            controller: scrollController,
            children: [
              // Add your list items here
            ],
          ),
        ),
      ],
    ),
  );
}
