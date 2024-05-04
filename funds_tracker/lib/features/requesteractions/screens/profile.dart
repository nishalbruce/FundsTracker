import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:funds_tracker/features/authentication/controllers/auth_controller.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/image_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import '../../authentication/controllers/firebase_auth_service.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthController _authController = AuthController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Document IDs
  List<String> docIDs = [];

  Widget build(BuildContext context) {
    final User? userDoc = firebaseAuth.currentUser;
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          automaticallyImplyLeading: false,
          title: const Text(
            "Profile",
            style: TextStyle(),
          ),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(userDoc?.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("Something went wrong"),
                );
              } else {
                return Padding(
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
                        Text(
                          snapshot.data!["username"],
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          snapshot.data!["email"],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                ),
                              ),
                            ),
                            //onPressed: () => Get.to(() => const LoginScreen()),
                            //onPressed: _authController.signOut,
                            onPressed: () {
                              if (firebaseAuth.currentUser != null) {
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
                );
              }
            }));
  }
}
