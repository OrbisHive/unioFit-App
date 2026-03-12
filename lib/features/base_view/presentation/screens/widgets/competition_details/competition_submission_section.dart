import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../core/constants/heights_widths.dart';
import '../../../../../../core/resources/localization/localization_map.dart';
import '../../../../../../core/resources/resources.dart';
import '../../../../../../core/utils/app_button.dart';
import '../dashboard_widget_helpers.dart';

/// Competition Submission Section
/// Handles online competition submission
class CompetitionSubmissionSection extends StatefulWidget {
  final bool isDark;
  final VoidCallback? onSubmissionSuccess;

  const CompetitionSubmissionSection({
    super.key,
    required this.isDark,
    this.onSubmissionSuccess,
  });

  @override
  State<CompetitionSubmissionSection> createState() =>
      _CompetitionSubmissionSectionState();
}

class _CompetitionSubmissionSectionState
    extends State<CompetitionSubmissionSection> {
  final TextEditingController _descriptionController = TextEditingController();
  bool _hasImage = false;

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  void _handleUploadPhoto() {
    // Mock photo upload - just set flag
    setState(() {
      _hasImage = true;
    });
  }

  void _handleSubmit() {
    if (_hasImage) {
      widget.onSubmissionSuccess?.call();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("submission_success".L()),
          backgroundColor: R.appColors.success,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please upload a photo first"),
          backgroundColor: R.appColors.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DashboardWidgetHelpers.cardContainer(
      isDark: widget.isDark,
      padding: EdgeInsets.all(4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "submit_entry".L(),
            style: R.textStyles.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: widget.isDark
                  ? R.appColors.darkTextPrimary
                  : R.appColors.textPrimary,
            ),
          ),
          h3,
          // Upload Photo Button
          GestureDetector(
            onTap: _handleUploadPhoto,
            child: Container(
              height: 150.px,
              width: double.infinity,
              decoration: BoxDecoration(
                color: widget.isDark
                    ? R.appColors.darkSurfaceVariant
                    : R.appColors.surfaceVariant,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: R.appColors.outline,
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
              ),
              child: _hasImage
                  ? Stack(
                      children: [
                        Center(
                          child: Icon(
                            Icons.check_circle,
                            size: 60.px,
                            color: R.appColors.success,
                          ),
                        ),
                        Positioned(
                          top: 8.px,
                          right: 8.px,
                          child: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              setState(() {
                                _hasImage = false;
                              });
                            },
                          ),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt,
                          size: 40.px,
                          color: widget.isDark
                              ? R.appColors.darkTextSecondary
                              : R.appColors.textSecondary,
                        ),
                        h1,
                        Text(
                          "upload_photo".L(),
                          style: R.textStyles.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: widget.isDark
                                ? R.appColors.darkTextSecondary
                                : R.appColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
          h3,
          // Description TextField
          TextField(
            controller: _descriptionController,
            maxLines: 4,
            decoration: R.appDecorations.inputDecorationWithHint(
              hintText: "add_description",
              filledColor: widget.isDark
                  ? R.appColors.darkSurfaceVariant
                  : R.appColors.surfaceVariant,
              borderRadius: 12,
            ),
            style: R.textStyles.poppins(
              fontSize: 14,
              color: widget.isDark
                  ? R.appColors.darkTextPrimary
                  : R.appColors.textPrimary,
            ),
          ),
          h3,
          // Submit Button
          AppIconButton(
            onPressed: _handleSubmit,
            title: "submit_entry_button",
            iconWidget: Icon(
              Icons.rocket_launch,
              color: R.appColors.onPrimary,
              size: 20.px,
            ),
            backgroundColor: R.appColors.primary,
            textColor: R.appColors.onPrimary,
            radius: 12,
          ),
        ],
      ),
    );
  }
}

