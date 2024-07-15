import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mimebot/core/colors.dart';
import 'package:mimebot/features/about/view/about_screen.dart';
import 'package:mimebot/features/change_password/view/change_password_screen.dart';
import 'package:mimebot/features/contactus_screen.dart/view/contactus_sceen.dart';
import 'package:mimebot/features/create_new_screen/model/data.dart';
import 'package:mimebot/features/login_screen/model/login_model/login_model.dart';
import 'package:mimebot/features/login_screen/view/login_page.dart';
import 'package:mimebot/features/privacy_policy/controller/privacy_policy_controller.dart';
import 'package:mimebot/features/privacy_policy/view/privacy_policy.dart';
import 'package:mimebot/features/profile/controller/profile_controller.dart';
import 'package:mimebot/features/profile/model/profile_model/profile_model.dart';
import 'package:mimebot/features/terms&condition/view/terms&condition.dart';

class ProfileScreen extends StatefulWidget {
  final LoginModel? loginData;
  const ProfileScreen({super.key, this.loginData});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileModel? profileData;
  List<Data>? data;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      print("print ob1");
      profileData =
          await ProfileController.profileScreen(widget.loginData!.data!.regId);
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
      backgroundColor: Colors.white,

      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: primaryColor,
      //   title: Text(
      //     "Mime Bot",
      //     style: GoogleFonts.prompt(
      //         fontSize: 16, fontWeight: FontWeight.w500, color: secondaryColor),
      //   ),
      //   actions: [
      //     IconButton(
      //         onPressed: () => {},
      //         icon: const Icon(
      //           Icons.notifications,
      //           color: Colors.white,
      //           size: 24,
      //         ))
      //   ],
      // ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Column(
                      children: [
                        Image.asset("assets/images/profile.png"),
                        Text(
                          profileData!.data!.userName!,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          profileData!.data!.mobileNumber!,
                          style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          profileData!.data!.email!,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 45,
                          width: 110,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  backgroundColor: const Color(0XFFBB86FC)),
                              onPressed: () {},
                              child: const Text(
                                "Edit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              )),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AboutUsScreen(),
                            ));
                          },
                          child: Container(
                            height: 50,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(31, 80, 78, 78),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image(
                                    image: AssetImage(
                                        "assets/images/profile_aboutus.png"),
                                    fit: BoxFit.cover,
                                    height: 40,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "About Us",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ContactUsScreen(),
                            ));
                          },
                          child: Container(
                            height: 50,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(31, 80, 78, 78),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image(
                                    image: AssetImage(
                                        "assets/images/profile_contactus.png"),
                                    fit: BoxFit.cover,
                                    height: 40,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Contact Us",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const TermsConditionScreen(),
                            ));
                          },
                          child: Container(
                            height: 50,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(31, 80, 78, 78),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image(
                                    image: AssetImage(
                                        "assets/images/profile_terms.png"),
                                    fit: BoxFit.cover,
                                    height: 40,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Terms & Conditions",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const PrivacyPolicyScreen(),
                            ));
                          },
                          child: Container(
                            height: 50,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(31, 80, 78, 78),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.privacy_tip_sharp, size: 30),
                                  // Image(
                                  //   image: AssetImage(
                                  //       "assets/images/profile_aboutus.png"),
                                  //   fit: BoxFit.cover,
                                  //   height: 40,
                                  // ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Privacy_Policy",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const ChangePasswordScreen(),
                            ));
                          },
                          child: Container(
                            height: 50,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(31, 80, 78, 78),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image(
                                    image: AssetImage(
                                        "assets/images/profile_chnagepwd.png"),
                                    fit: BoxFit.cover,
                                    height: 40,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Change Password",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Container(
                        //   height: 50,
                        //   decoration: const BoxDecoration(
                        //       color: Color.fromARGB(31, 80, 78, 78),
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(15))),
                        //   child: const Padding(
                        //     padding: EdgeInsets.all(10.0),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       children: [
                        //         Image(
                        //           image: AssetImage(
                        //               "assets/images/profile_share.png"),
                        //           fit: BoxFit.cover,
                        //           height: 40,
                        //         ),
                        //         SizedBox(
                        //           width: 10,
                        //         ),
                        //         Text(
                        //           "Share App",
                        //           style: TextStyle(
                        //               color: Colors.black,
                        //               fontSize: 18,
                        //               fontWeight: FontWeight.w400),
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                                (Route<dynamic> route) => false);
                          },
                          child: Container(
                            height: 50,
                            decoration: const BoxDecoration(
                                color: Color(0XFFFE6D71),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image(
                                    image: AssetImage(
                                        "assets/images/profile_poweroff.png"),
                                    fit: BoxFit.cover,
                                    height: 40,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Logout",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
    );
  }
}
