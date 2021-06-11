import 'package:appentus_task/utilities/constants.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
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
                    Padding(
                      padding:
                      const EdgeInsets.only(right: 20, left: 20, top: 30),
                      child: TextFormField(
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
                        onPressed:(){
                          print("Signup In");
                          if (_formKey.currentState.validate()) {
                            // If the form is valid, display a Snackbar.
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text('Processing Data')));
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
}
