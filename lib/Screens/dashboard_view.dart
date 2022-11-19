import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:zekademy/Screens/Create/create_view.dart';
import 'package:zekademy/Screens/Health/health_view.dart';
import 'package:zekademy/Screens/Home/home_view.dart';
import 'package:zekademy/Screens/People/user_people_view.dart';
import 'package:zekademy/Screens/Profile/profile_view.dart';
import 'package:zekademy/Util/index_librarby.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late PersistentTabController _controller;
  late bool _hideNavBar;

  List<Widget> _buildScreens() => [
        const HomePage(),
        const UserPeoplePageView(),
        const CreatePageView(),
        const HealthPageView(),
        const ProfilePageView(),
      ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
          icon: Image.asset('assets/icons/Home.png'),
          iconSize: 26,
          contentPadding: 2,
          title: "Home",
          activeColorPrimary: MyCustomColor.purple,
          inactiveColorPrimary: MyCustomColor.navbarFont,
          textStyle: MyCustomFont.getRobotoNavbarStyle(),
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset('assets/icons/3 User.png'),
          title: "People",
          iconSize: 26,
          contentPadding: 0,
          activeColorPrimary: MyCustomColor.purple,
          inactiveColorPrimary: MyCustomColor.navbarFont,
          textStyle: MyCustomFont.getRobotoNavbarStyle(),
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset('assets/icons/Plus.png'),
          title: "Create",
          activeColorPrimary: MyCustomColor.purple,
          inactiveColorPrimary: MyCustomColor.navbarFont,
          textStyle: MyCustomFont.getRobotoNavbarStyle(),
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset('assets/icons/Heart.png'),
          title: "Health",
          activeColorPrimary: MyCustomColor.purple,
          inactiveColorPrimary: MyCustomColor.navbarFont,
          textStyle: MyCustomFont.getRobotoNavbarStyle(),
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset('assets/icons/Profile.png'),
          title: "Profile",
          activeColorPrimary: MyCustomColor.purple,
          inactiveColorPrimary: MyCustomColor.navbarFont,
          textStyle: MyCustomFont.getRobotoNavbarStyle(),
        ),
      ];
  @override
  void initState() {
    super.initState();

    _controller = PersistentTabController();
    _hideNavBar = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: .5,
        leadingWidth: 72,
        leading: Container(
          margin: const EdgeInsets.only(left: 14),
          child: Image.asset("assets/icons/Logo.png"),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: null,
              icon: Image.asset('assets/icons/Notification.png'),
            ),
            IconButton(
              onPressed: null,
              icon: Image.asset('assets/icons/Search.png'),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          resizeToAvoidBottomInset: true,
          navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
              ? 0.0
              : kBottomNavigationBarHeight,
          bottomScreenMargin: kBottomNavigationBarHeight,

          backgroundColor: Colors.white,
          hideNavigationBar: _hideNavBar,
          decoration: const NavBarDecoration(colorBehindNavBar: Colors.white),
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
          ),

          navBarStyle:
              NavBarStyle.style6, // Choose the nav bar style with this property
        ),
      ),
    );
  }
}
