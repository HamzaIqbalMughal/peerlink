import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:google_fonts/google_fonts.dart';
// import 'package:badges/badges.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String themeColor1CodeHexa = "#fff1a443";
  String themeColor2CodeHexa = "#ff2e4757";
  String appbarColorCodeHexa = "#fff7d2a0";

  @override
  Widget build(BuildContext context) {
    Color themeColor1 =
        Color(int.parse(themeColor1CodeHexa.replaceAll('#', '0x')));
    Color themeColor2 =
        Color(int.parse(themeColor2CodeHexa.replaceAll('#', '0x')));
    Color appbarColor =
        Color(int.parse(appbarColorCodeHexa.replaceAll("#", "0x")));

    // Color appbarColor = Color.fromRGBO(239, 165, 65, 0.4).withOpacity(0.5);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: appbarColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.chat_rounded,
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
                // height: 30,
                // width: 30,
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
            tabs: [
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
              itemCount: 50,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                  ),
                  title: Text('Hamza'),
                  subtitle: Text('kaha ho tum?'),
                  // trailing: Text('1:22pm'),
                  trailing: Column(
                    children: [
                      Text(
                        '4:30 PM',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontSize: 10,
                          // color: Colors.red,
                        ),
                        // style: TextStyle(
                        //   fontSize: 10,
                        //   fontStyle: GoogleFonts.getFont('Inter'),,
                        //   fontFamily:
                        //   // fontFamily: 'Roboto'
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
                  onTap: () {},
                );
              },
            ),
            ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Text('Messages');
              },
            ),
            // Center(child: Text('Groups')),
          ],
        ),
      ),
    );
  }
}
