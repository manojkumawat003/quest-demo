import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfileController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  @override
  void onInit() {
    if (_auth.currentUser != null) {
      user = _auth.currentUser;
      print(["user", user!.email!]);
      update();
    }
    super.onInit();
  }

  void signOut() {
    _auth.signOut();
  }
}
