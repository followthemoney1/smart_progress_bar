library smart_progress_bar;

import 'package:flutter/cupertino.dart';
import 'package:native_progress_hud/native_progress_hud.dart';

void showProgressBar(
    {Function whileRun,
    String text,
    String backgroundColorHex = "#000000",
    String textColorHex = "#ffffff",
    Color backgroundColor,
    Color textColor}) async {
  backgroundColorHex =
      backgroundColor != null ? backgroundColor.toHex() : backgroundColorHex;
  textColorHex = textColor != null ? textColor.toHex() : textColorHex;
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

extension SmartProgressBarFutureExt<T> on Future<T> {
  Future<T> showProgressBar(
      {String text,
      String backgroundColorHex = "#000000",
      String textColorHex = "#ffffff",
      Color backgroundColor,
      Color textColor}) async {
    var res;

    backgroundColorHex =
        backgroundColor != null ? backgroundColor.toHex() : backgroundColorHex;
    textColorHex = textColor != null ? textColor.toHex() : textColorHex;
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

extension SmartProgressBarColorExt on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
