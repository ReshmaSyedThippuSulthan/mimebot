import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mimebot/core/colors.dart';

class LessonDetailsScreen extends StatefulWidget {
  const LessonDetailsScreen({super.key});

  @override
  State<LessonDetailsScreen> createState() => _LessonDetailsScreenState();
}

class _LessonDetailsScreenState extends State<LessonDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text(
            "Mime Bot",
            style: GoogleFonts.prompt(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: secondaryColor),
          ),
          actions: [
            IconButton(
                onPressed: () => {},
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 24,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 24),
                child: Text(
                  "Lesson Details",
                  style: GoogleFonts.prompt(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: textColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: backgroundColor,
                            // image: const DecorationImage(
                            //     fit: BoxFit.cover,
                            //     image: NetworkImage(
                            //         "https://plus.unsplash.com/premium_photo-1663040014450-11d8157ad539?q=40")),
                            borderRadius: BorderRadius.circular(16)),
                        height: 220,
                        width: screenwidth * 0.9,
                        child: Column(
                          children: [
                            const Spacer(),
                            Row(
                              children: [
                                const CircleAvatar(
                                  maxRadius: 14,
                                  backgroundImage: NetworkImage(
                                      "https://plus.unsplash.com/premium_photo-1663040014450-11d8157ad539?q=40"),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Reshma BE, ME, Phd",
                                  style: GoogleFonts.prompt(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: textColor),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        right: 50,
                        child: Container(
                            decoration: const BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(4),
                                  bottomRight: Radius.circular(4),
                                )),
                            height: 30,
                            width: 24,
                            child: const Icon(
                              Icons.bookmark,
                              size: 26,
                              color: backgroundColor,
                            )),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
