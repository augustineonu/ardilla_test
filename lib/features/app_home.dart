import 'package:ardilla_test/app_config/app_styles/app_colors.dart';
import 'package:ardilla_test/features/dashboard/presentation/dashboard.dart';
import 'package:ardilla_test/features/save/presentation/save.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  int _selectedIndex = 0;
  bool isChecked = false;

  static final List<Widget> _widgetOptions = <Widget>[
    const DashBoard(),
    const Save(),
    const Save(),
    const Save(),
    const Save(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/svg/home.svg",
              //  color: AppColors.primaryColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/svg/save1.svg",
              // color: AppColors.primaryColor,
            ),
            label: 'Save',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/svg/explore1.svg",
              // color: AppColors.primaryColor,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/svg/arcticons_sololearn.svg",
              //color: AppColors.primaryColor,
            ),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/svg/ion_wallet-outline.svg",
              // color: AppColors.primaryColor,
            ),
            label: 'Wallet',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.grey500,
        onTap: _onItemTapped,
      ),
    );
  }
}
