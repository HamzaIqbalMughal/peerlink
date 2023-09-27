import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    Color themeColor1 =
        Color(int.parse(themeColor1CodeHexa.replaceAll('#', '0x')));
    Color themeColor2 =
        Color(int.parse(themeColor2CodeHexa.replaceAll('#', '0x')));
    Color appbarColor =
        Color(int.parse(appbarColorCodeHexa.replaceAll("#", "0x")));

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

        itemCount: 5,
        itemBuilder: (context, index){
          // return Flexible(
          //     child: Text(
          //       'Helloasda dasdasdaudan ',
          //       style: TextStyle(
          //         backgroundColor: themeColor1,
          //       ),
          //     )
          // );
          return Row(
            children: [
              Flexible(
                  child: Container(
                    // height: double.infinity,
                    // width: double.infinity,
                    color: themeColor1,
                    margin: EdgeInsets.only(left: 5,right: 50,top: 10,bottom: 5),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Text(
                      'swqd a sdad',
                      style: TextStyle(
                        // backgroundColor: themeColor1,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  )
              ),
            ],
          );
          // return Flexible(
          //       child: Container(
          //         width: null,
          //         margin: EdgeInsets.only(left: 5,right: 40,top: 10,bottom: 5),
          //         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10),
          //           color: themeColor1,
          //         ),
          //         child: Text('Hello there !'),
          //       ),
          //   );
        },
      ),
      bottomSheet: Container(
        // height: 50,
        width: MediaQuery.of(context).size.width * 0.96,
        margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          
          color: appbarColor,
          borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              // spreadRadius: 0,
              blurRadius: 3,
              offset: Offset(4,4),
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
              onTap: (){
                Fluttertoast.showToast(msg: 'Emoji Icon Pressed');
              },
            ),
            hintText: 'Messaage',
            hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.3),
              fontSize: 20,
            ),
            suffixIcon: GestureDetector(
              child: Icon(Icons.attachment),
              onTap: (){
                Fluttertoast.showToast(msg: 'Attachment Clicked!');
              },
            ),
          ),
          style: TextStyle(
            fontSize: 20,
            height: 0,
          ),
        ),
      ),
    );
  }
}
