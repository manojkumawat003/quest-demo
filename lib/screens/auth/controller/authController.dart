import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;

  void setIsLoading(bool value) {
    isLoading = value;
    update();
  }

  @override
  void onInit() {}

  Future<void> registerUser(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      Get.put(user, tag: "userData");
      print("${user.uid} has been registered");
    } catch (e) {
      print(e);
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = result.user!;
      Get.put(user, tag: "userData");
      print("${user.uid} has been logged in");
    } catch (e) {
      print(e);
    }
  }
}
