import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quest_demo/screens/auth/views/registration.dart';

import '../../mainScreen.dart';
import '../controller/authController.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (_) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter an email.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a password.';
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                    SizedBox(height: 16.0),
                    GetBuilder<AuthController>(
                      builder: (_) => _.isLoading
                          ? CircularProgressIndicator()
                          : OutlinedButton(
                              child: Text('Login'),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  _.setIsLoading(true);
                                  try {
                                    await _.loginUser(
                                      _emailController.text,
                                      _passwordController.text,
                                    );
                                    Get.offAll(MainScreen());
                                  } catch (e) {
                                    print(e);
                                  } finally {
                                    _.setIsLoading(false);
                                  }
                                }
                              },
                            ),
                    ),
                    OutlinedButton(
                      child: Text('Don\'t have an account? Register'),
                      onPressed: () {
                        Get.to(RegistrationScreen());
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
