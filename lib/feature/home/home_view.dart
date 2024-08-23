import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskaty_app/core/functions/navigation.dart';
import 'package:taskaty_app/core/utils/colors.dart';
import 'package:taskaty_app/core/utils/text_style.dart';
import 'package:taskaty_app/core/widgets/custome_button.dart';
import 'package:taskaty_app/feature/add_task/view/add_task.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var box = Hive.box('userBox');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'hello, ${box.get('name')}',
                        style: getTitleTextStyle(color: AppColors.primaryColor),
                      ),
                      Text(
                        'Have a nice day',
                        style: getBodyTextStyle(),
                      ),
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: (box.get('image') != null)
                        ? FileImage(File(box.get('image') ?? ''))
                        : AssetImage('assets/person.png'),
                  ),
                ],
              ),
              Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    text: '+ add Task',
                    onPressed: () {
                      pushReplacement(context, AddTask());
                    },
                    width: 140,
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
