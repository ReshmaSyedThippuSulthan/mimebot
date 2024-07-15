import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mimebot/core/colors.dart';

class CourseDetailsScreen extends StatefulWidget {
  const CourseDetailsScreen({super.key});

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
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
                  "Course Details",
                  style: GoogleFonts.prompt(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: textColor),
                ),
              ),
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
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text("Algebra",
                              style: GoogleFonts.prompt(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: textColor)),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Lesson 2 ",
                          style: GoogleFonts.prompt(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: greyTextColor),
                        ),
                        Text(
                          " * ",
                          style: GoogleFonts.prompt(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: greyTextColor),
                        ),
                        Text(
                          "Video 4 ",
                          style: GoogleFonts.prompt(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: greyTextColor),
                        ),
                      ],
                    ),
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
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 24),
                child: Text(
                  "Introduction to Algebra",
                  style: GoogleFonts.prompt(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: textColor),
                ),
              ),
              Text(
                  "Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices mauris.",
                  style: GoogleFonts.prompt(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: greyTextColor)),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 24),
                child: Text(
                  "Lessons",
                  style: GoogleFonts.prompt(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: textColor),
                ),
              ),
              Divider(),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 24),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "https://plus.unsplash.com/premium_photo-1663040014450-11d8157ad539?q=40")),
                                  borderRadius: BorderRadius.circular(12)),
                              height: 70,
                              width: 70,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Introduction to Algebra",
                                  style: GoogleFonts.prompt(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: textColor),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Lesson 2 ",
                                      style: GoogleFonts.prompt(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: greyTextColor),
                                    ),
                                    Text(
                                      " * ",
                                      style: GoogleFonts.prompt(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: greyTextColor),
                                    ),
                                    Text(
                                      "Video 4 ",
                                      style: GoogleFonts.prompt(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: greyTextColor),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Spacer(),
                            Container(
                              height: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: primaryColor,
                              ),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.play_arrow,
                                    size: 20,
                                    color: Colors.white,
                                  )),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
