import 'package:digitours/routes.dart';
import 'package:digitours/widgets/custom_rounded_flatbtn.dart';
import 'package:flutter/material.dart';

class StepperWidget extends StatefulWidget {
  final List<Widget> screens;

  const StepperWidget({Key key, this.screens}) : super(key: key);

  @override
  _StepperWidgetState createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  int currentIndexScreen = 0;
  bool reachedEnd = false;

  void nextScreenFunc() {
    if (currentIndexScreen + 1 < widget.screens.length) {
      currentIndexScreen++;
      setState(() {
        if (currentIndexScreen + 1 == widget.screens.length) {
          reachedEnd = true;
        }
      });
    }
  }

  void closeOnBoardingFunc() {
    Navigator.of(context).pushReplacementNamed(RouteConfig.logodisplayscreen);
  }

  void previousScreenFunc() {
    if (currentIndexScreen > 0) {
      currentIndexScreen--;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.screens[currentIndexScreen],
          Container(
            width: 200,
            child: CustomRoundedFlatBtn(
              onTap: () {
                reachedEnd ? closeOnBoardingFunc() : nextScreenFunc();
              },
              btnWidget: Text(
                reachedEnd ? 'Get Started' : 'Next',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          StepperIndicator(
            screens: widget.screens,
            currentIndex: currentIndexScreen,
          )
        ],
      ),
    );
  }
}

class StepperIndicator extends StatelessWidget {
  final int currentIndex;

  final List<Widget> screens;

  const StepperIndicator({Key key, this.currentIndex, this.screens})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: screens
            .map((e) => Container(
                  child: AnimatedContainer(
                    height: currentIndex == screens.indexOf(e) ? 12 : 10,
                    width: currentIndex == screens.indexOf(e) ? 12 : 10,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: .5),
                      shape: BoxShape.circle,
                      color: currentIndex == screens.indexOf(e)
                          ? Colors.orange
                          : Colors.grey,
                    ),
                    duration: Duration(milliseconds: 500),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
