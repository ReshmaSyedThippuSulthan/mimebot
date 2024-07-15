import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mimebot/features/forgot_screen/controller/forgot_controller.dart';
import 'package:mimebot/features/forgot_screen/model/forget_model.dart';
import 'package:mimebot/features/login_screen/view/login_page.dart';
import 'package:mimebot/features/otp_screen/view/otp_screen.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  TextEditingController mobileNoController = TextEditingController();

  ForgotModel? forgotData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      forgotData = await ForgotController.forgotScreen(
        mobileNoController.text,
      );
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
          "Forgot Password",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 300,
                      child: Text(
                        "Enter the Email Id associated with your account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0XFF120128),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: mobileNoController,
                    decoration: const InputDecoration(
                        filled: true,
                        hintText: "Email Id",
                        hintStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        fillColor: Color.fromARGB(31, 77, 77, 77)),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 45,
                    width: 150,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0XFFBB86FC),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: () {
                          ForgotController.forgotScreen(mobileNoController.text)
                              .then(
                            (value) {
                              if (value != null) {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => OtpVerifyScreen(
                                    mobileno: mobileNoController.text,
                                  ),
                                ));
                              }
                            },
                          );
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
                  )
                ],
              ),
            ),
    );
  }
}
