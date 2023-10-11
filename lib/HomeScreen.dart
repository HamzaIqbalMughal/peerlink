import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peerlink/ChatScreen.dart';
import 'constants.dart';
// import 'package:badges/badges.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String screen_id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isChatTab = true;

  @override
  Widget build(BuildContext context) {
    void toggleFloatingButton() {
      setState(() {
        isChatTab = !isChatTab;
      });
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: appbarColor,
          child: isChatTab
              ? Icon(
                  Icons.chat_rounded,
                  color: themeColor2,
                  size: 40,
                )
              : Icon(
                  Icons.groups,
                  color: themeColor2,
                  size: 40,
                ),
          onPressed: () {},
        ),
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            'PeerLink',
            style: TextStyle(
              color: themeColor2,
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
          backgroundColor: appbarColor,
          leading: Container(
            // color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SvgPicture.asset(
                'assets/icons/peerlink_logo.svg',
              ),
            ),
          ),
          actions: [
            Icon(
              Icons.search,
              color: themeColor2,
            ),
            PopupMenuButton(
              icon: Icon(
                Icons.more_vert_outlined,
                color: themeColor2,
              ),
              itemBuilder: (context) => const [
                PopupMenuItem(
                  value: '1',
                  child: Text('option 1'),
                ),
                PopupMenuItem(
                  value: '2',
                  child: Text('option 2'),
                ),
                PopupMenuItem(
                  value: '2',
                  child: Text('option 3'),
                ),
              ],
            ),
          ],

          bottom: TabBar(
            labelColor: themeColor2,
            labelStyle: TextStyle(
              fontSize: 20,
              fontFamily: 'Itim',
              fontWeight: FontWeight.w400,
            ),
            indicatorColor: themeColor1,
            indicatorWeight: 2,
            unselectedLabelColor: themeColor2,
            onTap: (index) {
              if ((index == 0 && !isChatTab) || (index == 1 && isChatTab)) {
                toggleFloatingButton();
              } else if (index == 0 && isChatTab) {
                Fluttertoast.showToast(
                    msg: 'Already on Chat Screen $isChatTab');
              } else if (index == 1 && !isChatTab) {
                Fluttertoast.showToast(msg: 'Already on Peer Groups Screen');
              }
              // Fluttertoast.showToast(msg: 'you tapped $index');
            },
            tabs: const [
              Tab(
                text: "Chat",
              ),
              Tab(
                text: "Peer Groups",
              ),
            ],
          ),

          // backgroundColor: Color(0xEFA54180),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: 25,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                  ),
                  title: Text('Hamza'),
                  subtitle: Text('kaha ho tum? '),
                  // trailing: Text('1:22pm'),
                  trailing: Column(
                    children: [
                      Text(
                        '4:30 PM',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 8,
                        ),
                        // style: GoogleFonts.getFont(
                        //   'Inter',
                        //   fontSize: 8,
                        //   // color: Colors.red,
                        // ),
                      ),
                      badges.Badge(
                        badgeStyle: badges.BadgeStyle(
                          badgeColor: themeColor1,
                        ),
                        badgeContent: Text(
                          '2',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // dense: true,
                  onTap: () {
                    Navigator.pushNamed(context, ChatScreen.screen_id);
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context)=> ChatScreen(),
                    //     )
                    // );
                  },
                );
              },
            ),
            ListView.builder(
              itemCount: 25,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                  ),
                  title: Text('CS Group'),
                  subtitle: Text('Hello Everyone'),
                  trailing: Column(
                    children: [
                      Text(
                        '4:30 PM',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 8,
                        ),
                        // style: GoogleFonts.getFont(
                        //   'Inter',
                        //   fontSize: 8,
                        // ),
                      ),
                      badges.Badge(
                        badgeStyle: badges.BadgeStyle(
                          badgeColor: themeColor1,
                        ),
                        badgeContent: Text(
                          '2',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {},
                );
              },
            ),
            // Center(child: Text('Groups')),
          ],
        ),
      ),
    );
  }
}
