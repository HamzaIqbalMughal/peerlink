import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String themeColor1CodeHexa = "#fff1a443";
  String themeColor2CodeHexa = "#ff2e4757";
  String appbarColorCodeHexa = "#fff7d2a0";
  bool _lastMsgIsRecieved = true;
  int count=0;
  double _topMarginofTile = 0;
  @override
  Widget build(BuildContext context) {
    Color themeColor1 =
        Color(int.parse(themeColor1CodeHexa.replaceAll('#', '0x')));
    Color themeColor2 =
        Color(int.parse(themeColor2CodeHexa.replaceAll('#', '0x')));
    Color appbarColor =
        Color(int.parse(appbarColorCodeHexa.replaceAll("#", "0x")));

    print('Hello printing ...... $_lastMsgIsRecieved');

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appbarColor,

        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.arrow_back_ios_new_rounded,
                color: themeColor2,
              ),
              CircleAvatar(
                // radius: 22,
                backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
              ),
            ],
          ),
        ),
        leadingWidth: 70,

        title: Text(
          'Name',
          style: TextStyle(
            fontSize: 24,
            color: themeColor2,
          ),
        ),
        // leading: GestureDetector(
        //   onTap: () => Navigator.pop(context),
        //   child: Container(
        //     height: 500,
        //     width: 500,
        //     // padding: const EdgeInsets.only(left: 10),
        //     // color: Colors.red,
        //     child: Icon(
        //       Icons.arrow_back_ios_sharp,
        //     ),
        //   ),
        // ),
        // leading: Container(
        //   color: Colors.red,
        //   margin: EdgeInsets.only(left: 10),
        //   child: Icon(
        //     Icons.arrow_back_ios_sharp,
        //   ),
        // ),

        // title: Container(
        //   color: Colors.green,
        //   child: Row(
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.only(left: 0),
        //         child: CircleAvatar(
        //           backgroundImage: NetworkImage(
        //               'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.only(left: 10),
        //         child: Text(
        //           'Name',
        //           style: TextStyle(
        //             fontSize: 24,
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        actions: [
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
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          print('$count++');


          
          // if(index % 2 == 0)
          if(index%3 == 0 || index%4 == 0)
          {
            if(_lastMsgIsRecieved){
              _topMarginofTile = 10;
            }else{
              _topMarginofTile = 2;
            }
            _lastMsgIsRecieved = false;
            return SentMessageTile(themeColor2);
          }
          else{
            if(_lastMsgIsRecieved){
              _topMarginofTile = 2;
            }else{
              _topMarginofTile = 10;
            }
            _lastMsgIsRecieved = true;
            return RecievedMessageTile(themeColor1);
          }
          // return (index % 3 == 0)
          //     ? SentMessageTile(themeColor2)
          //     : RecievedMessageTile(themeColor1);
          
          // return SentMessageTile(themeColor2);
          // return RecievedMessageTile(themeColor1);

        },

      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            // height: 50,
            width: MediaQuery.of(context).size.width * 0.8,
            margin: EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              color: appbarColor,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  // spreadRadius: 0,
                  blurRadius: 3,
                  offset: Offset(4, 4),
                )
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  // borderRadius: BorderRadius.circular(30),
                ),
                prefixIconColor: themeColor2,
                suffixIconColor: themeColor2,
                prefixIcon: GestureDetector(
                  child: Icon(Icons.emoji_emotions_rounded),
                  onTap: () {
                    Fluttertoast.showToast(msg: 'Emoji Icon Pressed');
                  },
                ),
                hintText: 'Messaage',
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.3),
                  fontSize: 20,
                ),
                suffixIcon: GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SvgPicture.asset('assets/icons/attachment.svg'),
                  ),
                  // child: Icon(),
                  onTap: () {
                    Fluttertoast.showToast(msg: 'Attachment Clicked!');
                  },
                ),
                suffixIconConstraints: BoxConstraints(
                    // maxHeight: double.infinity,
                    // maxWidth: double.infinity,
                    ),
              ),
              style: TextStyle(
                fontSize: 20,
                // height: 0,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Fluttertoast.showToast(msg: 'Sent Button Clicked');
            },
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(10),
              foregroundColor: themeColor1,
              backgroundColor: appbarColor,
            ),
            child: Icon(
              Icons.send,
              color: themeColor2, // Icon color
              size: 30, // Icon size
            ),
          ),
        ],
      ),
    );
  }

  Row SentMessageTile(Color themeColor2) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print('--------------------------------------------');
      print(" In sentTile , lastMsgIsRecieved : $_lastMsgIsRecieved");
      _lastMsgIsRecieved = false;
      print(" In sentTile , lastMsgIsRecieved : $_lastMsgIsRecieved");
    });
    // EdgeInsets messageTileMargin;
    // if (_lastMsgIsRecieved) {
    //   messageTileMargin =
    //       EdgeInsets.only(left: 80, right: 5, top: 10, bottom: 0);
    // } else {
    //   messageTileMargin =
    //       EdgeInsets.only(left: 80, right: 5, top: 2, bottom: 0);
    // }
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Container(
            // margin: messageTileMargin,

            // margin: _lastMsgIsRecieved
            //     ? EdgeInsets.only(left: 80, right: 5, top: 10, bottom: 0)
            //     : EdgeInsets.only(left: 80, right: 5, top: 2, bottom: 0),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),

            margin: EdgeInsets.only(left: 80, right: 5, top: _topMarginofTile, bottom: 0),
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: themeColor2,
            ),
            child: Text(
              'swqd a asdad asd a s',
              style: TextStyle(
                // backgroundColor: themeColor1,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ),
        )
      ],
    );
  }

  Row RecievedMessageTile(Color themeColor1) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print('----------------------------------------------------');
      print(" In RecieveTile , lastMsgIsRecieved : $_lastMsgIsRecieved");
      _lastMsgIsRecieved = true;
      print(" In RecieveTile , lastMsgIsRecieved : $_lastMsgIsRecieved");
    });
    // EdgeInsets messageTileMargin;
    // if (_lastMsgIsRecieved) {
    //   messageTileMargin =
    //       EdgeInsets.only(left: 5, right: 80, top: 2, bottom: 0);
    // } else {
    //   messageTileMargin =
    //       EdgeInsets.only(left: 5, right: 80, top: 10, bottom: 0);
    // }
    return Row(
      children: [
        Flexible(
          child: Container(
            // margin: messageTileMargin,
            // margin: _lastMsgIsRecieved
            //     ? EdgeInsets.only(left: 5, right: 80, top: 2, bottom: 0)
            //     : EdgeInsets.only(left: 5, right: 80, top: 10, bottom: 0),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            margin: EdgeInsets.only(left: 5, right: 80, top: _topMarginofTile, bottom: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: themeColor1,
            ),
            child: Text(
              'swqd a sdad asdasdsaa asdbsdsakbda dsa sda dajdald lasjdlwihaasdhasd dna sdasdaodjnas sasdasdasda',
              style: TextStyle(
                // backgroundColor: themeColor1,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
