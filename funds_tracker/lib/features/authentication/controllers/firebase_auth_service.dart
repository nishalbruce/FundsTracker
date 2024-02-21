import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:funds_tracker/features/authentication/screens/login/login.dart';
import 'package:get/get.dart';
import '../../../common/components/navbar.dart';
import '../../../common/components/navbar_approver.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
        await firebaseFirestore.collection("users")
            .doc(userCredential.user!.uid)
            .get()
            .then((DocumentSnapshot documentSnapshot) {
              var json = documentSnapshot.data() as Map<String, dynamic>;
              if(json["role"] == "requester"){
                Get.offAll(const NavBar());
              } else {
                Get.offAll(const NavBarApprover());
              }
            }
        );
        } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return null;
  }

  Future<void> logOut() async {
    await _auth.signOut().then((value) {
      return Get.offAll(const LoginScreen());
    });

  }

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    //var kk = FirebaseFirestore.instance
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('role') == "requester") {
          Get.offAll(const NavBar());
        }else{
          Get.offAll(const NavBarApprover());
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  //Future<void> readData(UserCredential credential) async{
  //  firebaseFirestore.collection("users")
  //      .doc(credential.user!.uid)
  //      .get()
  //      .then((value) async {
  //        var json = value.data();
//
  //        if (json != null) {
  //          SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //          await sharedPreferences.setString(AppConstants.userID, credential.user!.uid);
  //          await sharedPreferences.setString(AppConstants.email, credential.user!.email!);
  //          await sharedPreferences.setString(AppConstants.pswd, credential.user.);
  //          await sharedPreferences.setString(AppConstants.role, json[AppConstants.role]);
  //          await sharedPreferences.setString(AppConstants.username, json[AppConstants.username]);
  //        } else {
  //          print("Hello");
  //        }
//
  //        //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //        //await sharedPreferences.setString(AppConstants.userID, json[AppConstants.userID]);
  //        //await sharedPreferences.setString(AppConstants.email, json[AppConstants.email]);
  //        //await sharedPreferences.setString(AppConstants.pswd, json[AppConstants.pswd]);
  //        //await sharedPreferences.setString(AppConstants.role, json[AppConstants.role]);
  //        //await sharedPreferences.setString(AppConstants.username, json[AppConstants.username]);
  //  });
  //}
//
  //bool clearPreferences(){
  //  AppConstants.sharedPreferences!.remove(AppConstants.userID);
  //  AppConstants.sharedPreferences!.remove(AppConstants.email);
  //  AppConstants.sharedPreferences!.remove(AppConstants.pswd);
  //  AppConstants.sharedPreferences!.remove(AppConstants.role);
  //  AppConstants.sharedPreferences!.remove(AppConstants.username);
  //  return true;
  //}
}
