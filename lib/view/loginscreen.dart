import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_authetication/view/homescreen.dart';

class LoginScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        appBar: AppBar(
           backgroundColor: Colors.brown,
          title: const Text("login screen"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "name"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "password"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.brown), ),
                  onPressed: () {
                     if (nameController.text.isEmpty && passwordController.text.isEmpty){
                      Get.snackbar(
                          "Warning", "",messageText:const Text("Name and password is empty") ,colorText: Colors.white,
                          snackPosition: SnackPosition.BOTTOM,
                          isDismissible: true,
                          duration:const Duration(
                            seconds: 4,
                          ),
                          backgroundColor: Colors.red,
                          forwardAnimationCurve:Curves.easeOutBack,
                          );
                    }
                   else if (nameController.text == passwordController.text) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  HomeScreen()),
                      );
                    } else {
                       Get.snackbar(
                          "Warning", "",messageText:const Text("Name and password is not matching") ,colorText: Colors.white,
                          snackPosition: SnackPosition.BOTTOM,
                          isDismissible: true,
                          duration: Duration(
                            seconds: 4,
                          ),
                          backgroundColor: Colors.red,
                          forwardAnimationCurve:Curves.easeOutBack,
                          );

                    }
                    nameController.clear();
                    passwordController.clear();
                  },
                  child: const Text("login"))
            ],
          ),
        ),
      ),
    );
  }
}
