import 'dart:io';

import 'package:appentus_task/controller/controller.dart';
import 'package:appentus_task/models/UserModel.dart';
import 'package:appentus_task/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool circular = false;
  PickedFile imageFile;
  Controller controller = Controller();
  final ImagePicker picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController number = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.asset('assets/images/signup.jpg'),
              height: 350,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    imageProfile(),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(right: 20, left: 20, top: 30),
                      child: TextFormField(
                        controller: name,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: Constants.buildInputDecoration(
                              Icons.phone, 'Enter your Name')),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(right: 20, left: 20),
                      child: TextFormField(
                        controller: email,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: Constants.buildInputDecoration(
                              Icons.phone, 'Enter your Email Address')),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: TextFormField(
                        controller: password,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: Constants.buildInputDecoration(
                              Icons.lock, 'Password')),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(right: 20, left: 20),
                      child: TextFormField(
                        controller: number,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: Constants.buildInputDecoration(
                              Icons.phone, 'Enter your Phone Number')),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.only(top:10,left: 30,right: 30,bottom: 10),
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {

                            if(imageFile==null)
                            {
                              print("Image not selected");
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text('Image not selected. Please select an image')));
                              return;
                            }

                            UserModel user = UserModel(
                                id: null,
                                name: name.text,
                                email: email.text,
                                image: imageFile.path,
                                number: number.text,
                                password: password.text);

                            int flag = await controller.saveDataInDB(user);
                            if (flag == 0) {
                              print('User Already Exists');
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text('This email is already registered')));
                            } else {
                              print("User Successfully Registered");
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text('Registration Completed Successfully')));
                              Navigator.pushNamed(context, Constants.loginScreenRoute);
                            }
                          }
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: imageFile == null
              ? AssetImage("assets/images/avatar.png")
              : FileImage(File(imageFile.path)),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.teal,
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            SizedBox(
              width: 40,
            ),
            TextButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await picker.getImage(
      source: source,
    );
    setState(() {
      if (pickedFile != null) imageFile = pickedFile;
      Navigator.pop(context);
    });
  }

}
