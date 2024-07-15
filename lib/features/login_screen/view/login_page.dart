import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mimebot/features/create_new_screen/model/data.dart';
import 'package:mimebot/features/create_new_screen/view/register_screen.dart';
import 'package:mimebot/features/forgot_screen/view/forgot_screen.dart';
import 'package:mimebot/features/home/view/home_screen.dart';
import 'package:mimebot/features/login_screen/controller/login_controller.dart';
import 'package:mimebot/features/login_screen/model/login_model/login_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isHidden = true;

  LoginModel? loginData;
  List<Data>? datum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0XFFBB86FC),
        title: const Text(
          "Mime Bot",
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Image.asset(
                    "assets/images/mimebot.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: mobileNoController,
                decoration: const InputDecoration(
                    filled: true,
                    hintText: "Mobile number",
                    hintStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    fillColor: Color.fromARGB(31, 77, 77, 77)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: isHidden,
                controller: passwordController,
                decoration: InputDecoration(
                    filled: true,
                    hintText: "Password",
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isHidden = !isHidden;
                          });
                        },
                        icon: isHidden
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
                    hintStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    fillColor: const Color.fromARGB(31, 77, 77, 77)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(elevation: 0),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ForgotScreen(),
                      ));
                    },
                    child: const Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "Forgot password",
                        style: TextStyle(
                          color: Color(0XFFDF9839),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                width: 350,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0XFFBB86FC),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: () {
                      LoginController.loginScreen(
                              mobileNoController.text, passwordController.text)
                          .then(
                        (value) {
                          if (value != null) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomeScreen(
                                loginData: value,
                              ),
                            ));
                          } else {
                            const snackBar = SnackBar(
                              content: Text('invalid credential'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                      );
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account ?",
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CreateNewScreen(),
                        ));
                      },
                      child: const Text("Create New",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0XFFDF9839),
                          )))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
