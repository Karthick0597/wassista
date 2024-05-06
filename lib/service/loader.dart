import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../widget/constant.dart';

class LoadingDialog {
  static showLoaderDialog(BuildContext context, String popUpMsg) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return  SpinKitFadingCircle(
          color: primaryColor,
        );
      },
    );
  }
}
