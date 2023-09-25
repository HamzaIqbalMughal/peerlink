import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String themeColor1CodeHexa = "#fff1a443";
  String themeColor2CodeHexa = "#ff2e4757";
  String appbarColorCodeHexa = "#EFA54180";

  @override
  Widget build(BuildContext context) {
    Color themeColor1 =
        Color(int.parse(themeColor1CodeHexa.replaceAll('#', '0x')));
    Color themeColor2 =
        Color(int.parse(themeColor2CodeHexa.replaceAll('#', '0x')));
    // Color appbarColor =
    //     Color(int.parse(appbarColorCodeHexa.replaceAll("#", "0x")));

    Color appbarColor = Color.fromRGBO(239, 165, 65, 0.4);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
            )
            // Padding(
            //   padding: const EdgeInsets.only(right: 8, left: 3),
            //   child: Icon(
            //     Icons.more_vert,
            //     color: themeColor2,
            //   ),
            // ),
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
        body: TabBarView(children: [
          Center(child: Text('Chat')),
          Center(child: Text('Groups')),
        ]),
      ),
    );
  }
}
