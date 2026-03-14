import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/constants/heights_widths.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/utils/custom_video_player.dart';

/// Media Preview Widget
/// Displays preview for images and videos with remove button
class MediaPreviewWidget extends StatelessWidget {
  final File? mediaFile;
  final Uint8List? thumbnailBytes;
  final bool isVideo;
  final VoidCallback onRemove;
  final bool isDark;

  const MediaPreviewWidget({
    super.key,
    required this.mediaFile,
    this.thumbnailBytes,
    this.isVideo = false,
    required this.onRemove,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    if (mediaFile == null) {
      return const SizedBox.shrink();
    }

    return Container(
      constraints: BoxConstraints(
        minHeight: 150.px,
        maxHeight: 300.px,
      ),
      decoration: BoxDecoration(
        color: isDark ? R.appColors.darkSurfaceVariant : R.appColors.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: R.appColors.outline,
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          // Media Preview
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: isVideo
                ? _buildVideoPreview()
                : _buildImagePreview(),
          ),
          // Remove Button
          Positioned(
            top: 8.px,
            right: 8.px,
            child: GestureDetector(
              onTap: onRemove,
              child: Container(
                padding: EdgeInsets.all(6.px),
                decoration: BoxDecoration(
                  color: R.appColors.error,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.close,
                  color: R.appColors.white,
                  size: 18.px,
                ),
              ),
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
        mediaFile!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 200.px,
            color: isDark ? R.appColors.darkSurfaceVariant : R.appColors.surfaceVariant,
            child: Center(
              child: Icon(
                Icons.broken_image,
                color: isDark ? R.appColors.darkTextSecondary : R.appColors.textSecondary,
                size: 48.px,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildVideoPreview() {
    return GestureDetector(
      onTap: () {
        // Open video player when video is tapped
        if (mediaFile != null) {
          Get.toNamed(
            CustomVideoPlayer.route,
            arguments: {
              'videoUrl': mediaFile!.path,
              'isShowControls': true,
            },
          );
        }
      },
      child: SizedBox(
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
      ),
    );
  }

  Widget _buildVideoPlaceholder() {
    return Container(
      height: 200.px,
      color: isDark ? R.appColors.darkSurfaceVariant : R.appColors.surfaceVariant,
      child: Center(
        child: Icon(
          Icons.videocam,
          color: isDark ? R.appColors.darkTextSecondary : R.appColors.textSecondary,
          size: 48.px,
        ),
      ),
    );
  }
}

