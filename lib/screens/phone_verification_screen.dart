import 'package:digitours/routes.dart';
import 'package:digitours/services/auth_service.dart';
import 'package:digitours/widgets/circular_material_spinner.dart';
import 'package:digitours/widgets/custom_rounded_flatbtn.dart';
import 'package:digitours/widgets/customtxt_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneVerificationScreen extends StatefulWidget {
  @override
  _PhoneVerificationScreenState createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  final TextEditingController _verifictaionCode = TextEditingController();

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
                        'Verify your phone number',
                        style: Theme.of(context).textTheme.headline1.copyWith(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Enter the 4-digit code sent to \n ${authservice.sentPhoneNumber}',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(fontSize: 15, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Customtxtinput(
                        controller: _verifictaionCode,
                        fillColor: Colors.grey.withOpacity(.1),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Selector<AuthService, bool>(
                        selector: (context, authservice) =>
                            authservice.verifyingPhoneNumber,
                        builder: (context, verified, _) {
                          return CustomRoundedFlatBtn(
                              color: Colors.blueAccent,
                              onTap: !verified
                                  ? () {
                                      authservice
                                          .verifyPhoneNumber(
                                              authservice.sentPhoneNumber,
                                              _verifictaionCode.text)
                                          .then((value) => Navigator.of(context)
                                              .pushReplacementNamed(
                                                  RouteConfig.homescreen));
                                    }
                                  : null,
                              btnWidget: CircularMaterialSpinner(
                                loading: verified,
                                child: Text('Verify'),
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
