import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskaty_app/core/functions/navigation.dart';
import 'package:taskaty_app/core/services/local_storage.dart';
import 'package:taskaty_app/core/utils/colors.dart';
import 'package:taskaty_app/core/utils/text_style.dart';
import 'package:taskaty_app/feature/profile/profile_view.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'hello, ${AppLocalStorage.getCacheData(AppLocalStorage.kName)}',
              style: getTitleTextStyle(color: AppColors.primaryColor),
            ),
            Text(
              'Have a nice day',
              style: getBodyTextStyle(),
            ),
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            // ignore: prefer_const_constructors
            push(context, ProfileView());
          },
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AppLocalStorage.getCacheData(
                        AppLocalStorage.kImage) !=
                    null
                ? FileImage(
                    File(AppLocalStorage.getCacheData(AppLocalStorage.kImage)))
                : const AssetImage('assets/person.png'),
          ),
        ),
      ],
    );
  }
}
