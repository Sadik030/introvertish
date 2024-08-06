import 'package:flutter/material.dart';
import 'package:introvertish/screens/add_screen/memories/select_close_friends_screen.dart';
import 'package:introvertish/screens/home_screen/HomemainScreen/homecontent_screen.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

class AddCaptionScreen extends StatefulWidget {
  const AddCaptionScreen(
      {super.key, required this.editedMediaPath, this.colorFilter});

  final String editedMediaPath;
  final ColorFilter? colorFilter;

  @override
  State<AddCaptionScreen> createState() => _AddCaptionScreenState();
}

enum AudienceCategory { Friends, CloseFriends }

class _AddCaptionScreenState extends State<AddCaptionScreen> {
  late VideoPlayerController _videoController;
  AudienceCategory? _category = AudienceCategory.Friends;
  bool isVideo = false;
  TextEditingController _captionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    mediaClassifier();
    _videoController = VideoPlayerController.file(File(widget.editedMediaPath))
      ..initialize().then((_) {
        setState(() {
          _videoController.play();
          _videoController.setLooping(true);
        });
      });
  }

  @override
  void dispose() {
    _captionController.dispose();
    if (isVideo) {
      _videoController.dispose();
    }
    super.dispose();
  }

  void mediaClassifier() {
    isVideo = widget.editedMediaPath.endsWith('.mp4') ||
        widget.editedMediaPath.endsWith('.mov') ||
        widget.editedMediaPath.endsWith('.avi') ||
        widget.editedMediaPath.endsWith('.mkv');
  }

  void selectedFriends() {
    Navigator.pop(context);
  }

  void selectedCloseFriends() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectCloseFriendsScreen(),
      ),
    );
  }

  void _showModalBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setModalState) {
            return SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 12.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.arrow_drop_down_rounded,
                      size: 64.0,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Whom would you like to share with?',
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ListTile(
                      title: Text('Friends'),
                      leading: Icon(Icons.perm_identity),
                      trailing: Radio<AudienceCategory>(
                          value: AudienceCategory.Friends,
                          groupValue: _category,
                          onChanged: (AudienceCategory? value) {
                            setModalState(() {
                              setState(() {
                                _category = value;
                              });
                            });
                          }),
                    ),
                    ListTile(
                      title: Text('Close Friends'),
                      leading: Icon(Icons.ac_unit_sharp),
                      trailing: Radio<AudienceCategory>(
                          value: AudienceCategory.CloseFriends,
                          groupValue: _category,
                          onChanged: (AudienceCategory? value) {
                            setModalState(() {
                              setState(() {
                                _category = value;
                              });
                            });
                          }),
                    ),
                    SizedBox(height: 48.0),
                    SizedBox(
                      width: double.infinity,
                      height: 48.0,
                      child: ElevatedButton(
                        onPressed: _category == AudienceCategory.Friends
                            ? selectedFriends
                            : selectedCloseFriends,
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
                          _category == AudienceCategory.Friends
                              ? 'Done'
                              : 'Add People',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontFamily: 'NunitoSans',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        }).then((_) => setState(() {}));
  }

  void goToHomePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(
          mediaPath: widget.editedMediaPath,
          caption: _captionController.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                          child: isVideo
                              ? VideoPlayer(_videoController)
                              : ColorFiltered(
                                  colorFilter: widget.colorFilter!,
                                  child: Image(
                                    image:
                                        FileImage(File(widget.editedMediaPath)),
                                    fit: BoxFit.cover,
                                    width: constraints.maxWidth,
                                    height: 312.0,
                                  ),
                                ),
                        ),
                        Positioned(
                          top: 8.0,
                          left: 8.0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff0c0c0c33),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                            ),
                            width: 62.0,
                            height: 22.0,
                            child: Text(
                              'Preview',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 8.0),
              SingleChildScrollView(
                child: SizedBox(
                  child: TextField(
                    controller: _captionController,
                    decoration: InputDecoration(
                      hintText: 'Write a caption....',
                      border: InputBorder.none,
                    ),
                    maxLines: 4,
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.remove_red_eye_outlined),
                      SizedBox(width: 4.0),
                      Text('Audience'),
                    ],
                  ),
                  GestureDetector(
                    onTap: _showModalBottomSheet,
                    child: Row(
                      children: [
                        Text(_category == AudienceCategory.Friends
                            ? 'Friends'
                            : 'Close Friends'),
                        Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 56.0),
              SizedBox(
                width: double.infinity,
                height: 48.0,
                child: ElevatedButton(
                  onPressed: goToHomePage,
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
                    'Share',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontFamily: 'NunitoSans',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
