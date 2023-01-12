import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../auth/views/login.dart';
import '../controller/profileController.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfileController>(
      init: UserProfileController(),
      builder: (uc) => Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20.0),
              Text(
                uc.user!.email!,
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.black,
                  letterSpacing: 2.5,
                ),
              ),
              SizedBox(height: 20.0),
              OutlinedButton.icon(
                onPressed: () {
                  Get.off(LoginScreen());
                  uc.signOut();
                },
                icon: Icon(Icons.exit_to_app),
                label: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
