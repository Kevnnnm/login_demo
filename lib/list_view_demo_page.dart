import 'dart:math';

import 'package:flutter/material.dart';
import 'add_friend.dart';
import 'friend_data.dart';
import 'friends_contact_details.dart';

class ListViewDemoPage extends StatefulWidget {
  const ListViewDemoPage({Key? key}) : super(key: key);

  @override
  State<ListViewDemoPage> createState() => _ListViewDemoPageState();
}

class _ListViewDemoPageState extends State<ListViewDemoPage> {

  final List<String> entries = <String>[
    'Alice', 'Ben', 'Thomas', 'Zach', 'John', 'Kate', 'Frank', 'George', 'Emily'
  ];
  final List<String> phones = <String>[
    '949-143-4267', '949-125-4568', '949-328-3561', '949-623-0567', '949-103-4447', '949-333-4562', '949-763-2167', '949-573-4527', '949-121-4217'
  ];

  var friendList = [
    {
      'name' : 'Alice',
      'phone' : '949-143-4267',
      'imageURL' : 'https://www.clipartmax.com/png/middle/162-1623921_stewardess-510x510-user-profile-icon-png.png',
      'type' : 'HOME',
    },
    {
      'name' : 'Ben',
      'phone' : '949-125-4568',
      'imageURL' : 'https://www.pinclipart.com/picdir/middle/355-3553881_stockvader-predicted-adig-user-profile-icon-png-clipart.png',
      'type' : 'WORK',
    },
    {
      'name' : 'Thomas',
      'phone' : '949-328-3561',
      'imageURL' : 'https://p8cdn4static.sharpschool.com/UserFiles/Servers/Server_416292/Image/Profile%20pic.png',
      'type' : 'CELL',
    },
    {
      'name' : 'Zach',
      'phone' : '949-623-0567',
      'imageURL' : 'https://w7.pngwing.com/pngs/481/915/png-transparent-computer-icons-user-avatar-woman-avatar-computer-business-conversation-thumbnail.png',
      'type' : 'CELL',
    },
  ];

  List<Friend> friends = <Friend> [];

  _ListViewDemoPageState() {
    Friend f1 = Friend('Alice', '949-143-4267', 'https://www.clipartmax.com/png/middle/162-1623921_stewardess-510x510-user-profile-icon-png.png', 'HOME');
    Friend f2 = Friend('Ben', '949-125-4568', 'https://www.pinclipart.com/picdir/middle/355-3553881_stockvader-predicted-adig-user-profile-icon-png-clipart.png', 'WORK');
    Friend f3 = Friend('Thomas', '949-328-3561', 'https://p8cdn4static.sharpschool.com/UserFiles/Servers/Server_416292/Image/Profile%20pic.png', 'CELL');
    Friend f4 = Friend('Zach', '949-623-0567', 'https://w7.pngwing.com/pngs/481/915/png-transparent-computer-icons-user-avatar-woman-avatar-computer-business-conversation-thumbnail.png', 'CELL');
    friends = [f1, f2, f3, f4];
  }
  //final List<int> colorCodes = <int>[600, 500, 100]

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: friendList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FriendsContactDetails(friendList[index])),
              );
            },
            title: Container(
              height: 50,
              //color: Colors.amber,
              margin: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
              child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage('${friendList[index]['imageURL']}'),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            '${friendList[index]['name']}',
                                style: TextStyle(
                                fontWeight: FontWeight.bold
            )
                        ),
                        Text(
                          '${friendList[index]['phone']}',
                        ),
                      ]
                    ),
                    Spacer(),
                    Text(
                        '${friendList[index]['type']}'
                    )
                  ],
              ),
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddFriendPage()),
          );
          // var rng = Random();
          // var friend = {
          //   'name' : entries[rng.nextInt(entries.length)],
          //   'phone' : phones[rng.nextInt(phones.length)],
          //   'imageURL' : 'https://www.clipartmax.com/png/middle/162-1623921_stewardess-510x510-user-profile-icon-png.png',
          //   'type' : 'HOME',
          // };
          // friendList.add(friend);
          // setState(() {

          // }
          // )
        },
      )
    );
  }
}
