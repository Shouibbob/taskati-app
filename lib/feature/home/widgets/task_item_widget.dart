import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskaty_app/core/model/task_model.dart';
import 'package:taskaty_app/core/utils/colors.dart';
import 'package:taskaty_app/core/utils/text_style.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key,
    required this.model,
  });

  final TaskModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 10, right: 5, left: 5),
      decoration: BoxDecoration(
        color: model.color == 0
            ? AppColors.primaryColor
            : model.color == 1
                ? AppColors.orangeColor
                : model.color == 2
                    ? AppColors.redColor
                    : Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: getTitleTextStyle(context, color: Colors.white),
              ),
              Gap(6),
              Row(
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    color: Colors.white,
                    size: 18,
                  ),
                  Gap(10),
                  Text(
                    '${model.startTime} - ${model.endTime}',
                    style: getSmallTextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
              Gap(6),
              Text(
                model.description,
                style: getBodyTextStyle(context, color: Colors.white),
              ),
            ],
          )),
          Container(
            height: 60,
            width: 1,
            color: Colors.white,
          ),
          Gap(5),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              model.isCompleted ? 'COMPLETED' : 'TODO',
              style:
                  getTitleTextStyle(context, color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
