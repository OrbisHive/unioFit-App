import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../core/constants/heights_widths.dart';
import '../../../../../../core/resources/localization/localization_map.dart';
import '../../../../../../core/resources/resources.dart';
import '../../../../../../core/services/media_helper_service.dart';
import '../../../../../../core/services/picker_service.dart';
import '../../../../../../core/utils/app_button.dart';
import '../../video_trimmer_screen.dart';
import '../dashboard_widget_helpers.dart';
import '../media_preview_widget.dart';

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
  final PickerService _pickerService = PickerService();
  final MediaHelperService _mediaHelper = MediaHelperService();
  File? _selectedFile;
  Uint8List? _videoThumbnail;
  bool _isVideo = false;
  bool _isUploading = false;
  double _uploadProgress = 0.0;

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _handleUploadMedia() async {
    final file = await _pickerService.showSourcePicker(context);
    if (file != null) {
      final selectedFile = File(file.path);
      final isVideo = _mediaHelper.isVideoFile(file.path);

      if (isVideo) {
        // Open trimmer screen using Get.toNamed with arguments
        final result = await Get.toNamed(
          VideoTrimmerScreen.route,
          arguments: {
            "mediaFile": selectedFile,
            "onTap": (trimmedFile) async {
              if (trimmedFile != null && mounted) {
                final thumbnail =
                    await _mediaHelper.generateVideoThumbnail(trimmedFile.path);
                if (mounted) {
                  setState(() {
                    _selectedFile = trimmedFile;
                    _isVideo = true;
                    _videoThumbnail = thumbnail;
                  });
                }
              }
            },
          },
        );

        // If user cancelled trimming, result will be null
        if (result == null) {
          return;
        }
      } else {
        setState(() {
          _selectedFile = selectedFile;
          _isVideo = false;
          _videoThumbnail = null;
        });
      }
    }
  }

  void _handleRemoveMedia() {
    setState(() {
      _selectedFile = null;
      _isVideo = false;
      _videoThumbnail = null;
    });
  }

  void _handleSubmit() {
    if (_selectedFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please upload a photo or video first"),
          backgroundColor: R.appColors.error,
        ),
      );
      return;
    }

    // Simulate upload progress
    setState(() {
      _isUploading = true;
      _uploadProgress = 0.0;
    });

    // Mock upload progress
    _simulateUpload();
  }

  void _simulateUpload() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() {
          _uploadProgress += 0.1;
        });

        if (_uploadProgress < 1.0) {
          _simulateUpload();
        } else {
          setState(() {
            _isUploading = false;
            _uploadProgress = 0.0;
          });
          widget.onSubmissionSuccess?.call();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("entry_submitted_mock".L()),
              backgroundColor: R.appColors.success,
            ),
          );
        }
      }
    });
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
          // Media Preview or Upload Button
          _selectedFile != null
              ? MediaPreviewWidget(
                  mediaFile: _selectedFile,
                  thumbnailBytes: _videoThumbnail,
                  isVideo: _isVideo,
                  onRemove: _handleRemoveMedia,
                  isDark: widget.isDark,
                )
              : GestureDetector(
                  onTap: _handleUploadMedia,
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
                    child: Column(
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
          // Upload Progress
          if (_isUploading) ...[
            h3,
            Text(
              "uploading_entry".L(),
              style: R.textStyles.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: widget.isDark
                    ? R.appColors.darkTextSecondary
                    : R.appColors.textSecondary,
              ),
            ),
            h1,
            LinearProgressIndicator(
              value: _uploadProgress,
              backgroundColor: widget.isDark
                  ? R.appColors.darkSurfaceVariant
                  : R.appColors.surfaceVariant,
              valueColor: AlwaysStoppedAnimation<Color>(R.appColors.primary),
              minHeight: 4,
            ),
          ],
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

