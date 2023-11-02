import 'package:flutter/material.dart';

class Request extends StatelessWidget {
  const Request({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        title: Text(
            "Request",
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) => const Request(),
                  ),
                  );
                },
              style: const ButtonStyle(
                  
              ),
                child: const Text(
                  "Submit"
                ),
            )
          ],
        ),
      ),
    );
  }
}
