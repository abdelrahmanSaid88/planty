import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planty/components/my_theme_colors.dart';
import 'package:planty/screens/Home/home_fragment.dart';
import 'package:planty/screens/Profile/profile_screen.dart';
import 'package:planty/screens/scan/scan_result.dart';
class HomeScreen extends StatefulWidget {
 // const HomeScreen({Key? key}) : super(key: key);
  static const routeName = 'Home Screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyThemeColors.backgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyThemeColors.mainDarkGreen,
        child: SvgPicture.asset("assets/images/ic_scan.svg"),
        //shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 0)),
        onPressed: () { onPress();},
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 80.0,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          elevation: 10.0,
          selectedItemColor: MyThemeColors.darkGreen,
          currentIndex: _currentIndex,
          onTap: (int index) {
            _currentIndex = index;
            setState(() {});
          },
          showUnselectedLabels: true,
          showSelectedLabels: true,
          items:const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/ic_home.png'),
                size: 35,
              ),
              label: 'Planty',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/ic_profile.png'),
                size: 35,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: tabs[_currentIndex],
    );
  }

  List<Widget> tabs =[
    HomeFragment(),
    ProfileScreen()
  ];
  void onPress() {
    Navigator.pushNamed(context, ScanResult.routeName);
  }

}
