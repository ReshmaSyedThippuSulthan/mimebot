import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mimebot/features/create_new_screen/controller/register_controller.dart';
import 'package:mimebot/features/create_new_screen/model/data.dart';
import 'package:mimebot/features/create_new_screen/model/registermodelapi.dart';
import 'package:mimebot/features/login_screen/view/login_page.dart';
import 'package:mimebot/features/otp_screen/view/otp_screen.dart';

class CreateNewScreen extends StatefulWidget {
  const CreateNewScreen({super.key});

  @override
  State<CreateNewScreen> createState() => _CreateNewScreenState();
}

class _CreateNewScreenState extends State<CreateNewScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  Registermodelapi? registerData;
  List<Data>? datum;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      registerData = await RegisterController.registerScreen(
          nameController.text,
          emailController.text,
          mobileNoController.text,
          passwordController.text,
          confirmpasswordController.text);
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: const Color(0XFFF5F5F5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ));
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            size: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0XFFBB86FC),
        centerTitle: true,
        title: const Text(
          "Create New User",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: height * 0.9,
            // color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Register",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  textInputAction: TextInputAction.next,
                  controller: nameController,
                  decoration: const InputDecoration(
                      filled: true,
                      disabledBorder: InputBorder.none,
                      hintText: "Name",
                      hintStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      fillColor: Color.fromARGB(31, 77, 77, 77)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  textInputAction: TextInputAction.next,
                  controller: emailController,
                  decoration: const InputDecoration(
                      filled: true,
                      hintText: "Email",
                      hintStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      fillColor: Color.fromARGB(31, 77, 77, 77)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  controller: mobileNoController,
                  decoration: const InputDecoration(
                      filled: true,
                      hintText: "Mobile number",
                      hintStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      fillColor: Color.fromARGB(31, 77, 77, 77)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  textInputAction: TextInputAction.next,
                  controller: passwordController,
                  decoration: InputDecoration(
                      filled: true,
                      hintText: "Password",
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove_red_eye_sharp)),
                      hintStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      fillColor: const Color.fromARGB(31, 77, 77, 77)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  textInputAction: TextInputAction.done,
                  controller: confirmpasswordController,
                  decoration: InputDecoration(
                      filled: true,
                      hintText: "Confirm Password",
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove_red_eye_sharp)),
                      hintStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      fillColor: const Color.fromARGB(31, 77, 77, 77)),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 45,
                  width: 150,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0XFFBB86FC),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
                        RegisterController.registerScreen(
                                nameController.text,
                                emailController.text,
                                mobileNoController.text,
                                passwordController.text,
                                confirmpasswordController.text)
                            .then((value) {
                          if (value != null) {
                            print('Otp${value.data!.otp}');
                            final snackBar = SnackBar(
                              duration: const Duration(seconds: 10),
                              content: Text('Your OTP is ${value.data!.otp}'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => OtpVerifyScreen(
                                mobileno: mobileNoController.text,
                              ),
                            ));
                          }
                          // else {
                          //   const snackBar = SnackBar(
                          //     content: Text(${}),
                          //   );
                          //   ScaffoldMessenger.of(context)
                          //       .showSnackBar(snackBar);
                          // }
                        });
                      },
                      child: const Text(
                        "Get OTP",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      )),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
