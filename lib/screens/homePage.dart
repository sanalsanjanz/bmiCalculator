// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables, empty_constructor_bodies, use_key_in_widget_constructors

import 'package:avodha_moke/functions/animation.dart';
import 'package:avodha_moke/functions/bottomButtton.dart';
import 'package:avodha_moke/functions/const.dart';
import 'package:avodha_moke/functions/iconContent.dart';
import 'package:avodha_moke/functions/resultBmi.dart';
import 'package:avodha_moke/functions/reusableCard.dart';
import 'package:avodha_moke/functions/roundedIcon.dart';
import 'package:avodha_moke/screens/resultScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int height = 180;
  int weight = 50;
  int age = 26;
  Gender? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ), */
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    height: 200,
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kInactiveColor
                        : kActiveColor,
                    child:
                        IconContent(title: "MALE", icon: FontAwesomeIcons.mars),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    height: 200,
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kInactiveColor
                        : kActiveColor,
                    child: IconContent(
                        title: "FEMALE", icon: FontAwesomeIcons.venus),
                  ),
                ),
              ],
            ),
            ReusableCard(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Height", style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberStyle),
                      Text("cm", style: kLabelTextStyle)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Colors.deepOrangeAccent,
                      overlayColor: Color(0x29ff358b),
                      activeTrackColor: Colors.orange,
                      thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15, elevation: 2),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30,
                      ),
                    ),
                    child: Slider(
                      label: ' height.toString()',
                      //activeColor: Colors.deepPurpleAccent,
                      //inactiveColor: Color(0xffffffff),
                      min: 100,
                      max: 200,
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
              colour: kActiveColor,
            ),
            Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: kNumberStyle,
                            ),
                            /*   Text(
                              "Kg",
                              style: kLabelTextStyle,
                            ), */
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIcon(
                                icon: FontAwesomeIcons.minus,
                                function: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(
                              width: 15,
                            ),
                            RoundedIcon(
                              icon: FontAwesomeIcons.plus,
                              function: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              age.toString(),
                              style: kNumberStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIcon(
                              icon: FontAwesomeIcons.minus,
                              function: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            RoundedIcon(
                              icon: FontAwesomeIcons.plus,
                              function: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            BottomButton(
              text: 'CALCULATE',
              weight: weight,
              height: height,
              onPressed: () {
                CalculateBmi results =
                    CalculateBmi(height: height, weight: weight, age: age);
                Navigator.of(context).push(
                  PageAnimation(
                    widget: ResultPage(
                      resultValue: results.calculate().toDouble(),
                      status: results.getResult(),
                      interpretation: results.interpretatiion(),
                    ),
                  ),
                  /* MaterialPageRoute(
                    builder: (context) => ResultPage(
                      resultValue: results.calculate().toDouble(),
                      status: results.getResult(),
                      interpretation: results.interpretatiion(),
                    ),
                  ), */
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
