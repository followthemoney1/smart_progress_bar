library smart_progress_bar;

import 'package:flutter/cupertino.dart';
import 'package:native_progress_hud/native_progress_hud.dart';

class SmartProgressBar {
  static void showProgressBar(
      {String text,
      String backgroundColorHex = "#000000",
      String textColorHex = "#ffffff",
      Color backgroundColor,
      Color textColor}) async {
    backgroundColorHex = backgroundColor != null
        ? backgroundColor.value.toRadixString(16)
        : backgroundColorHex;
    textColorHex =
        textColor != null ? textColor.value.toRadixString(16) : textColorHex;
    try {
      text == null
          ? await NativeProgressHud.showWaiting(
              backgroundColor: backgroundColorHex, textColor: textColorHex)
          : await NativeProgressHud.showWaitingWithText(text,
              backgroundColor: backgroundColorHex, textColor: textColorHex);
      await whileRun();
    } catch (e) {
      print(e);
    } finally {
      await Future.delayed(Duration(seconds: 1),
          () => NativeProgressHud.hideWaiting()); //for visibility
    }
  }
}

extension SmartProgressBarFutureExt<T> on Future<T> {
  Future<T> withSmartProgressBar(
      {String text,
      String backgroundColorHex = "#000000",
      String textColorHex = "#ffffff",
      Color backgroundColor,
      Color textColor}) async {
    var res;

    backgroundColorHex = backgroundColor != null
        ? backgroundColor.value.toRadixString(16)
        : backgroundColorHex;
    textColorHex =
        textColor != null ? textColor.value.toRadixString(16) : textColorHex;
    try {
      text == null
          ? await NativeProgressHud.showWaiting(
              backgroundColor: backgroundColorHex, textColor: textColorHex)
          : await NativeProgressHud.showWaitingWithText(text,
              backgroundColor: backgroundColorHex, textColor: textColorHex);
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
