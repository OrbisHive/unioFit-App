// ignore_for_file: use_build_context_synchronously
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:video_trimmer/video_trimmer.dart';

import '../../../../core/constants/heights_widths.dart';
import '../../../../core/resources/localization/localization_map.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/utils/app_button.dart';
import '../../../../core/utils/custom_app_bar.dart';

/// View for trimming a given video file.
class VideoTrimmerScreen extends StatefulWidget {
  static const String route = "/video-trimmer";

  const VideoTrimmerScreen({super.key});

  @override
  State<VideoTrimmerScreen> createState() => _VideoTrimmerScreenState();
}

class _VideoTrimmerScreenState extends State<VideoTrimmerScreen> {
  final Trimmer _trimmer = Trimmer();

  double _startValue = 0.0;
  double _endValue = 0.0;
  bool _isPlaying = false;
  bool _isSaving = false;
  File? _mediaFile;
  ValueChanged<File>? _onTap;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _extractArguments();
      _loadVideo();
    });
  }

  void _extractArguments() {
    final args = Get.arguments as Map<String, dynamic>?;
    if (args != null) {
      _mediaFile = args["mediaFile"] as File?;
      _onTap = args["onTap"] as ValueChanged<File>?;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? R.appColors.darkBackground : R.appColors.white,
      appBar: CustomAppBar(
        title: 'trim_video'.L(),
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 30),
        child: Column(
          children: [
            if (_isSaving)
              LinearProgressIndicator(
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(R.appColors.primary),
              ),
            _buildVideoPlayer(),
            h2,
            _buildTrimViewer(),
            h5,
            if (_trimmer.videoPlayerController?.value.isInitialized ?? false)
              _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  /// Builds the video playback view with overlay controls.
  Widget _buildVideoPlayer() {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          VideoViewer(trimmer: _trimmer),
          _buildPlayPauseButton(),
        ],
      ),
    );
  }

  /// Builds the play/pause toggle button overlay.
  Widget _buildPlayPauseButton() {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: R.appColors.black.withOpacity(0.3),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(
          _isPlaying ? Icons.pause : Icons.play_arrow,
          size: 50.0,
          color: R.appColors.white,
        ),
        onPressed: _togglePlayback,
      ),
    );
  }

  /// Builds the trimming timeline viewer.
  Widget _buildTrimViewer() {
    return Center(
      child: TrimViewer(
        trimmer: _trimmer,
        viewerHeight: 50.0,
        viewerWidth: 90.w,
        durationTextStyle: TextStyle(
          color: Theme.of(context).brightness == Brightness.dark
              ? R.appColors.darkTextPrimary
              : R.appColors.black,
        ),
        editorProperties: TrimEditorProperties(
          circlePaintColor: R.appColors.primary,
          scrubberPaintColor: R.appColors.white,
          borderPaintColor: R.appColors.primary,
          scrubberWidth: 1.25,
        ),
        maxVideoLength: const Duration(seconds: 30),
        onChangeStart: (value) => _startValue = value,
        onChangeEnd: (value) => _endValue = value,
        onChangePlaybackState: (isPlaying) => setState(() => _isPlaying = isPlaying),
      ),
    );
  }

  /// Builds the save button for the trimmed video.
  Widget _buildSaveButton() {
    return IgnorePointer(
      ignoring: _isSaving, // blocks all gestures when true
      child: AppButton(
        onPressed: _saveVideo,
        title: 'save',
        textColor: R.appColors.white,
        backgroundColor: R.appColors.primary,
        height: 40,
        width: 80.w,
        radius: 12,
      ),
    );
  }

  /// Loads the video into the trimmer.
  void _loadVideo() {
    if (_mediaFile != null) {
      _trimmer.loadVideo(videoFile: _mediaFile!);
    }
  }

  /// Toggles video playback between start and end values.
  Future<void> _togglePlayback() async {
    final isPlayingNow = await _trimmer.videoPlaybackControl(
      startValue: _startValue,
      endValue: _endValue,
    );
    setState(() => _isPlaying = isPlayingNow);
  }

  /// Saves the trimmed video and triggers the onSave callback.
  Future<void> _saveVideo() async {
    setState(() => _isSaving = true);

    await _trimmer.saveTrimmedVideo(
      startValue: _startValue,
      endValue: _endValue,
      onSave: (outputPath) async {
        if (outputPath != null) {
          // Sanitize filename (replace : and , with -)
          final safePath = outputPath.replaceAll(RegExp(r'[:|,]'), '-');
          final outputFile = File(outputPath);

          File safeFile = outputFile;
          if (outputPath != safePath) {
            safeFile = await outputFile.rename(safePath);
          }

          // Call the callback if provided (this processes the trimmed file)
          if (_onTap != null && mounted) {
            _onTap!(safeFile);
          }

          // Navigate back after processing
          if (mounted) {
            Get.back(result: safeFile);
          }
        }

        if (mounted) {
          setState(() => _isSaving = false);
        }
      },
    );
  }

  @override
  void dispose() {
    _trimmer.dispose();
    super.dispose();
  }
}
