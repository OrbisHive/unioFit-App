import 'package:flutter/material.dart';

class MediaQueryUtils {
  const MediaQueryUtils._(); // Prevent instantiation

  static double getClampedTextScaleFactor(
      BuildContext context, {
        double min = 1.0,
        double max = 1.2,
      }) {
    final rawScale = View.of(context).platformDispatcher.textScaleFactor;
    return rawScale.clamp(min, max);
  }

  /// Returns a TextScaler.
  /// Set [ignoreGlobalTextScaler] to true to bypass global clamping behavior.
  static TextScaler getTextScaler(
      BuildContext context, {
        double min = 1.0,
        double max = 1.2,
        bool ignoreGlobalTextScaler = false,
      }) {
    if (ignoreGlobalTextScaler) {
      final rawScale = View.of(context).platformDispatcher.textScaleFactor;
      return TextScaler.linear(rawScale);
    }

    final clampedScale = getClampedTextScaleFactor(context, min: min, max: max);
    return TextScaler.linear(clampedScale);
  }
}


// Sample Code to Disable Global TextScale
/*
@override
Widget build(BuildContext context) {
  final mediaQuery = MediaQuery.of(context);

  return MediaQuery(
    data: mediaQuery.copyWith(
      textScaler: MediaQueryUtils.getTextScaler(
        context,
        ignoreGlobalTextScaler: true, // 👈 disables global clamp
      ),
    ),
    child: YourView(),
  );
}
*/