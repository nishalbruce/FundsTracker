import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
            "Profile",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Image(
                  image: AssetImage("./././assets/images/aclis-onlight.png")
              ),

              Text(
                "John Doe",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                "johndoe@gmail.com",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),

              SizedBox(
                height: 50,
              ),

              //ElevatedButton(
              //  onPressed: () {},
              //  child: Text(
              //      "Sign Out"
              //  ),
              //)
            ],
          ),
        ),
      )
    );
  }
}
