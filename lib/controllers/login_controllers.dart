import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:noor_e_quran/constants/colors.dart';
import 'package:noor_e_quran/home%20screen/home_screen.dart';
import 'package:noor_e_quran/home%20screen/main_screen.dart';
import 'package:noor_e_quran/login/login_screen.dart';
import 'package:noor_e_quran/utils/utils.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var email = "";
  var password = "";
  var isLoading = false.obs;

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
  }

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? validEmail(String value) {
    if (!GetUtils.isEmail(value.trim())) {
      return "Please Provide a valid Email!";
    } else {
      return null;
    }
  }

  String? validPassword(String value) {
    if (value.length < 6) {
      return "Password should be minimum of 6 Characters!";
    } else {
      return null;
    }
  }

  void login() async {
    setLoading(true);

    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    isLoading.value = true;
    formKey.currentState!.save();

    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        SessionController().userId = value.user!.uid.toString();
        Get.offNamed("/main");
        setLoading(false);
        isLoading.value = false;
      }).onError((error, stackTrace) {
        setLoading(false);
        Utils.toastMessage(error.toString(), AppColors.alertColor);
        isLoading.value = false;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        isLoading.value = false;
        return Utils.toastMessage("User Not Found!", AppColors.alertColor);
      } else if (e.code == 'wrong-password') {
        isLoading.value = false;
        return Utils.toastMessage("Wrong Password..!", AppColors.alertColor);
      }
    } catch (e) {
      isLoading.value = false;
      setLoading(false);
      Utils.toastMessage(e.toString(), AppColors.alertColor);
    }
  }

  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) {
      Get.offNamed("/main");
    }).onError((error, stackTrace) {
      Utils.toastMessage(error.toString(), AppColors.alertColor);
    });
  }

  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return MainScreen();
          } else {
            return LoginScreen();
          }
        });
  }

  signOutFromGoogle() async {
    await FirebaseAuth.instance.signOut().then((value) {
      Get.offNamed("/login");
    });
  }

  // signInWithGoogle() async {
  //   GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
  //   GoogleSignInAuthentication? gAuthentication = await gUser?.authentication;

  //   AuthCredential credentials = GoogleAuthProvider.credential(
  //     idToken: gAuthentication?.idToken,
  //     accessToken: gAuthentication?.accessToken,
  //   );

  //   UserCredential userCr =
  //       await FirebaseAuth.instance.signInWithCredential(credentials);

  //   debugPrint(userCr.user?.displayName.toString());

  //   if (userCr.user != null) {
  //     Get.offNamed("/main");
  //   }
  // }

  //
  // Future<void> login() async {
  //   final isValid = formKey.currentState!.validate();
  //   if (!isValid) {
  //     return;
  //   }
  //   isLoading.value = true;
  //   formKey.currentState!.save();
  //
  //   try {
  //     await _auth
  //         .signInWithEmailAndPassword(
  //             email: email.trim(), password: password.trim())
  //         .then((value) async {
  //       if (value != null) {
  //         User? user = FirebaseAuth.instance.currentUser;
  //         if (!user!.emailVerified) {
  //           isLoading == false as RxBool;
  //           return Utils.toastMessage(
  //               "Please Verify Email First!", AppColors.alertColor);
  //         }
  //         Get.offNamed("/main");
  //       } else {
  //         isLoading == false as RxBool;
  //         return Utils.toastMessage("User not Found", AppColors.alertColor);
  //       }
  //     });
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       isLoading == false as RxBool;
  //       return Utils.toastMessage("User Not Found!", AppColors.alertColor);
  //     } else if (e.code == 'wrong-password') {
  //       isLoading = false as RxBool;
  //       return Utils.toastMessage("Wrong Password..!", AppColors.alertColor);
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }
}

class SessionController {
  static final SessionController _session = SessionController._internal();

  String? userId;
  factory SessionController() {
    return _session;
  }
  SessionController._internal() {}
}
