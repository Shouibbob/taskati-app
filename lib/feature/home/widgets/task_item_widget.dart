import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskaty_app/core/utils/colors.dart';
import 'package:taskaty_app/core/utils/text_style.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 10, right: 5, left: 5),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Flutter Task',
                style: getTitleTextStyle(color: Colors.white),
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
                    '10:00 AM - 10:00 PM',
                    style: getSmallTextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
              Gap(6),
              Text(
                'Flutter Task',
                style: getBodyTextStyle(color: Colors.white),
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
              'TODO',
              style: getTitleTextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
