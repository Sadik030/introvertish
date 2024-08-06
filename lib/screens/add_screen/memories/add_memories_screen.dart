import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:introvertish/screens/add_screen/memories/editing_screens/edit_image_screen.dart';
import 'package:introvertish/screens/add_screen/memories/editing_screens/edit_video_screen.dart';
import 'package:video_player/video_player.dart';

class AddMemoriesScreen extends StatefulWidget {
  const AddMemoriesScreen({super.key});

  @override
  State<AddMemoriesScreen> createState() => _AddMemoriesScreenState();
}

class _AddMemoriesScreenState extends State<AddMemoriesScreen> {
  File? _media;
  bool isVideo = false;
  VideoPlayerController? _videoController;

  Future<void> pickMedia() async {
    final picker = ImagePicker();
    XFile? media = await picker.pickMedia(requestFullMetadata: true);

    if (media != null) {
      final String mediaPath = media.path;
      isVideo = mediaPath.endsWith('.mp4') ||
          mediaPath.endsWith('.mov') ||
          mediaPath.endsWith('.avi') ||
          mediaPath.endsWith('.mkv');

      setState(() {
        _media = File(mediaPath);
        if (isVideo) {
          _videoController?.dispose();
          _videoController = VideoPlayerController.file(_media!)
            ..initialize().then((_) {
              setState(() {});
            }).catchError((error) {
              print('Error initializing video: $error');
            });
        }
        if (isVideo) {
          _videoController?.play();
          _videoController?.setLooping(true);
        }
      });
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  void mediaClassifier() {
    if (isVideo) {
      if (_videoController != null && _videoController!.value.isPlaying) {
        _videoController!.pause();
      }
      goToEditVideoScreen();
    } else {
      goToEditImageScreen();
    }
  }

  void goToEditVideoScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return EditVideoScreen(
            videoPath: _media!.path,
          );
        },
      ),
    ).then((_) {
      _videoController?.play();
    });
  }

  void goToEditImageScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditImageScreen(
          imagePath: _media!.path,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24.0,
            horizontal: 24.0,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.close),
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
                    onTap: mediaClassifier,
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
              _media == null
                  ? LayoutBuilder(
                      builder: (context, constraints) {
                        return Container(
                          height: 312.0,
                          width: constraints.maxWidth,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent[100],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        );
                      },
                    )
                  : LayoutBuilder(
                      builder: (context, constraints) {
                        return SizedBox(
                          width: constraints.maxWidth,
                          height: 312.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: isVideo
                                ? _videoController?.value.isInitialized ?? false
                                    ? AspectRatio(
                                        aspectRatio:
                                            _videoController!.value.aspectRatio,
                                        child: VideoPlayer(_videoController!),
                                      )
                                    : Center(
                                        child: CircularProgressIndicator(),
                                      )
                                : Image.file(
                                    _media!,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        );
                      },
                    ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent memories',
                    style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: pickMedia,
                    child: Icon(
                      Icons.camera_alt_outlined,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: pickMedia,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF01C28C),
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'Upload From Gallery',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontFamily: 'NunitoSans',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFBDFFED),
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(6.0),
                        ),
                      ),
                    ),
                    child: Text(
                      'Thoughts',
                      style: TextStyle(
                        color: Color(0xFF015F44),
                        fontFamily: 'NunitoSans',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.0),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF01C28C),
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(6.0),
                        ),
                      ),
                    ),
                    child: Text(
                      'Memories',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontFamily: 'NunitoSans',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
