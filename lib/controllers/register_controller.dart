import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:noor_e_quran/constants/colors.dart';
import 'package:noor_e_quran/utils/utils.dart';

class RegisterController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var name = '';
  var email = '';
  var password = '';
  var isImgAvailable = false.obs;

  final _picker = ImagePicker();

  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  var isLoading = false.obs;

  CollectionReference userDatabaseReference =
      FirebaseFirestore.instance.collection("user");

  FirebaseStorage storage = FirebaseStorage.instance;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  void getImage(ImageSource imageSource) async {}

  String? validName(String value) {
    if (value.length < 3) {
      return "Name must be 3 characters";
    }
    return null;
  }

  String? validEmail(String value) {
    if (!GetUtils.isEmail(value.trim())) {
      return "Please Provide Valid Email";
    }
    return null;
  }

  String? validPassword(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

  Future<void> registeration() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    isLoading.value = true;

    formKey.currentState!.save();

    userRegister(email.trim(), password.toString().trim()).then((credentials) {
      if (credentials != null) {
      } else {
        Utils.toastMessage("User already exists!", AppColors.alertColor);
      }
      isLoading.value = false;
    });
  }

  Future<UserCredential?> userRegister(String email, String password) async {
    UserCredential? userCredential;
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        if (value != null) {
          User? user = FirebaseAuth.instance.currentUser;
          await user!.sendEmailVerification();
          Utils.toastMessage(
              "Check your email to confirm!", AppColors.primaryColor);
          saveDataToDb().then((value) async {
            await FirebaseAuth.instance.currentUser!.sendEmailVerification();
            Get.offAllNamed('/login');
          });
          return;
        }
      });
    } on FirebaseAuthException catch (e) {
      Utils.toastMessage(e.toString(), AppColors.alertColor);
    } catch (e) {
      debugPrint(e.toString());
    }
    return userCredential;
  }

  Future<String?> uploadFile(filePath) async {}

  Future<void> saveDataToDb() async {
    User? user = FirebaseAuth.instance.currentUser;
    await userDatabaseReference.doc(user!.uid).set({
      'uid': user.uid,
      'name': name,
      'email': email,
      'url': '',
    });
    return;
  }
}
