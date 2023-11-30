import 'package:flutter/material.dart';
import '../../../../common/components/navbar_approver.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:funds_tracker/common/styles/spacing_styles.dart';
import 'package:funds_tracker/utils/constants/colors.dart';
import 'package:funds_tracker/utils/constants/image_strings.dart';
import 'package:funds_tracker/utils/constants/sizes.dart';
import '../../../../common/components/navbar.dart';
import '../../controllers/auth_controller.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;
  bool visible = false;
  //final _emailController = TextEditingController();
  //final _passwordController = TextEditingController();
  final AuthController _authController = AuthController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  //final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: FSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              // Logo
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    height: 70,
                    image: AssetImage(FImages.appLogo),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Funds Tracker",
                    style: TextStyle(
                        color: FColors.primary
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 50,
              ),

              const Text(
                  "Authentication",
                style: TextStyle(
                  fontSize: FSizes.fontSizeXl,
                  fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              // Form
              Form(child: Padding(
                padding: const EdgeInsets.symmetric(vertical: FSizes.spaceBtwSections),
                key: _formkey,
                child: Column(
                  children: [
                    //Email
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        labelText: "Email"
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email cannot be empty";
                        }
                        if (!RegExp(
                            "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
                          return ("Please enter a valid email");
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        _emailController.text = value!;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),

                    const SizedBox(
                      height: FSizes.spaceBtwInputFields
                    ),

                    TextFormField(
                      controller: _passwordController,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.password_check),
                        labelText: "Password",
                        //suffixIcon: Icon(Iconsax.eye_slash),
                        suffixIcon: IconButton(
                            icon: Icon(_isObscure ? Iconsax.eye_slash : Iconsax.eye),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            }),
                      ),
                      validator: (value) {
                        RegExp regex = RegExp(r'^.{6,}$');
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        }
                        if (!regex.hasMatch(value)) {
                          return ("please enter valid password min. 6 character");
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        _passwordController.text = value!;
                      },
                      keyboardType: TextInputType.visiblePassword,
                    ),

                    //const SizedBox(
                    //    height: FSizes.spaceBtwInputFields / 2
                    //),
//
                    //Row(
                    //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //  children: [
                    //    // Remember Me
                    //    Row(
                    //      children: [
                    //        Checkbox(
                    //            value: true,
                    //            onChanged: (value){},
                    //          activeColor: FColors.primary,
                    //        ),
                    //        const Text(
                    //            "Remember Me",
                    //          style: TextStyle(
                    //            fontSize: FSizes.fontSizeXs,
                    //          ),
                    //        )
                    //      ],
                    //    ),
//
                    //    //Forgot Password
                    //    TextButton(
                    //      onPressed: (){},
                    //      child: const Text(
                    //          "Forgot Password",
                    //        style: TextStyle(
                    //          fontSize: FSizes.fontSizeXs,
                    //          color: FColors.primary,
                    //        ),
                    //      ),
//
                    //    )
                    //  ],
                    //),

                    const SizedBox(
                        height: FSizes.spaceBtwSections
                    ),

                    // Validation Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        //onPressed: () => Get.to(() => const NavBar()),
                          onPressed: validateSignIn,
                        child: const Text("Validate"),
                      ),
                    ),



                    //const SizedBox(
                    //    height: FSizes.spaceBtwItems
                    //),
//
                    //SizedBox(
                    //  width: double.infinity,
                    //  child: ElevatedButton(
                    //    onPressed: () => Get.to(() => const NavBarApprover()),
                    //    child: const Text("Go To Approver"),
                    //  ),
                    //)
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
      //floatingActionButton: FloatingActionButton(
      //  child: const Icon(Icons.add),
      //  onPressed: (){
      //    FirebaseFirestore.instance
      //        .doc("users/WlQ5bQrBU2Swoyz8l9oQIlfEazH3")
      //        .snapshots().listen((data) {
      //          print(data.get("email").toString());
      //    });
      //  },
      //),
    );
  }


  void validateCredentials() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (_formkey.currentState!.validate()) {
      _authController.signIn(email,password);
    }
    FocusScope.of(context).unfocus();
  }

  void validateSignIn() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if(email.isNotEmpty && password.isNotEmpty){
      if (_formkey.currentState!.validate()) {
        _authController.signIn(email,password);
      }
      FocusScope.of(context).unfocus();
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


}

