import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskaty_app/core/functions/navigation.dart';
import 'package:taskaty_app/core/utils/colors.dart';
import 'package:taskaty_app/core/utils/text_style.dart';
import 'package:taskaty_app/core/widgets/custome_button.dart';
import 'package:taskaty_app/feature/add_task/widgets/text_form_field.dart';
import 'package:taskaty_app/feature/home/home_view.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  //bool isChecked = true;
  List<int> num = [1, 2, 3];
  int? index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            pushReplacement(context, HomeView());
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.primaryColor,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Add Task',
          style: getTitleTextStyle(
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                style: getTitleTextStyle(
                    fontSize: 25, fontWeight: FontWeight.w600),
              ),
              Gap(10),
              textFormField(border: 10, color: AppColors.blackColor),
              Gap(10),
              Text(
                'Note',
                style: getTitleTextStyle(
                    fontSize: 25, fontWeight: FontWeight.w600),
              ),
              Gap(10),
              textFormField(border: 10, color: AppColors.blackColor),
              Gap(10),
              Text(
                'Date',
                style: getTitleTextStyle(
                    fontSize: 25, fontWeight: FontWeight.w600),
              ),
              Gap(10),
              textFormField(border: 10, color: AppColors.blackColor),
              Gap(10),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Start Time',
                          style: getTitleTextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                        Gap(5),
                        textFormField(border: 10, color: AppColors.blackColor),
                      ],
                    ),
                  ),
                  Gap(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'End Time',
                          style: getTitleTextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                        Gap(5),
                        textFormField(border: 10, color: AppColors.blackColor),
                      ],
                    ),
                  ),
                ],
              ),
              Gap(23),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Color',
                        style: getTitleTextStyle(
                            color: AppColors.blackColor, fontSize: 25),
                      ),
                      Row(
                        // check box idea
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                index = 1;
                              });
                            },
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: AppColors.primaryColor,
                              ),
                              child: (index == num[0])
                                  ? Icon(
                                      Icons.check,
                                      color: AppColors.whiteColor,
                                    )
                                  : Icon(
                                      Icons.check,
                                      color: AppColors.primaryColor,
                                    ),
                            ),
                          ),
                          Gap(10),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                index = 2;
                              });
                            },
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: AppColors.redColor,
                              ),
                              child: (index == num[1])
                                  ? Icon(
                                      Icons.check,
                                      color: AppColors.whiteColor,
                                    )
                                  : Icon(
                                      Icons.check,
                                      color: AppColors.redColor,
                                    ),
                            ),
                          ),
                          Gap(10),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                index = 3;
                              });
                            },
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: AppColors.orangeColor,
                              ),
                              child: (index == num[2])
                                  ? Icon(
                                      Icons.check,
                                      color: AppColors.whiteColor,
                                    )
                                  : Icon(
                                      Icons.check,
                                      color: AppColors.orangeColor,
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  CustomButton(
                    text: 'Create Task',
                    onPressed: () {
                      pushReplacement(context, AddTask());
                    },
                    width: 150,
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
