// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'dart:io';

import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constants/heights_widths.dart';
import '../resources/localization/localization_map.dart';
import '../resources/resources.dart';
import 'custom_app_bar.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String? videoUrl;
  final bool isShowControls;
  static const String route = "/videoPlayerView";

  const CustomVideoPlayer({
    super.key,
    required this.videoUrl,
    this.isShowControls = true,
  });

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  VideoPlayerController? _controller;
  bool _isPlaying = false;
  bool _isInitialized = false;
  bool _isLandscape = false;
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    String? videoUrl = widget.videoUrl;
    if (videoUrl != null) {
      _initializeVideoPlayer(videoUrl);
    }
    // Lock orientation to portrait initially
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  Future<void> _initializeVideoPlayer(String videoUrl) async {
    log("Initializing video player with URL: $videoUrl");

    try {
      if (videoUrl.startsWith("http")) {
        _controller = VideoPlayerController.networkUrl(
          Uri.parse(videoUrl),
        );
      } else {
        _controller = VideoPlayerController.file(File(videoUrl));
      }

      await _controller?.initialize();
      _totalDuration = _controller?.value.duration ?? Duration.zero;
      _controller?.addListener(_videoListener);
      
      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
      }
    } catch (e) {
      debugPrint("Error initializing video player: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("failed_to_load_video".L()),
            backgroundColor: R.appColors.error,
          ),
        );
      }
    }
  }

  void _videoListener() {
    if ((_controller?.value.isInitialized ?? false) && mounted) {
      setState(() {
        _currentPosition = _controller?.value.position ?? Duration.zero;
        _isPlaying = _controller?.value.isPlaying ?? false;
      });
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  void _toggleOrientation() {
    setState(() {
      _isLandscape = !_isLandscape;
      if (_isLandscape) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      }
    });
  }

  @override
  void dispose() {
    _controller?.removeListener(_videoListener);
    _controller?.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log("message:${widget.videoUrl}");
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: R.appColors.black,
      appBar: widget.isShowControls == false
          ? null
          : CustomAppBar(
              title: '',
              showBackButton: true,
              backgroundColor: R.appColors.black,
              foregroundColor: R.appColors.white,
              actions: [
                IconButton(
                  icon: Icon(
                    _isLandscape ? Icons.fullscreen_exit : Icons.fullscreen,
                    color: R.appColors.white,
                  ),
                  onPressed: _toggleOrientation,
                ),
              ],
            ),
      bottomNavigationBar:
          widget.isShowControls == false ? null : _buildVideoControls(),
      body: Center(
        child: _isInitialized
            ? AspectRatio(
                aspectRatio: _controller?.value.aspectRatio ?? 1,
                child: Stack(
                  children: [
                    VideoPlayer(_controller!),
                    if (widget.isShowControls == false)
                      Center(
                        child: IconButton(
                          icon: Icon(
                            _isPlaying ? Icons.pause_circle : Icons.play_circle,
                            color: R.appColors.white,
                            size: 50,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPlaying = !_isPlaying;
                              _isPlaying
                                  ? _controller?.play()
                                  : _controller?.pause();
                            });
                          },
                        ),
                      ),
                  ],
                ),
              )
            : CircularProgressIndicator(
                color: R.appColors.primary,
              ),
      ),
    );
  }

  Widget _buildVideoControls() {
    return Container(
      color: R.appColors.black.withOpacity(0.54),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Timeline slider
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 2.0,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6.0),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 12.0),
              activeTrackColor: R.appColors.primary,
              inactiveTrackColor: R.appColors.white.withOpacity(0.3),
              thumbColor: R.appColors.primary,
              overlayColor: R.appColors.primary.withOpacity(0.2),
            ),
            child: Slider(
              value: _currentPosition.inSeconds.toDouble().clamp(
                    0.0,
                    _totalDuration.inSeconds.toDouble(),
                  ),
              min: 0.0,
              max: _totalDuration.inSeconds.toDouble(),
              onChanged: (value) {
                _controller?.seekTo(Duration(seconds: value.toInt()));
              },
            ),
          ),
          // Bottom controls
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                // Play/Pause button
                IconButton(
                  icon: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    color: R.appColors.white,
                    size: 32.0,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPlaying = !_isPlaying;
                      _isPlaying ? _controller?.play() : _controller?.pause();
                    });
                  },
                ),
                const SizedBox(width: 8.0),
                // Current position
                Text(
                  _formatDuration(_currentPosition),
                  style: TextStyle(color: R.appColors.white),
                ),
                const Text(
                  " / ",
                  style: TextStyle(color: Colors.white),
                ),
                // Total duration
                Text(
                  _formatDuration(_totalDuration),
                  style: TextStyle(color: R.appColors.white),
                ),
                const Spacer(),
                // Orientation toggle button
                IconButton(
                  icon: Icon(
                    _isLandscape ? Icons.fullscreen_exit : Icons.fullscreen,
                    color: R.appColors.white,
                  ),
                  onPressed: _toggleOrientation,
                ),
              ],
            ),
          ),
          if (!_isLandscape) h5,
        ],
      ),
    );
  }
}

