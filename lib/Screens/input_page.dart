import 'package:bmi/Screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Bmi_Brain.dart';
import '../Components/bottomContainer.dart';
import '../Components/constants.dart';
import '../Components/icon_content.dart';
import '../Components/reuseable_card.dart';
import '../Components/round_button.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  double height = 0.0;
  int weight = 0;
  int age = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'BMI Calculator',
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: selectedGender == Gender.male
                          ? kActiveReusableContainerColor
                          : kInactiveReusableContainerColor,
                      containChild:
                          const IconContent(FontAwesomeIcons.mars, 'MALE'),
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: selectedGender == Gender.female
                          ? kActiveReusableContainerColor
                          : kInactiveReusableContainerColor,
                      containChild:
                          const IconContent(FontAwesomeIcons.venus, 'FEMALE'),
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kActiveReusableContainerColor,
                containChild: Column(
                  children: [
                    const Text(
                      'Height',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toStringAsFixed(2),
                          style: kNumberDisplayTextStyle,
                        ),
                        const Text(
                          'ft',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: const SliderThemeData(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xff8E8E9C),
                        thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 12.0, elevation: 5),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 24),
                        thumbColor: Color(0xffDF4068),
                        overlayColor: Color(0x29DF4068),
                      ),
                      child: Slider(
                          value: height,
                          min: kMinSliderValue,
                          max: kMaxSliderValue,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue;
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveReusableContainerColor,
                      containChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Weight',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberDisplayTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  }),
                              const SizedBox(
                                width: 10,
                              ),
                              RoundButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  }),
                            ],
                            // here in the row I'm getting error
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveReusableContainerColor,
                      containChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Age',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberDisplayTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  }),
                              const SizedBox(
                                width: 10,
                              ),
                              RoundButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                            ],
                            // here in the row I'm getting error
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomContain(textCal: 'Calculator',onTap: (){
              BmiBrain bmiBrain= BmiBrain(weight:weight, height: height);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage( bmiResult:bmiBrain.bmicalculate(), bmiRemarks:bmiBrain.bmiRemarks(),heading: bmiBrain.getResult(),)));
            },),
          ],
        ),
      ),
    );
  }
}



