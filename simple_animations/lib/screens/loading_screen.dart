import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../theme/app_theme.dart';
import '../widgets/custom_button.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

String getPercentageScore(int score) {
  double percentage = ((score / 10) * 100);
  return "${percentage.round()} %";
}

class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late int score = 2;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: score / 10).animate(_animationController);
    _animationController.forward();
    super.initState();
  }

  late Timer timer;
  void startLoading() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          score++;
          if (score > 10) {
            score = 1;
          }
          _animation = Tween<double>(begin: 0, end: score / 10).animate(_animationController);
          _animationController.forward();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double rectangleHeight = MediaQuery.of(context).size.height * 0.60;
    double rectangleWidth = MediaQuery.of(context).size.width - 24;
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.0922 / 2),
                padding: EdgeInsets.symmetric(
                    vertical: rectangleWidth * 0.06,
                    horizontal: rectangleWidth * 0.06,
                  ),
                height: rectangleHeight,
                width: rectangleWidth,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff000000).withOpacity(0.15),
                      spreadRadius: -10,
                      blurRadius: 50,
                      offset: const Offset(0, 7),
                    )
                  ],
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        AnimatedBuilder(
                            animation: _animationController,
                            builder: (context, child) {
                              return CircularProgressIndicator(
                                color: AppTheme.primaryColor,
                                backgroundColor: const Color(0xffABD1C6),
                                value: _animation.value,
                                strokeWidth: 6,
                                strokeCap: StrokeCap.round,
                              );
                            }
                        ),
                        Center(
                          child: Text(
                            getPercentageScore(score),
                            style: AppTheme.textStyle(
                              color: AppTheme.primaryColor,
                              fontWeight_: FontWeight.w900,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          width: 100,
                          onTap: startLoading,
                          label: "Start",
                          texColor: AppTheme.primaryColor,
                          color: Colors.white,
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: CustomButton(
                          width: 100,
                          onTap: () {},
                          label: "Reset",
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              ),
            ),
          ),
    );
  }


}