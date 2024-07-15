import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mimebot/features/login_screen/view/login_page.dart';
import 'package:mimebot/features/ob_screen/controller/ob1_controller.dart';
import 'package:mimebot/features/ob_screen/model/ob1_model.dart';
import 'package:mimebot/features/ob_screen/model/splash_screen.dart';

class OB3Screen extends StatefulWidget {
  const OB3Screen({super.key});

  @override
  State<OB3Screen> createState() => _OB3ScreenState();
}

class _OB3ScreenState extends State<OB3Screen> {
  Ob1Model? data;
  List<SplashScreen>? datum;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      print("print ob1");
      data = await Ob1Controller.splashScreenob1("3");
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
      appBar: AppBar(
        backgroundColor: const Color(0XFFBB86FC),
        title: const Text(
          "Mime Bot",
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ));
                        },
                        child: const Row(
                          children: [
                            Text(
                              "Skip",
                              style: TextStyle(
                                  color: Color(0XFFDF9839),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Color(0XFFDF9839),
                              size: 20,
                              weight: 30,
                            )
                          ],
                        )),
                  ],
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Positioned(
                        top: 80,
                        child: Image.network(
                          data!.splashScreen!.first.image!,
                        ),
                      ),
                      SizedBox(
                        width: width,
                        child: Image.asset(
                          "assets/images/ob1.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            data!.splashScreen!.first.title ?? "no data",
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 300,
                            child: Text(
                              data!.splashScreen!.first.description ??
                                  "no data",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 170,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    backgroundColor: Colors.white),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ));
                                },
                                child: const Text(
                                  "Get Started",
                                  style: TextStyle(
                                      color: Color(0XFFBB86FC), fontSize: 20),
                                )),
                          ),
                          const SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
