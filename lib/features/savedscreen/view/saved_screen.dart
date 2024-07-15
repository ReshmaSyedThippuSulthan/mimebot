import 'package:flutter/material.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Saved Videos",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Card(
                    child: SizedBox(
                      height: 200,
                      width: 500,
                      child: Padding(padding: EdgeInsets.all(20.0)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
