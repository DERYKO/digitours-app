import 'package:digitours/routes.dart';
import 'package:digitours/services/auth_service.dart';
import 'package:digitours/utils/toast_util.dart';
import 'package:digitours/widgets/circular_material_spinner.dart';
import 'package:digitours/widgets/custom_rounded_flatbtn.dart';
import 'package:digitours/widgets/customtxt_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneSignUpScreen extends StatefulWidget {
  @override
  _PhoneSignUpScreenState createState() => _PhoneSignUpScreenState();
}

class _PhoneSignUpScreenState extends State<PhoneSignUpScreen> {
  TextEditingController _phoneInputController = TextEditingController();

  void _onPhoneConfirmedFn() {
    if (_phoneInputController.text.length < 10) {
      showtoast('kindly enter a valid phone number');
    } else {
      authservice.mobileLogin(_phoneInputController.text).then((value) {
        if (value != null) {
          Navigator.of(context)
              .pushReplacementNamed(RouteConfig.phoneverificationscreen);
        } else {
          showtoast("Could'nt Send OTP");
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/images/digitourslogo.png',
                    height: 60,
                  ),
                  Image.asset(
                    'assets/images/beach_suitcase_icon.png',
                    height: 400,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Use your phone number to get started',
                        style: Theme.of(context).textTheme.headline1.copyWith(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'You may recieve an SMS for verification. \nMessage and data rates apply',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(fontSize: 15, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Customtxtinput(
                        controller: _phoneInputController,
                        fillColor: Colors.grey.withOpacity(.1),
                        textinputtype: TextInputType.phone,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Selector<AuthService, bool>(
                        selector: (context, authservice) =>
                            authservice.postingMobileLogin,
                        builder: (context, postedLogin, _) {
                          return CustomRoundedFlatBtn(
                              color: Colors.blueAccent,
                              onTap: !postedLogin
                                  ? () {
                                      _onPhoneConfirmedFn();
                                    }
                                  : null,
                              btnWidget: CircularMaterialSpinner(
                                loading: postedLogin,
                                child: Text('Confirm Number'),
                              ));
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
