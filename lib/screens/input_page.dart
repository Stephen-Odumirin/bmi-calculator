import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR'),),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: Row(
              children: <Widget>[
                Expanded(child: ReusableCard(colour: selectedGender == Gender.male ? activeCardColor : inactiveCardColor,
                    cardChild: ReusableColumn(icon: Icons.face, text:'MALE'),
                onPress: (){
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },),
                ),
                Expanded(child: ReusableCard(colour: selectedGender == Gender.female? activeCardColor : inactiveCardColor,
                  cardChild: ReusableColumn(icon: Icons.favorite, text: 'FEMALE'),
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },),
                )
              ],
            )),
            Expanded(child: ReusableCard(colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT', style: textStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: numberStyle,),
                      Text('cm', style: textStyle)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context)
                        .copyWith(thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        thumbColor: bottomContainerColor,
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: textColor,
                        overlayColor: Color(0x29eb1555),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120, max: 220,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            )),
            Expanded(child: Row(
              children: <Widget>[
                Expanded(child: ReusableCard(colour: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT', style: textStyle,),
                      Text(weight.toString(), style: numberStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(icon: Icons.add,onPressed:(){
                            setState(() {
                              weight--;
                            });
                          },),
                          SizedBox(width: 15.0),
                          RoundIconButton(icon: Icons.add,onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },)
                        ],
                      )
                    ],
                ),)),
                Expanded(child: ReusableCard(colour: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('AGE', style: textStyle,),
                      Text(age.toString(), style: numberStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(icon: Icons.add,onPressed:(){
                            setState(() {
                              age--;
                            });
                          },),
                          SizedBox(width: 15.0),
                          RoundIconButton(icon: Icons.add,onPressed: (){
                            setState(() {
                              age++;
                            });
                          },)
                        ],
                      )
                    ],
                  ),)),
              ],
            )),
            BottomButton(
              onTap: (){
                CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),

                )));
              },
              buttonTitle: 'CALCULATE ',
            ),
          ],
          ),
      );
  }
}


