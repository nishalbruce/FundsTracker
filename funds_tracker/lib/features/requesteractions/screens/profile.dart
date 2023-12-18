import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funds_tracker/features/authentication/controllers/auth_controller.dart';
import 'package:funds_tracker/features/authentication/screens/login/login.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/image_strings.dart';
//import '../../authentication/controllers/firebase_auth_service.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthController _authController = AuthController();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        title: const Text(
            "Profile",
          style: TextStyle(
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              const CircleAvatar(
                radius: (50), // Image radius
                backgroundImage: AssetImage(FImages.profile),
              ),

              const SizedBox(
                height: 20,
              ),

              const Text(
                "John Doe",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              const Text("johndoe@gmail.com"),

              const SizedBox(
                height: 50,
              ),

              SizedBox(
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                  ),
                  //onPressed: () => Get.to(() => const LoginScreen()),
                  //onPressed: _authController.signOut,
                  onPressed: (){
                    if(firebaseAuth.currentUser != null){
                      _authController.signOut();
                    }
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Iconsax.logout),
                      SizedBox(width: 10),
                      Text("Logout"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
