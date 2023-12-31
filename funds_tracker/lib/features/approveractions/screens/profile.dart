import 'package:flutter/material.dart';
import 'package:funds_tracker/features/authentication/screens/login/login.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/image_strings.dart';

class ProfileApprover extends StatefulWidget {
  const ProfileApprover({super.key});

  @override
  State<ProfileApprover> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileApprover> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
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
                    onPressed: () => Get.to(() => const LoginScreen()),
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

