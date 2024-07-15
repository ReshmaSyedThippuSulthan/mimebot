import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mimebot/core/colors.dart';

//intha two import use pannu error ku

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 24),
            child: Text(
              "Categories",
              style: GoogleFonts.prompt(
                  fontSize: 18, fontWeight: FontWeight.w500, color: textColor),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 4 / 5),
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 220,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://plus.unsplash.com/premium_photo-1663040014450-11d8157ad539?q=40")),
                                borderRadius: BorderRadius.circular(12)),
                            height: 120,
                            width: 160,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.0),
                            child: Text("Algebra"),
                          ),
                          Row(
                            children: [
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
                                "Reshma",
                                style: GoogleFonts.prompt(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: textColor),
                              )
                            ],
                          )
                        ],
                      )),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
