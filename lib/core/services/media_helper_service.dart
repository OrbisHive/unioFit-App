import 'dart:io';
import 'dart:typed_data';

import 'package:video_thumbnail/video_thumbnail.dart';

/// Media Helper Service
/// Handles media-related utilities like thumbnail generation
class MediaHelperService {
  /// Generates a thumbnail image from a video file
  /// Returns Uint8List bytes of the thumbnail image
  Future<Uint8List?> generateVideoThumbnail(String videoPath) async {
    try {
      final data = await VideoThumbnail.thumbnailData(
        video: videoPath,
        imageFormat: ImageFormat.JPEG,
        maxWidth: 512,
        quality: 75,
      );
      return data;
    } catch (e) {
      return null;
    }
  }

  /// Gets video duration in seconds
  Future<double?> getVideoDuration(String videoPath) async {
    try {
      // Using video_player package would be better, but for simplicity
      // we'll use a basic approach with File metadata
      // Note: This is a simplified approach. For accurate duration,
      // consider using video_player or ffmpeg
      final file = File(videoPath);
      if (await file.exists()) {
        // This is a placeholder - actual duration detection requires
        // video_player or similar package
        // For now, return null and handle duration check in video_trimmer
        return null;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Checks if file is a video based on extension
  bool isVideoFile(String filePath) {
    final extension = filePath.toLowerCase().split('.').last;
    return ['mp4', 'mov', 'avi', 'mkv', 'webm'].contains(extension);
  }

  /// Checks if file is an image based on extension
  bool isImageFile(String filePath) {
    final extension = filePath.toLowerCase().split('.').last;
    return ['jpg', 'jpeg', 'png', 'gif', 'webp'].contains(extension);
  }
}

