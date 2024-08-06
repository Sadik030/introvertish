import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'dart:io';
import '../../../Custom_widgets/posting_content.dart';
import '../appbar_feedscreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, this.mediaPath, this.caption, this.colorFilter});

  final String? mediaPath;
  final String? caption;
  final ColorFilter? colorFilter;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextStyle _details = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  TextStyle _description = TextStyle(fontSize: 15, fontWeight: FontWeight.w600);

  bool isVideo = false;
  late VideoPlayerController _videoController;

  List<PostWidget> _posts = [];

  @override
  void initState() {
    super.initState();
    if (widget.mediaPath != null) {
      isVideo = widget.mediaPath!.endsWith('.mp4') ||
          widget.mediaPath!.endsWith('.mov') ||
          widget.mediaPath!.endsWith('.avi') ||
          widget.mediaPath!.endsWith('.mkv');

      if (isVideo) {
        _videoController = VideoPlayerController.file(File(widget.mediaPath!))
          ..initialize().then((_) {
            setState(() {
              _videoController.play();
              _videoController.setLooping(true);
            });
          });
      }
    }
    _posts = [
      if (widget.mediaPath != null)
        PostWidget(
          profileImagePath: "assets/ScreenImages/userImage.png",
          postImagePath: widget.mediaPath!,
          colorFilter: widget.colorFilter ??
              ColorFilter.matrix(<double>[
                1,
                0,
                0,
                0,
                0,
                0,
                1,
                0,
                0,
                0,
                0,
                0,
                1,
                0,
                0,
                0,
                0,
                0,
                1,
                0,
              ]),
          profileName: Text(
            "User",
            style: _details,
          ),
          postDescription: Text(widget.caption ?? "", style: _description),
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResponsiveAppBar(),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (ctx, index) {
          return _posts[index];
        },
      ),
    );
  }
}
