import 'package:flutter/material.dart';
import '/theme/AppTheme.dart';
import 'package:bottom_sheet/bottom_sheet.dart';

class CustomModal {
  static Future<dynamic> show({
    required BuildContext context,
    required Widget body,
    Color bottomSheetColor = Colors.white,
  }) async {
    return await showStickyFlexibleBottomSheet(
      isSafeArea: true,
      minHeight: 0,
      initHeight: 0.5,
      maxHeight: 1,
      headerHeight: 20,
      context: context,
      //bottomSheetColor: bottomSheetColor,
      headerBuilder: (BuildContext context, double offset) {
        return Container(
          decoration: BoxDecoration(
            //color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
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
        return SliverChildListDelegate([body]);
      },
      anchors: [0, 0.5, 1],
    );
  }
}
