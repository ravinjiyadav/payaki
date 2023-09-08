import 'package:flutter/material.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/modules/chat/screens/chat_list_screen.dart';
import 'package:payaki/modules/chat/screens/web_view_chat_screen.dart';
import 'package:payaki/modules/chat/viewModel/chat_list_screen_vm.dart';
import 'package:payaki/modules/home/screens/home_screen.dart';
import 'package:payaki/modules/home/viewModel/home_screen_vm.dart';
import 'package:payaki/modules/myAds/screen/my_ads_screen.dart';
import 'package:payaki/modules/myAds/viewModel/my_ads_screen_vm.dart';
import 'package:payaki/modules/profile/screens/profile_screen.dart';
import 'package:payaki/modules/profile/viewModel/profile_screen_vm.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/constants.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _selectIndex = 0;

  final List<Widget> _children = [
    // const HomeScreen(),

    ChangeNotifierProvider(
      create: (_) => HomeScreenVm(),
      child: const HomeScreen(),
    ),

    // ChangeNotifierProvider(
    //   create: (_) => ChatListScreenVm(),
    //   child: const ChatListScreen(),
    // ),

    // WebViewChatScreen(url: Preference().getUserChatUrl(),),

    const SizedBox(),

    ChangeNotifierProvider(
        create: (_) => MyAdsScreenVm(), child: const MyAdsScreen()),
    // Screen4(),

    ChangeNotifierProvider(
      create: (_) => ProfileScreenVm(),
      child: const ProfileScreen(),
    )
  ];

  void onTabTapped(int index) {
    if (Preference().getUserLogin() == false && index != _selectIndex) {
      goToLogIn();
    } else {
      if (index == 1) {
        Navigator.pushNamed(context, RouteName.webViewChatScreen,
            arguments: {"url": Preference().getUserChatUrl()});
      } else {
        setState(() {
          _selectIndex = index;
        });
      }
    }
  }

  goToLogIn() {
    Navigator.pushNamed(context, RouteName.logInScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(builder: (BuildContext context) {
      return Scaffold(
        body: _children[_selectIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
            margin: const EdgeInsets.only(bottom: 30),
            child: GestureDetector(
              onTap: () {
                if (Preference().getUserLogin() == true) {
                  Navigator.pushNamed(context, RouteName.chooseCategoryScreen);
                } else {
                  goToLogIn();
                }
              },
              child: Image.asset(
                ImageUtility.addPostIcon,
                width: 60,
                height: 60,
              ),
            )),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(blurRadius: 15.0, color: Colors.black12),
                  ],
                ),
                child: Image.asset(
                  ImageUtility.bottomBarBg,
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: BottomBarWidget(
                      onTap: () {
                        onTabTapped(0);
                      },
                      title: "Home",
                      image: ImageUtility.homeIcon,
                      currentIndex: 0,
                      selectIndex: _selectIndex,
                    )),
                    Expanded(
                        child: BottomBarWidget(
                      onTap: () {
                        onTabTapped(1);
                      },
                      title: "Chat",
                      image: ImageUtility.chatIcon,
                      currentIndex: 1,
                      selectIndex: _selectIndex,
                    )),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Expanded(
                        child: BottomBarWidget(
                      onTap: () {
                        onTabTapped(2);
                      },
                      title: "My Add",
                      image: ImageUtility.myAddIcon,
                      currentIndex: 2,
                      selectIndex: _selectIndex,
                    )),
                    Expanded(
                        child: BottomBarWidget(
                      onTap: () {
                        onTabTapped(3);
                      },
                      title: "Profile",
                      image: ImageUtility.profileIcon,
                      currentIndex: 3,
                      selectIndex: _selectIndex,
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }));

    //   bottomNavigationBar: Container(
    //     color: Colors.white,
    //     child: Stack(
    //       children: [
    //         Container(
    //           decoration: const BoxDecoration(
    //             boxShadow: [
    //               BoxShadow(blurRadius: 15.0, color: Colors.black12),
    //             ],
    //           ),
    //           child: Image.asset(
    //             ImageUtility.bottomBarBg,
    //             height: 80,
    //             width: MediaQuery.of(context).size.width,
    //             fit: BoxFit.fill,
    //           ),
    //         ),
    //         SizedBox(
    //           height: 80,
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //             children: [
    //               Expanded(
    //                   child: BottomBarWidget(
    //                 onTap: () {
    //                   onTabTapped(0);
    //                 },
    //                 title: "Home",
    //                 image: ImageUtility.homeIcon,
    //                 currentIndex: 0,
    //                 selectIndex: _selectIndex,
    //               )),
    //               Expanded(
    //                   child: BottomBarWidget(
    //                 onTap: () {
    //                   onTabTapped(1);
    //                 },
    //                 title: "Chat",
    //                 image: ImageUtility.chatIcon,
    //                 currentIndex: 1,
    //                 selectIndex: _selectIndex,
    //               )),
    //               const Expanded(
    //                 child: SizedBox(),
    //               ),
    //               Expanded(
    //                   child: BottomBarWidget(
    //                 onTap: () {
    //                   onTabTapped(2);
    //                 },
    //                 title: "My Add",
    //                 image: ImageUtility.myAddIcon,
    //                 currentIndex: 2,
    //                 selectIndex: _selectIndex,
    //               )),
    //               Expanded(
    //                   child: BottomBarWidget(
    //                 onTap: () {
    //                   onTabTapped(3);
    //                 },
    //                 title: "Profile",
    //                 image: ImageUtility.profileIcon,
    //                 currentIndex: 3,
    //                 selectIndex: _selectIndex,
    //               )),
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Chat'),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('My Add'),
    );
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await googleSignIn.signOut();
        Preference().clearSharedPreference();
        Navigator.pushNamedAndRemoveUntil(
            context, RouteName.logInScreen, (route) => false);
      },
      child: const Center(
          child: Text(
        'Profile \n Log out',
        textAlign: TextAlign.center,
      )),
    );
  }
}

class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Screen'),
      ),
      body: Center(
        child: Text('This is a new screen'),
      ),
    );
  }
}

class BottomBarWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String image;
  final int currentIndex;
  final int selectIndex;

  const BottomBarWidget(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.image,
      required this.currentIndex,
      required this.selectIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              color: currentIndex == selectIndex
                  ? ColorUtility.color152D4A
                  : ColorUtility.colorB0B9C3,
              height: 25,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: StyleUtility.bottomTextStyle.copyWith(
                  color: currentIndex == selectIndex
                      ? ColorUtility.color152D4A
                      : ColorUtility.colorB0B9C3),
            ),
          ],
        ),
      ),
    );
  }
}
