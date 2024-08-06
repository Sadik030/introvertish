import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:introvertish/constants/color_filters.dart';
import 'package:introvertish/screens/add_screen/memories/add_captions_screen.dart';

class EditImageScreen extends StatefulWidget {
  EditImageScreen({super.key, required this.imagePath});

  late String imagePath;

  @override
  State<EditImageScreen> createState() => _EditImageScreenState();
}

class _EditImageScreenState extends State<EditImageScreen> {
  double _contrastValue = 1.0;
  ColorFilter? _currentColorFilter = ColorFilters.identity;
  bool _showContrastSlider = false;

  List<ColorFilter> customColorFilters = [
    ColorFilters.identity,
    ColorFilters.greyscale,
    ColorFilters.cool,
    ColorFilters.sepia,
    ColorFilters.pinkTint,
    ColorFilters.brown,
    ColorFilters.warm,
    ColorFilters.blackAndWhite,
    ColorFilters.invert,
  ];

  Future<String?> cropImage() async {
    final croppedImage = await ImageCropper().cropImage(
      sourcePath: widget.imagePath,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.original
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.grey,
          toolbarWidgetColor: Colors.white,
        ),
        IOSUiSettings(title: 'Crop Image'),
      ],
    );

    if (croppedImage != null) {
      return croppedImage.path;
    }
    return null;
  }

  void _updateContrast(double value) {
    setState(() {
      _contrastValue = value;
      if (_showContrastSlider) {
        _currentColorFilter = ColorFilter.matrix([
          _contrastValue,
          0,
          0,
          0,
          0,
          0,
          _contrastValue,
          0,
          0,
          0,
          0,
          0,
          _contrastValue,
          0,
          0,
          0,
          0,
          0,
          1,
          0,
        ]);
      } else {
        _currentColorFilter = ColorFilters.identity;
      }
    });
  }

  void goToAddCaptionsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddCaptionScreen(
          editedMediaPath: widget.imagePath,
          colorFilter: _currentColorFilter,
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
                    onTap: goToAddCaptionsScreen,
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
                  return Container(
                    height: 312.0,
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent[100],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: ColorFiltered(
                        colorFilter: _currentColorFilter!,
                        child: Image.file(
                          File(widget.imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () async {
                      var croppedImagePath = await cropImage();
                      if (croppedImagePath != null) {
                        setState(() {
                          widget.imagePath = croppedImagePath;
                        });
                      }
                    },
                    icon: Icon(
                      Icons.crop,
                      color: Color(0xFF0C0C0C),
                    ),
                    label: Text(
                      'Crop',
                      style: TextStyle(
                        color: Color(0xFF0C0C0C),
                        fontFamily: 'NunitoSans',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0x00ffffff),
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(6.0),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _showContrastSlider = !_showContrastSlider;
                      });
                    },
                    icon: Icon(
                      Icons.contrast,
                      color: Color(0xFF0C0C0C),
                    ),
                    label: Text(
                      'Contrast',
                      style: TextStyle(
                        color: Color(0xFF0C0C0C),
                        fontFamily: 'NunitoSans',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0x00ffffff),
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(6.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              if (!_showContrastSlider)
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: customColorFilters.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentColorFilter = customColorFilters[index];
                            });
                          },
                          child: ColorFiltered(
                            colorFilter: customColorFilters[index],
                            child: CircleAvatar(
                              backgroundImage: FileImage(
                                File(widget.imagePath),
                              ),
                              radius: 32.0,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              if (_showContrastSlider)
                SliderTheme(
                  data: SliderThemeData(
                    trackHeight: 1.8,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.0),
                  ),
                  child: Slider(
                    value: _contrastValue,
                    min: 0.5,
                    max: 2.0,
                    onChanged: _updateContrast,
                    activeColor: Color(0xFF464646),
                    inactiveColor: Color(0xff0c0c0c4d).withOpacity(0.3),
                  ),
                ),
              SizedBox(height: 16.0),
              if (_showContrastSlider)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _showContrastSlider = !_showContrastSlider;
                          if (!_showContrastSlider) {
                            _currentColorFilter = ColorFilters.identity;
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0x00ffffff),
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100.0),
                          ),
                          side: BorderSide(color: Colors.black),
                        ),
                      ),
                      icon: Icon(
                        Icons.close,
                        color: Color(0xFF0C0C0C),
                      ),
                    ),
                    SizedBox(width: 12.0),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _showContrastSlider = !_showContrastSlider;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0x00ffffff),
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100.0),
                          ),
                          side: BorderSide(color: Colors.black),
                        ),
                      ),
                      icon: Icon(
                        Icons.check,
                        color: Color(0xFF0C0C0C),
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 60.0),
              if (!_showContrastSlider)
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
