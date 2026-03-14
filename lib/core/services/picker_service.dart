import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';
import '../constants/heights_widths.dart';
import '../resources/localization/localization_map.dart';
import '../resources/resources.dart';

/// Picker Service
/// Handles media selection from camera or gallery
class PickerService {
  final ImagePicker _imagePicker = ImagePicker();

  /// Shows bottom sheet to choose media source (Camera or Gallery)
  Future<XFile?> showSourcePicker(BuildContext context) async {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: isDark ? R.appColors.darkSurface : R.appColors.surface,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        padding: EdgeInsets.only(
          left: 4.w,
          right: 4.w,
          top: 3.h,
          bottom: MediaQuery.of(context).viewInsets.bottom + 2.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drag handle
            Center(
              child: Container(
                width: 40.px,
                height: 4.px,
                decoration: BoxDecoration(
                  color: isDark
                      ? R.appColors.darkTextSecondary
                      : R.appColors.textSecondary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            h3,
            // Title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Text(
                "choose_media_source".L(),
                style: R.textStyles.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: isDark
                      ? R.appColors.darkTextPrimary
                      : R.appColors.textPrimary,
                ),
              ),
            ),
            h2,
            // Camera option
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0),
              leading: Container(
                padding: EdgeInsets.all(12.px),
                decoration: BoxDecoration(
                  color: R.appColors.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.camera_alt,
                  color: R.appColors.primary,
                  size: 24.px,
                ),
              ),
              title: Text(
                "camera".L(),
                style: R.textStyles.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isDark
                      ? R.appColors.darkTextPrimary
                      : R.appColors.textPrimary,
                ),
              ),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
            // Gallery option
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0),
              leading: Container(
                padding: EdgeInsets.all(12.px),
                decoration: BoxDecoration(
                  color: R.appColors.success.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.photo_library,
                  color: R.appColors.success,
                  size: 24.px,
                ),
              ),
              title: Text(
                "gallery".L(),
                style: R.textStyles.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isDark
                      ? R.appColors.darkTextPrimary
                      : R.appColors.textPrimary,
                ),
              ),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
            h2,
          ],
        ),
      ),
    );

    if (source == null) return null;

    // Show media type picker
    return _showMediaTypePicker(context, source);
  }

  /// Shows bottom sheet to choose media type (Photo or Video)
  Future<XFile?> _showMediaTypePicker(
    BuildContext context,
    ImageSource source,
  ) async {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final mediaType = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: isDark ? R.appColors.darkSurface : R.appColors.surface,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        padding: EdgeInsets.only(
          left: 4.w,
          right: 4.w,
          top: 3.h,
          bottom: MediaQuery.of(context).viewInsets.bottom + 2.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drag handle
            Center(
              child: Container(
                width: 40.px,
                height: 4.px,
                decoration: BoxDecoration(
                  color: isDark
                      ? R.appColors.darkTextSecondary
                      : R.appColors.textSecondary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            h3,
            // Title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Text(
                "select_media_type".L(),
                style: R.textStyles.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: isDark
                      ? R.appColors.darkTextPrimary
                      : R.appColors.textPrimary,
                ),
              ),
            ),
            h2,
            // Photo option
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0),
              leading: Container(
                padding: EdgeInsets.all(12.px),
                decoration: BoxDecoration(
                  color: R.appColors.warning.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.photo_camera,
                  color: R.appColors.warning,
                  size: 24.px,
                ),
              ),
              title: Text(
                "photo".L(),
                style: R.textStyles.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isDark
                      ? R.appColors.darkTextPrimary
                      : R.appColors.textPrimary,
                ),
              ),
              onTap: () => Navigator.pop(context, "photo"),
            ),
            // Video option
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0),
              leading: Container(
                padding: EdgeInsets.all(12.px),
                decoration: BoxDecoration(
                  color: R.appColors.error.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.videocam,
                  color: R.appColors.error,
                  size: 24.px,
                ),
              ),
              title: Text(
                "video".L(),
                style: R.textStyles.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isDark
                      ? R.appColors.darkTextPrimary
                      : R.appColors.textPrimary,
                ),
              ),
              onTap: () => Navigator.pop(context, "video"),
            ),
            h2,
          ],
        ),
      ),
    );

    if (mediaType == null) return null;

    // Check and request permissions before picking
    final hasPermission = await _checkAndRequestPermission(context, source);
    if (!hasPermission) {
      return null;
    }

    // Pick media based on source and type
    if (mediaType == "photo") {
      if (source == ImageSource.camera) {
        return await pickImageFromCamera();
      } else {
        return await pickImageFromGallery();
      }
    } else {
      if (source == ImageSource.camera) {
        return await pickVideoFromCamera();
      } else {
        return await pickVideoFromGallery();
      }
    }
  }

  /// Checks and requests permission based on the source
  Future<bool> _checkAndRequestPermission(
    BuildContext context,
    ImageSource source,
  ) async {
    if (source == ImageSource.camera) {
      return await _checkAndRequestCameraPermission(context);
    } else {
      return await _checkAndRequestStoragePermission(context);
    }
  }

  /// Checks and requests camera permission
  Future<bool> _checkAndRequestCameraPermission(BuildContext context) async {
    final status = await Permission.camera.status;
    
    if (status.isGranted) {
      return true;
    }

    if (status.isDenied) {
      final result = await Permission.camera.request();
      if (result.isGranted) {
        return true;
      }
    }

    if (status.isPermanentlyDenied) {
      await _showPermissionDeniedDialog(
        context,
        "camera_permission_required".L(),
      );
      return false;
    }

    // Show permission denied message
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("camera_permission_required".L()),
          backgroundColor: R.appColors.error,
          duration: const Duration(seconds: 3),
        ),
      );
    }
    return false;
  }

  /// Checks and requests storage permission
  /// Handles both Android 13+ (photos) and older versions (storage)
  Future<bool> _checkAndRequestStoragePermission(BuildContext context) async {
    // List of permissions to try in order
    final permissions = [
      Permission.photos,      // Android 13+
      Permission.storage,     // Android < 13
      Permission.mediaLibrary, // iOS
    ];

    for (final permission in permissions) {
      try {
        final status = await permission.status;
        
        // If permission is already granted or limited, allow access
        if (status.isGranted || status.isLimited) {
          return true;
        }

        // Request permission if denied
        if (status.isDenied) {
          final result = await permission.request();
          if (result.isGranted || result.isLimited) {
            return true;
          }
        }

        // If permanently denied, show dialog to open settings
        if (status.isPermanentlyDenied) {
          await _showPermissionDeniedDialog(
            context,
            "storage_permission_required".L(),
          );
          return false;
        }
      } catch (e) {
        // If permission is not supported on this platform, try next one
        continue;
      }
    }

    // Show permission denied message if all checks fail
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("storage_permission_required".L()),
          backgroundColor: R.appColors.error,
          duration: const Duration(seconds: 3),
        ),
      );
    }
    return false;
  }

  /// Shows a dialog when permission is permanently denied
  Future<void> _showPermissionDeniedDialog(
    BuildContext context,
    String message,
  ) async {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (!context.mounted) return;

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDark ? R.appColors.darkSurface : R.appColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          "permission_denied".L(),
          style: R.textStyles.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: isDark
                ? R.appColors.darkTextPrimary
                : R.appColors.textPrimary,
          ),
        ),
        content: Text(
          message + "\n\n" + "permission_denied_message".L(),
          style: R.textStyles.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: isDark
                ? R.appColors.darkTextSecondary
                : R.appColors.textSecondary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "cancel".L(),
              style: R.textStyles.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isDark
                    ? R.appColors.darkTextSecondary
                    : R.appColors.textSecondary,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              openAppSettings();
            },
            child: Text(
              "open_settings".L(),
              style: R.textStyles.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: R.appColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Picks an image from camera
  Future<XFile?> pickImageFromCamera() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
      );
      return image;
    } catch (e) {
      return null;
    }
  }

  /// Picks a video from camera
  Future<XFile?> pickVideoFromCamera() async {
    try {
      final XFile? video = await _imagePicker.pickVideo(
        source: ImageSource.camera,
      );
      return video;
    } catch (e) {
      return null;
    }
  }

  /// Picks an image from gallery
  Future<XFile?> pickImageFromGallery() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );
      return image;
    } catch (e) {
      return null;
    }
  }

  /// Picks a video from gallery
  Future<XFile?> pickVideoFromGallery() async {
    try {
      final XFile? video = await _imagePicker.pickVideo(
        source: ImageSource.gallery,
      );
      return video;
    } catch (e) {
      return null;
    }
  }
}

