import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:taskaty_app/core/functions/navigation.dart';
import 'package:taskaty_app/core/utils/colors.dart';
import 'package:taskaty_app/core/utils/text_style.dart';
import 'package:taskaty_app/feature/home/home_view.dart';
import 'package:taskaty_app/feature/upload/upload_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  var box = Hive.box('userBox');
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      pushReplacement(
          context, (box.get('isUpload') ?? false) ? HomeView() : UploadView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/logo.json'),
            Text(
              'Taskati',
              style: getTitleTextStyle(
                  fontSize: 20, color: AppColors.primaryColor),
            ),
            Text(
              'It\'s time to be Organized!',
              style: getSmallTextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
