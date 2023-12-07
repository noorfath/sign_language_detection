import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sign_language_detection/utils/colors.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ImagePicker _imagePicker;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblueColor,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: kyellowcolor,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  title: Text(
                    'Sign Language Detection',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.black),
                  ),
                  subtitle: Text(
                    "Hi there!!",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          Container(
            color: kyellowcolor,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: kblueColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
              ),

              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  itemDashboard(
                    "Open camera to detect sign",
                    CupertinoIcons.camera,
                    kblueColor,
                    250.0,
                        () {
                      _openCamera();
                    },
                  ),
                  itemDashboard(
                    "Upload an image to convert",
                    CupertinoIcons.upload_circle,
                    kblueColor,
                    250.0,
                        () {
                      _openGallery();
                    },
                  ),
                  // Add more items as needed
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openCamera() async {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.camera);
    // Handle the captured image as needed
    if (image != null) {
      // Perform operations with the image
      print("Image path: ${image.path}");
    }
  }

  void _openGallery() async {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
    // Handle the selected image as needed
    if (image != null) {
      // Perform operations with the image
      print("Image path: ${image.path}");
    }
  }

  Widget itemDashboard(String title, IconData iconData, Color background, double itemHeight, VoidCallback onTap) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          height: itemHeight,
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 5),
                color: Theme.of(context).primaryColor.withOpacity(.4),
                spreadRadius: 2,
                blurRadius: 5,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: background, shape: BoxShape.circle),
                child: Icon(
                  iconData,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          ),
        ),
      );
}
