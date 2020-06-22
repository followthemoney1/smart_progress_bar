library smart_progress_bar;

import 'package:flutter/cupertino.dart';
import 'package:native_progress_hud/native_progress_hud.dart';

class SmartProgressBar {
  static void withSmartProgressBar(
      {Function whileRun,
      String text,
      String backgroundColor = "#000000",
      String textColor = "#ffffff"}) async {
    try {
      text == null
          ? await NativeProgressHud.showWaiting(
              backgroundColor: backgroundColor, textColor: textColor)
          : await NativeProgressHud.showWaitingWithText(text,
              backgroundColor: backgroundColor, textColor: textColor);
      await whileRun();
    } catch (e) {
      print(e);
    } finally {
      await Future.delayed(Duration(seconds: 1),
          () => NativeProgressHud.hideWaiting()); //for visibility
    }
  }
}

//extension SmartProgressBarFunctionExt on Function {
//  Function withSmartProgressBar(
//      {String text,
//      String backgroundColor = "#000000",
//      String textColor = "#ffffff"}) {
//    var res;
////    Future.delayed(Duration(seconds: 8), () => NativeProgressHud.hideWaiting());
//    try {
//      text == null
//          ? NativeProgressHud.showWaiting(
//              backgroundColor: backgroundColor, textColor: textColor)
//          : NativeProgressHud.showWaitingWithText(text,
//              backgroundColor: backgroundColor, textColor: textColor);
//      res = this;
//    } catch (e) {
//      print(e);
//    } finally {
//      Future.delayed(Duration(seconds: 1),
//          () => NativeProgressHud.hideWaiting()); //for visibility
//    }
//    return res;
//  }
//}

extension SmartProgressBarFutureExt<T> on Future<T> {
  Future<T> withSmartProgressBar(
      {String text,
      String backgroundColor = "#000000",
      String textColor = "#ffffff"}) async {
    var res;
//    Future.delayed(Duration(seconds: 8), () => NativeProgressHud.hideWaiting());
    try {
      text == null
          ? await NativeProgressHud.showWaiting(
              backgroundColor: backgroundColor, textColor: textColor)
          : await NativeProgressHud.showWaitingWithText(text,
              backgroundColor: backgroundColor, textColor: textColor);
      res = await this;
    } catch (e) {
      print(e);
    } finally {
      await Future.delayed(Duration(seconds: 1),
          () => NativeProgressHud.hideWaiting()); //for visibility
    }
    return res;
  }
}
