import 'package:digitours/widgets/custom_rounded_flatbtn.dart';
import 'package:digitours/widgets/customtxt_input.dart';
import 'package:flutter/material.dart';

class PhoneSignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _phoneInputController = TextEditingController();
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              SizedBox(
                height: 16,
              ),
              Image.asset(
                'assets/images/digitourslogo.png',
                height: 60,
              ),
              SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/beach_suitcase_icon.png',
                  height: 400,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Use your phone number to get started',
                  style: Theme.of(context).textTheme.headline1.copyWith(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'You may recieve an SMS for verification. \nMessage and data rates apply',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontSize: 15, color: Colors.black54),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Customtxtinput(
                controller: _phoneInputController,
                fillColor: Colors.grey.withOpacity(.1),
              ),
              SizedBox(
                height: 4,
              ),
              CustomRoundedFlatBtn(onTap: () {}, labelText: 'Confirm Number')
            ],
          ),
        ),
      ),
    );
  }
}
