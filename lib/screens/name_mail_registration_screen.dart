import 'package:digitours/services/profile_update_service.dart';
import 'package:digitours/widgets/circular_material_spinner.dart';
import 'package:digitours/widgets/custom_rounded_flatbtn.dart';
import 'package:digitours/widgets/customtxt_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NameMailRegScreen extends StatefulWidget {
  @override
  _NameMailRegScreenState createState() => _NameMailRegScreenState();
}

class _NameMailRegScreenState extends State<NameMailRegScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  void _submitBtnfunc() {
    profileupdateservice.updateProfile(
        _nameController.text, _emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'You are almost there',
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .copyWith(fontSize: 20),
              ),
              Text(
                'Only a few more details to finish setting up your account',
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 8,
              ),
              Customtxtinput(
                controller: _nameController,
                labelText: 'Name',
              ),
              SizedBox(
                height: 4,
              ),
              Customtxtinput(
                controller: _emailController,
                labelText: 'E-mail',
              ),
              SizedBox(
                height: 16,
              ),
              CustomRoundedFlatBtn(
                onTap: () {
                  _submitBtnfunc();
                },
                btnWidget: Selector<ProfileUpdateService, bool>(
                  selector: (context, profileupdateservice) =>
                      profileupdateservice.isUpdatingProfile,
                  builder: (context, updating, _) {
                    return CircularMaterialSpinner(
                      color: Colors.white,
                      loading: updating,
                      width: 20,
                      height: 20,
                      child: Text('Submit'),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
