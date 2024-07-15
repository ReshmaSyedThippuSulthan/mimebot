import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mimebot/core/colors.dart';
import 'package:mimebot/features/categories/view/categories_screen.dart';
import 'package:mimebot/features/home/view/home_screen_body.dart';
import 'package:mimebot/features/login_screen/model/login_model/login_model.dart';
import 'package:mimebot/features/profile/view/profile_screen.dart';
import 'package:mimebot/features/savedscreen/view/saved_screen.dart';

class HomeScreen extends StatefulWidget {
  final LoginModel? loginData;
  const HomeScreen({super.key, this.loginData});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> bottomScreen = [];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bottomScreen = <Widget>[
      const HomeScreenBodyWidget(),
      const SavedScreen(),
      const CategoriesScreen(),
      ProfileScreen(
        loginData: widget.loginData,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
        bottomNavigationBar: BottomNavigationBar(
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
            iconSize: 30,
            items: const [
              BottomNavigationBarItem(
                  backgroundColor: Color(0XFFBB86FC),
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  backgroundColor: Color(0XFFBB86FC),
                  icon: Icon(
                    Icons.bookmark,
                    color: Colors.white,
                  ),
                  label: "Saved"),
              BottomNavigationBarItem(
                  backgroundColor: Color(0XFFBB86FC),
                  icon: Icon(
                    Icons.window_sharp,
                    color: Colors.white,
                  ),
                  label: "Category"),
              BottomNavigationBarItem(
                  backgroundColor: Color(0XFFBB86FC),
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  label: "Profile")
            ]),
        body: Center(
          child: bottomScreen.elementAt(_selectedIndex),
        ));
  }
}
