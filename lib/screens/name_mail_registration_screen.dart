import 'dart:io';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:digitours/routes.dart';
import 'package:digitours/services/profile_update_service.dart';
import 'package:digitours/utils/image_picker_util.dart';
import 'package:digitours/widgets/circular_material_spinner.dart';
import 'package:digitours/widgets/custom_rounded_flatbtn.dart';
import 'package:digitours/widgets/customtxt_input.dart';

class NameMailRegScreen extends StatefulWidget {
  @override
  _NameMailRegScreenState createState() => _NameMailRegScreenState();
}

class _NameMailRegScreenState extends State<NameMailRegScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  File image;

  void _submitBtnfunc() {
    profileupdateservice
        .updateProfile(_nameController.text, _emailController.text, image)
        .then((response) {
      if (response != null) {
        Navigator.of(context).pushReplacementNamed(RouteConfig.homeBottomNav);
      }
    });
  }

  void takePhotoFn() async {
    image = await getImage().then((value) => File(value.path));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Add Your Personal Info',
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .copyWith(fontSize: 20),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProfilePhotoStack(
                        takePhotoFn: takePhotoFn,
                        image: image,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Customtxtinput(
                        controller: _nameController,
                        labelText: 'Name',
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Customtxtinput(
                        controller: _emailController,
                        labelText: 'E-mail',
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Customtxtinput(
                        controller: _addressController,
                        labelText: 'Address',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomRoundedFlatBtn(
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
                      child: Text('SUBMIT'),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePhotoStack extends StatelessWidget {
  final Function addBtnFunc;
  final Function takePhotoFn;
  final File image;

  const ProfilePhotoStack({
    Key key,
    this.addBtnFunc,
    this.takePhotoFn,
    this.image,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: takePhotoFn,
      child: Stack(
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle, color: Colors.transparent),
            child: Container(
              constraints: BoxConstraints.tight(
                Size(100, 100),
              ),
              child: image != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      child: Image.file(
                        File(image.path),
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ))
                  : SizedBox(),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(.2),
                  border: Border.all(color: Colors.grey, width: 2)),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: RawMaterialButton(
              fillColor: Theme.of(context).primaryColor,
              onPressed: addBtnFunc,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  EvaIcons.plusOutline,
                  size: 35,
                  color: Colors.white,
                ),
              ),
              shape: CircleBorder(),
            ),
          )
        ],
      ),
    );
  }
}
