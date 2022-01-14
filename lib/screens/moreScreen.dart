// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:avodha_moke/functions/animation.dart';
import 'package:avodha_moke/widgets/bottomButtton.dart';
import 'package:avodha_moke/functions/const.dart';
import 'package:avodha_moke/widgets/reusableCard.dart';
import 'package:avodha_moke/screens/homePage.dart';
import 'package:flutter/material.dart';

class MorePage extends StatelessWidget {
  const MorePage({required this.value});
  final double value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("BACK")),
        title: const Text("BMI CALCUATOR"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
              child: Center(
                child: Text(
                  "YOUR RESULT IS",
                  style: kLabelTextStyle,
                ),
              ),
            ),
            ReusableCard(
              height: 500,
              colour: kActiveColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    value.toStringAsFixed(1),
                    style: kNumberStyle,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      value <= 18.5
                          ? underWeight
                          : value > 18.5 && value <= 24.9
                              ? normalWeight
                              : value > 25 && value <= 29.9
                                  ? overWeight
                                  : obses,
                      style: kLabelTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(PageAnimation(
                    widget: const HomePage(),
                  ));
                },
                text: 'Back to Home')
          ],
        ),
      ),
    );
  }
}
