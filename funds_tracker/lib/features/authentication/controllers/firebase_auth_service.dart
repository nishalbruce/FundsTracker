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
}
