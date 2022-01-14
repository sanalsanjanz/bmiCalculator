// ignore_for_file: file_names, use_key_in_widget_constructors
import 'package:avodha_moke/functions/animation.dart';
import 'package:avodha_moke/functions/bottomButtton.dart';
import 'package:avodha_moke/functions/const.dart';
import 'package:avodha_moke/functions/reusableCard.dart';
import 'package:avodha_moke/screens/homePage.dart';
import 'package:avodha_moke/screens/moreScreen.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {required this.resultValue, this.status, this.interpretation});
  final double resultValue;
  final String? interpretation;
  final String? status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              height: 450,
              colour: kActiveColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    status!.toUpperCase(),
                    style: kLabelTextStyle,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    resultValue.toStringAsFixed(1),
                    style: kNumberStyle,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    interpretation!,
                    style: kLabelTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Do you know what cause your result ?  ",
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              PageAnimation(
                                widget: MorePage(
                                  value: resultValue,
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            'click here',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            BottomButton(
              text: "RECALCULATE",
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    PageAnimation(widget: const HomePage()), (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
