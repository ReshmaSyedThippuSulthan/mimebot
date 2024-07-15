import 'package:flutter/material.dart';

class ShareAppScreen extends StatefulWidget {
  const ShareAppScreen({super.key});

  @override
  State<ShareAppScreen> createState() => _ShareAppScreenState();
}

class _ShareAppScreenState extends State<ShareAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog(),
    );
  }
}
