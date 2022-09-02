import 'package:flutter/material.dart';
import '../Components/bottomContainer.dart';
import '../Components/constants.dart';
import '../Components/reuseable_card.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({required this.bmiRemarks, required this.bmiResult,required this.heading});
  final String bmiResult;
  final String bmiRemarks;
  final String heading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveReusableContainerColor,
              containChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    heading.toUpperCase(),
                    style: kResultpageHeader,
                  ),
                  Text(
                    bmiResult,
                    style:kResultPageBMIResult,
                  ),
                  Text(bmiRemarks,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 22.0,),),
                ],
              ),
            ),
          ),
          BottomContain(textCal: 'Re-Calculate', onTap: ()=>Navigator.pop(context)),
        ],
      ),
    );
  }
}
