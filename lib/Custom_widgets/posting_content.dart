import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

class PostWidget extends StatefulWidget {
  final String profileImagePath;
  final String postImagePath;
  final Widget profileName;
  final Widget postDescription;
  final ColorFilter? colorFilter;

  const PostWidget({
    Key? key,
    required this.profileImagePath,
    required this.postImagePath,
    required this.profileName,
    required this.postDescription,
    this.colorFilter,
  }) : super(key: key);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double postWidgetHeight = screenHeight * 0.6;

    late VideoPlayerController videoController;
    bool isVideo = false;

    void initializeVideo() {
      isVideo = widget.postImagePath.endsWith('.mp4') ||
          widget.postImagePath.endsWith('.mov') ||
          widget.postImagePath.endsWith('.avi') ||
          widget.postImagePath.endsWith('.mkv');

      if (isVideo) {
        videoController = VideoPlayerController.file(File(widget.postImagePath))
          ..initialize().then((_) {
            setState(() {});
            videoController.play();
            videoController.setLooping(true);
          });
      }
    }

    @override
    void initState() {
      super.initState();
      initializeVideo();
    }

    @override
    void dispose() {
      if (isVideo) {
        videoController.dispose();
      }
      super.dispose();
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey, // Border color
            width: 1, // Border width
          ),
          borderRadius: BorderRadius.circular(10), // Border radius
        ),
        height: postWidgetHeight,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5, bottom: 0),
                  child: CircleAvatar(
                    backgroundColor: Colors.black12,
                    radius: 28,
                    child: ClipOval(
                      child: Image.asset(
                        widget.profileImagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                widget.profileName,
              ],
            ),
            SizedBox(height: 0.01 * postWidgetHeight),
            Expanded(
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: isVideo
                    ? videoController.value.isInitialized
                        ? VideoPlayer(videoController)
                        : Center(child: CircularProgressIndicator())
                    : ColorFiltered(
                        colorFilter: widget.colorFilter!,
                        child: Image.file(
                          File(widget.postImagePath),
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(child: Text('Error loading image'));
                          },
                        ),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              child: widget.postDescription,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Comments...",
                    style: TextStyle(fontWeight: FontWeight.w100),
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.message)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
