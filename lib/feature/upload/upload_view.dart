import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskaty_app/core/functions/navigation.dart';
import 'package:taskaty_app/core/utils/colors.dart';
import 'package:taskaty_app/core/utils/text_style.dart';
import 'package:taskaty_app/core/widgets/custome_button.dart';
import 'package:taskaty_app/feature/home/home_view.dart';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  var box = Hive.box('userBox');
  String? path;
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (path != null && name.isNotEmpty) {
                  box.put('name', name);
                  box.put('image', path);
                  box.put('isUpload', true);
                  pushReplacement(context, HomeView());
                } else if (path == null && name.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: AppColors.redColor,
                      content: Text('Please upload your image')));
                } else if (path != null && name.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: AppColors.redColor,
                      content: Text('Please enter your name')));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: AppColors.redColor,
                      content: Text(
                          'Please upload your image and enter your name')));
                }
              },
              child: Text(
                'Done',
                style: getBodyTextStyle(color: AppColors.primaryColor),
              ))
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundColor: AppColors.primaryColor,
                  backgroundImage: (path != null)
                      ? FileImage(File(path ?? ''))
                      : AssetImage('assets/person.png'),
                ),
                Gap(20),
                CustomButton(
                  onPressed: () {
                    pickImage(true);
                  },
                  text: 'Upload From Camera',
                ),
                Gap(10),
                CustomButton(
                  text: 'Upload From Gallary',
                  onPressed: () {
                    pickImage(false);
                  },
                ),
                Gap(20),
                Divider(),
                Gap(10),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.redColor,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.redColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  pickImage(bool isCamera) {
    ImagePicker()
        .pickImage(
            source: (isCamera) ? ImageSource.camera : ImageSource.gallery)
        .then((value) {
      if (value != null) {
        setState(() {
          path = value.path;
        });
      }
    });
  }
}
