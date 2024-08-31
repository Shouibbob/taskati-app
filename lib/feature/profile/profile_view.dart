import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskaty_app/core/services/local_storage.dart';
import 'package:taskaty_app/core/utils/colors.dart';
import 'package:taskaty_app/core/utils/text_style.dart';
import 'package:taskaty_app/core/widgets/custome_button.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String? path;
  String name = '';
  @override
  void initState() {
    super.initState();
    path = AppLocalStorage.getCacheData(AppLocalStorage.kImage);
    name = AppLocalStorage.getCacheData(AppLocalStorage.kName) ?? '';
  }

  @override
  Widget build(BuildContext context) {
    bool mode =
        AppLocalStorage.getCacheData(AppLocalStorage.kIsDarkMode) ?? false;
    return Scaffold(
      appBar: AppBar(
        actions: [
          //make dark and light button
          IconButton(
              onPressed: () {
                AppLocalStorage.cacheData(AppLocalStorage.kIsDarkMode, !mode);
              },
              icon: Icon(
                mode ? Icons.dark_mode : Icons.light_mode,
                color: AppColors.primaryColor,
              ))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundColor: AppColors.primaryColor,
                      backgroundImage: (path != null)
                          ? FileImage(File(path ?? ''))
                          : const AssetImage('assets/person.png'),
                    ),
                    Positioned(
                        bottom: 10,
                        right: 10,
                        child: InkWell(
                          onTap: () {
                            // Important widget
                            showModalBottomSheet(
                                context: context,
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                builder: (context) {
                                  return Container(
                                    padding: const EdgeInsets.all(20),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Gap(20),
                                        CustomButton(
                                          width: double.infinity,
                                          onPressed: () {
                                            pickImage(true);
                                            Navigator.pop(context);
                                          },
                                          text: 'Upload From Camera',
                                        ),
                                        const Gap(15),
                                        CustomButton(
                                          width: double.infinity,
                                          onPressed: () {
                                            pickImage(false);
                                            Navigator.pop(context);
                                          },
                                          text: 'Upload From Gallery',
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            child: const Icon(
                              Icons.camera_alt_rounded,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        )),
                  ],
                ),
                const Gap(40),
                const Divider(
                  color: AppColors.primaryColor,
                ),
                const Gap(10),
                Row(
                  children: [
                    Text(
                      name,
                      style: getTitleTextStyle(
                        context,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const Spacer(),
                    IconButton.outlined(
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          backgroundColor: AppColors.whiteColor,
                          builder: (context) {
                            return Container(
                              padding: const EdgeInsets.all(20),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Gap(20),
                                  TextFormField(
                                    onChanged: (value) {
                                      name = value;
                                    },
                                    decoration: InputDecoration(
                                      hintText: name,
                                    ),
                                  ),
                                  Gap(15),
                                  CustomButton(
                                    width: double.infinity,
                                    onPressed: () {
                                      setState(() {
                                        if (name.isNotEmpty) {
                                          AppLocalStorage.cacheData(
                                              AppLocalStorage.kName, name);
                                        }
                                      });
                                      Navigator.pop(context);
                                    },
                                    text: 'Update Your Name',
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      color: AppColors.primaryColor,
                      icon: const Icon(Icons.edit),
                    ),
                  ],
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
      AppLocalStorage.cacheData(AppLocalStorage.kImage, path);
    });
  }
}
