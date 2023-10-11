import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peerlink/ChatScreen.dart';
import 'components/ChatTile.dart';
import 'constants.dart';
// import 'package:badges/badges.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String screen_id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool isChatTab = true;

  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    ); // error of passing 'this' is resolved by adding "SingleTickerProviderStateMixin" on _HomeScreenState class
    _tabController.addListener(_handleTabChange);
  }

  void toggleFloatingButton() {
    setState(() {
      isChatTab = !isChatTab;
    });
  }
  _handleTabChange(){
    if(_tabController.indexIsChanging){
      toggleFloatingButton();
      print('Index is : ');
      print(_tabController.index);
    }
  }

  @override
  void dispose() {
    _tabController.dispose(); // Don't forget to dispose the controller.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

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
          onPressed: () {
            if (isChatTab) {
              Fluttertoast.showToast(msg: 'New Chat Pressed');
            } else {
              Fluttertoast.showToast(msg: 'New Group Pressed');
            }
          },
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
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 2,
            indicatorColor: themeColor1,
            unselectedLabelColor: themeColor2,
            labelColor: themeColor2,
            // isScrollable: true,
            labelStyle: TextStyle(
              fontSize: 20,
              fontFamily: 'Itim',
              fontWeight: FontWeight.w400,
            ),
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
                
                return ChatTile();
              },
            ),
            ListView.builder(
              itemCount: 25,
              itemBuilder: (context, index) {

                return ChatTile();
              },
            ),
          ],
        ),
      ),
    );
  }
}
