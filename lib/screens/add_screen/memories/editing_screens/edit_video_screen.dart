import 'dart:io';

import 'package:flutter/material.dart';
import 'package:introvertish/screens/add_screen/memories/add_captions_screen.dart';
import 'package:video_player/video_player.dart';
import 'package:video_trimmer/video_trimmer.dart';

class EditVideoScreen extends StatefulWidget {
  EditVideoScreen({super.key, required this.videoPath});

  late String videoPath;

  @override
  State<EditVideoScreen> createState() => _EditVideoScreenState();
}

class _EditVideoScreenState extends State<EditVideoScreen> {
  VideoPlayerController? _videoController;
  final Trimmer _trimmer = Trimmer();
  double _startValue = 00.0;
  double _endValue = 0.0;
  bool _isPlaying = false;
  bool _progressVisibility = false;
  Duration? _videoDuration;

  @override
  void initState() {
    super.initState();
    _loadVideo();
  }

  void _loadVideo() {
    _trimmer.loadVideo(videoFile: File(widget.videoPath));
    _videoController = VideoPlayerController.file(File(widget.videoPath))
      ..initialize().then((_) {
        setState(() {
          _videoController!.play();
          _videoController!.setLooping(true);
          _videoDuration = _videoController!.value.duration;
        });
      });
  }

  void _saveTrimmedVideo() async {
    setState(() {
      _progressVisibility = true;
    });

    await _trimmer.saveTrimmedVideo(
        startValue: _startValue,
        endValue: _endValue,
        onSave: (trimmedVideoPath) {
          if (trimmedVideoPath != null) {
            setState(() {
              _progressVisibility = false;
            });
            print('Video saved at: $trimmedVideoPath');

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AddCaptionScreen(editedMediaPath: trimmedVideoPath),
              ),
            );
          }
        });
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'New post',
                        style: TextStyle(
                          fontFamily: 'NunitoSans',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: _saveTrimmedVideo,
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontFamily: 'NunitoSans',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF074ED9),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              LayoutBuilder(
                builder: (context, constraints) {
                  return SizedBox(
                    width: constraints.maxWidth,
                    height: 312.0,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: VideoPlayer(_videoController!),
                        ),
                        if (_videoDuration != null)
                          Positioned(
                            top: 8.0,
                            right: 8.0,
                            child: Text(
                                '${_videoDuration!.inMinutes}:${_videoDuration!.inSeconds}'),
                          ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 16.0),
              TrimViewer(
                trimmer: _trimmer,
                viewerHeight: 50.0,
                onChangeStart: (value) {
                  setState(() {
                    _startValue = value;
                  });
                  print('The start value is: $_startValue');
                },
                onChangeEnd: (value) {
                  setState(() {
                    _endValue = value;
                    print('The end value is: $_endValue');
                  });
                },
                onChangePlaybackState: (value) {
                  setState(() {
                    _isPlaying = value;
                  });
                  if (_isPlaying) {
                    _videoController?.play();
                  } else {
                    _videoController?.pause();
                  }
                },
                editorProperties: TrimEditorProperties(
                  scrubberPaintColor: Colors.black,
                  borderPaintColor: Colors.black,
                  circlePaintColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
