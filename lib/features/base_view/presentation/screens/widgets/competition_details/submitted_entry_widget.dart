import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../core/constants/heights_widths.dart';
import '../../../../../../core/resources/localization/localization_map.dart';
import '../../../../../../core/resources/resources.dart';
import '../../../../../../core/utils/custom_video_player.dart';
import '../dashboard_widget_helpers.dart';
import '../media_preview_widget.dart';

/// Submitted Entry Widget
/// Displays user's submitted entry with thumbnail, description, filename, and size
class SubmittedEntryWidget extends StatelessWidget {
  final File? submittedFile;
  final Uint8List? thumbnailBytes;
  final bool isVideo;
  final String description;
  final String fileName;
  final String fileSize;
  final bool isDark;

  const SubmittedEntryWidget({
    super.key,
    required this.submittedFile,
    this.thumbnailBytes,
    required this.isVideo,
    required this.description,
    required this.fileName,
    required this.fileSize,
    required this.isDark,
  });

  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  @override
  Widget build(BuildContext context) {
    return DashboardWidgetHelpers.cardContainer(
      isDark: isDark,
      padding: EdgeInsets.all(4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with status
          Row(
            children: [
              Icon(
                Icons.check_circle,
                color: R.appColors.success,
                size: 24.px,
              ),
              w1,
              Text(
                "submission_received".L(),
                style: R.textStyles.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: R.appColors.success,
                ),
              ),
            ],
          ),
          h3,
          // Submitted Media Preview
          if (submittedFile != null)
            GestureDetector(
              onTap: isVideo
                  ? () {
                      // Open video player
                      Get.toNamed(
                        CustomVideoPlayer.route,
                        arguments: {
                          'videoUrl': submittedFile!.path,
                          'isShowControls': true,
                        },
                      );
                    }
                  : null,
              child: Container(
                constraints: BoxConstraints(
                  minHeight: 150.px,
                  maxHeight: 300.px,
                ),
                decoration: BoxDecoration(
                  color: isDark
                      ? R.appColors.darkSurfaceVariant
                      : R.appColors.surfaceVariant,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: R.appColors.outline,
                    width: 1,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: isVideo
                      ? _buildVideoPreview()
                      : _buildImagePreview(),
                ),
              ),
            ),
          h3,
          // Description
          if (description.isNotEmpty) ...[
            Text(
              "Description",
              style: R.textStyles.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isDark
                    ? R.appColors.darkTextPrimary
                    : R.appColors.textPrimary,
              ),
            ),
            h1,
            Text(
              description,
              style: R.textStyles.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: isDark
                    ? R.appColors.darkTextSecondary
                    : R.appColors.textSecondary,
              ),
            ),
            h3,
          ],
          // File Info
          Container(
            padding: EdgeInsets.all(3.w),
            decoration: BoxDecoration(
              color: isDark
                  ? R.appColors.darkSurfaceVariant
                  : R.appColors.surfaceVariant,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  isVideo ? Icons.videocam : Icons.image,
                  color: isDark
                      ? R.appColors.darkTextSecondary
                      : R.appColors.textSecondary,
                  size: 20.px,
                ),
                w2,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fileName,
                        style: R.textStyles.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: isDark
                              ? R.appColors.darkTextPrimary
                              : R.appColors.textPrimary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      h1,
                      Text(
                        fileSize,
                        style: R.textStyles.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: isDark
                              ? R.appColors.darkTextSecondary
                              : R.appColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImagePreview() {
    return SizedBox(
      width: double.infinity,
      height: 200.px,
      child: Image.file(
        submittedFile!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 200.px,
            color: isDark
                ? R.appColors.darkSurfaceVariant
                : R.appColors.surfaceVariant,
            child: Center(
              child: Icon(
                Icons.broken_image,
                color: isDark
                    ? R.appColors.darkTextSecondary
                    : R.appColors.textSecondary,
                size: 48.px,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildVideoPreview() {
    return SizedBox(
      width: double.infinity,
      height: 200.px,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Thumbnail or placeholder
          thumbnailBytes != null
              ? Image.memory(
                  thumbnailBytes!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return _buildVideoPlaceholder();
                  },
                )
              : _buildVideoPlaceholder(),
          // Play Icon Overlay
          Center(
            child: Container(
              padding: EdgeInsets.all(16.px),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.play_circle_fill,
                color: R.appColors.white,
                size: 48.px,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoPlaceholder() {
    return Container(
      height: 200.px,
      color: isDark
          ? R.appColors.darkSurfaceVariant
          : R.appColors.surfaceVariant,
      child: Center(
        child: Icon(
          Icons.videocam,
          color: isDark
              ? R.appColors.darkTextSecondary
              : R.appColors.textSecondary,
          size: 48.px,
        ),
      ),
    );
  }
}

