import 'package:flutter/material.dart';
import '../../../../common/widgets/navigation_menu_approver.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:funds_tracker/common/styles/spacing_styles.dart';
import 'package:funds_tracker/utils/constants/colors.dart';
import 'package:funds_tracker/utils/constants/image_strings.dart';
import 'package:funds_tracker/utils/constants/sizes.dart';
import '../../../../common/widgets/navigation_menu.dart';
import '../../../../utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: FSpacingStyle.paddingWithAppBarHeight,
          child: Column(

            children: [
              const SizedBox(
                height: 100,
              ),
              // Logo
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    height: 70,
                    image: AssetImage(FImages.appLogo),
                  )
                ],
              ),

              const SizedBox(
                height: 50,
              ),

              // Form
              Form(child: Padding(
                padding: const EdgeInsets.symmetric(vertical: FSizes.spaceBtwSections),
                child: Column(
                  children: [
                    //Email
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        labelText: "E-mail"
                      ),
                    ),

                    const SizedBox(
                      height: FSizes.spaceBtwInputFields
                    ),

                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.password_check),
                        labelText: "Password",
                        suffixIcon: Icon(Iconsax.eye_slash),
                      ),
                    ),

                    const SizedBox(
                        height: FSizes.spaceBtwInputFields / 2
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Remember Me
                        Row(
                          children: [
                            Checkbox(
                                value: true,
                                onChanged: (value){},
                              activeColor: FColors.primary,
                            ),
                            const Text(
                                "Remember Me",
                              style: TextStyle(
                                fontSize: FSizes.fontSizeXs,
                              ),
                            )
                          ],
                        ),

                        //Forgot Password
                        TextButton(
                          onPressed: (){},
                          child: const Text(
                              "Forgot Password",
                            style: TextStyle(
                              fontSize: FSizes.fontSizeXs,
                              color: FColors.primary,
                            ),
                          ),

                        )
                      ],
                    ),

                    const SizedBox(
                        height: FSizes.spaceBtwSections
                    ),

                    // Sign In Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => const NavigationMenu()),
                        child: const Text("Validate"),
                      ),
                    ),

                    const SizedBox(
                        height: FSizes.spaceBtwItems
                    ),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => const NavigationMenuApprover()),
                        child: const Text("Go To Approver"),
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
            ),
      ),
    );
  }
}
