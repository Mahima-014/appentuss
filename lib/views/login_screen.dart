import 'package:appentus_task/utilities/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                     child: Image.asset('assets/images/login.jpg'),
                     height: 350,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          //text field for email address.
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 20, left: 20, top: 30),
                            child: TextFormField(
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                                decoration: Constants.buildInputDecoration(
                                    Icons.email, 'Enter You email adress')),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          //text field for password.
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
                            height: 20,
                          ),
                          //button for login.
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
                                print("Login In");
                                // if (_formKey.currentState.validate()) {
                                //   // If the form is valid, display a Snackbar.
                                //   ScaffoldMessenger.of(context)
                                //       .showSnackBar(SnackBar(content: Text('Processing Data')));
                                // }
                                Navigator.pushReplacementNamed(context, Constants.homeScreenRoute);

                              },
                              child: Text(
                                'Login',
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
                          Text(
                            '-OR-'
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //for register.
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: InkWell(
                              onTap: (){
                                Navigator.pushReplacementNamed(context, Constants.signupScreenRoute);
                              },
                              child: Text(
                                'Click here to RESIGTER',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
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
