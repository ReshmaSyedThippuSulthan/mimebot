import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController currentpwdController = TextEditingController();
  TextEditingController newpwdController = TextEditingController();
  TextEditingController confirmpwdController = TextEditingController();

  bool isHidden = true;

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
          "Change Password",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            TextField(
              obscureText: isHidden,
              controller: currentpwdController,
              decoration: InputDecoration(
                  filled: true,
                  enabled: false,
                  hintText: "Current Password",
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
                      fontSize: 16, fontWeight: FontWeight.w500),
                  enabledBorder: InputBorder.none,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  fillColor: const Color.fromARGB(31, 77, 77, 77)),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: isHidden,
              controller: newpwdController,
              decoration: InputDecoration(
                  filled: true,
                  enabled: false,
                  hintText: "New Password",
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
                      fontSize: 16, fontWeight: FontWeight.w500),
                  enabledBorder: InputBorder.none,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  fillColor: const Color.fromARGB(31, 77, 77, 77)),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: isHidden,
              controller: confirmpwdController,
              decoration: InputDecoration(
                  filled: true,
                  enabled: false,
                  hintText: "Confirm Password",
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
                      fontSize: 16, fontWeight: FontWeight.w500),
                  enabledBorder: InputBorder.none,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  fillColor: const Color.fromARGB(31, 77, 77, 77)),
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
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ChangePasswordScreen(),
                    ));
                  },
                  child: const Text(
                    "Reset",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
