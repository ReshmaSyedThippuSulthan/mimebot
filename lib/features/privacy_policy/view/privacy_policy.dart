import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mimebot/features/privacy_policy/controller/privacy_policy_controller.dart';
import 'package:mimebot/features/privacy_policy/model/privacy_policy_model.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  PrivacyPolicyModel? data;
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      print("print ob1");
      data = await PrivacyPolicyController.PrivacyPolicyScreen();
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
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
          "Privacy Policy",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Image(
                    //   image: NetworkImage(data!.privacyImg![0]),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    const Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Privacy policy",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        data!.privacyPolicy![0],
                        style: const TextStyle(
                            color: Colors.black38,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
