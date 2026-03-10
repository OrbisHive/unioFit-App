import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../resources/resources.dart';
import '../resources/localization/localization_map.dart';

class AppButton extends StatefulWidget {
  VoidCallback? onPressed;
  String title;
  double? textSize;
  FontWeight? textWeight;
  Color? backgroundColor;
  Color? textColor;
  double? elevation;
  double? radius;
  double? height;
  double? width;
  double? borderWidth;
  Color? borderColor;
  Widget? iconWidget;
  bool isLocalizedText;
  bool? showOutLineBorder;
  EdgeInsets? contentPadding;
  TextAlign? textAlign;
  bool fullWidth;

  AppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.textSize,
    this.backgroundColor,
    this.textColor,
    this.radius,
    this.height,
    this.width,
    this.borderWidth,
    this.borderColor,
    this.elevation,
    this.iconWidget,
    this.contentPadding,
    this.showOutLineBorder,
    this.isLocalizedText = true,
    this.fullWidth = true,
    this.textWeight,
    this.textAlign,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 50,
      width: widget.fullWidth ? widget.width ?? 100.w : null,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: (widget.showOutLineBorder ?? false)
                ? BorderSide(
              color: widget.borderColor ?? R.appColors.outline,
              width: widget.borderWidth ?? 1,
            )
                : BorderSide.none,
            borderRadius: BorderRadius.circular(widget.radius ?? 14),
          ),
          padding: widget.contentPadding ?? EdgeInsets.zero,
          elevation: 0,
          // shadowColor:
          //     WidgetStatePropertyAll(R.appColors.black.withOpacity(0.8)),
          // backgroundColor: widget.backgroundColor ?? ,
        ),
        child: widget.iconWidget != null
            ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.isLocalizedText ? widget.title.L() : widget.title,
              style: R.textStyles.poppins(
                // color: widget.textColor ?? R.appColors.white,
                fontSize: widget.textSize ?? 14.px,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 10),
            widget.iconWidget ?? const SizedBox(),
          ],
        )
            : Text(
          widget.isLocalizedText ? widget.title.L() : widget.title,
          textAlign: widget.textAlign ?? TextAlign.center,
          style: R.textStyles.poppins(
            color: widget.textColor ?? R.appColors.white,
            fontSize: widget.textSize ?? 14.px,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class AppIconButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String title;
  final double? textSize;
  final FontWeight? textWeight;
  final Color? backgroundColor;
  final Color? textColor;
  final double? elevation;
  final double? radius;
  final double? height;
  final double? width;
  final double? borderWidth;
  final Color? borderColor;
  final Widget iconWidget;
  final bool isLocalizedText;
  final bool? showOutLineBorder;
  final EdgeInsets? contentPadding;
  final bool? hideTitle;

  const AppIconButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.iconWidget,
    this.textSize,
    this.textWeight,
    this.backgroundColor,
    this.textColor,
    this.elevation,
    this.radius,
    this.height,
    this.width,
    this.borderWidth,
    this.borderColor,
    this.isLocalizedText = true,
    this.showOutLineBorder,
    this.contentPadding,
    this.hideTitle = false,
  });

  @override
  State<AppIconButton> createState() => _AppIconButtonState();
}

class _AppIconButtonState extends State<AppIconButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 50,
      width: widget.width ?? 100.w,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: (widget.showOutLineBorder ?? false)
                ? BorderSide(
              color: widget.borderColor ?? R.appColors.outline,
              width: widget.borderWidth ?? 1,
            )
                : BorderSide.none,
            borderRadius: BorderRadius.circular(widget.radius ?? 14),
          ),
          padding: widget.contentPadding ?? EdgeInsets.zero,
          elevation: widget.elevation ?? 0,
          backgroundColor:
          widget.backgroundColor ?? R.appColors.primary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.iconWidget,
            if (widget.hideTitle == false) ...[
              const SizedBox(width: 5),
              Text(
                widget.isLocalizedText ? widget.title.L() : widget.title,
                style: R.textStyles.poppins(
                  color: widget.textColor ?? R.appColors.white,
                  fontSize: widget.textSize ?? 14.px,
                  fontWeight: widget.textWeight ?? FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}