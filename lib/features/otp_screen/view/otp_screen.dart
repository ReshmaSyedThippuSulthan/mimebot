import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:mimebot/features/create_new_screen/view/register_screen.dart';
import 'package:mimebot/features/login_screen/view/login_page.dart';
import 'package:mimebot/features/otp_screen/controller/otp_controller.dart';

class OtpVerifyScreen extends StatefulWidget {
  final String mobileno;

  const OtpVerifyScreen({super.key, required this.mobileno});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  String verification = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const CreateNewScreen(),
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
          "OTP Verification",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 45),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Enter OTP",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            OtpTextField(
              borderWidth: 1.5,
              borderRadius: BorderRadius.circular(15),
              fieldWidth: 45,
              numberOfFields: 6,
              keyboardType: TextInputType.number,
              disabledBorderColor: Colors.black,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25))),
              alignment: Alignment.bottomLeft,
              focusedBorderColor: Colors.black,
              enabledBorderColor: Colors.black38,
              borderColor: Colors.black,
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                print(
                    "===================================================$code");
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                setState(() {
                  verification = verificationCode;
                });

                // showDialog(
                //     context: context,
                //     builder: (context) {
                //       return AlertDialog(
                //         title: const Text("Verification Code"),
                //         content: Text('Code entered is $verificationCode'),

                //       );
                //     });
              }, // end onSubmit
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Resend OTP",
                        style:
                            TextStyle(color: Color(0XFFDF9839), fontSize: 15),
                      )),
                )
              ],
            ),
            const SizedBox(
              height: 200,
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
                    OtpController.otpScreen(
                            phone: widget.mobileno, otpVerify: verification)
                        .then(
                      (value) {
                        if (value != null) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ));
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
          ],
        ),
      ),
    );
  }
}
