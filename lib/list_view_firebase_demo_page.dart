import 'dart:math';
import 'package:flutter/material.dart';
import 'add_friend.dart';
import 'friend_data.dart';
import 'friends_contact_details.dart';
import 'package:firebase_database/firebase_database.dart';

class ListViewFirebaseDemoPage extends StatefulWidget {
  const ListViewFirebaseDemoPage({Key? key}) : super(key: key);

  @override
  State<ListViewFirebaseDemoPage> createState() => _ListViewFirebaseDemoPageState();
}

class _ListViewFirebaseDemoPageState extends State<ListViewFirebaseDemoPage> {


  var friendList = [];

    _ListViewFirebaseDemoPageState() {
      //load all friends from Firebase Database and display them
      // DatabaseReference ref = FirebaseDatabase.instance.ref("Friends");
      // Stream<DatabaseEvent> stream = ref.onValue;
      // stream.listen((DatabaseEvent event) {
      //   print('Event Type: ${event.type}');
      //   print('Snapshot: ${event.snapshot}');
      //   var friendTmpList = [];
      //     final data = event.snapshot.value;
      //   friendList = ;





      FirebaseDatabase.instance.ref().child('Friends').once()
          .then((datasnapshot) {

            print("Successfully loaded data");
            print(datasnapshot);
            print("Key: ");
            print(datasnapshot.key);
            print("Value: ");
            print(datasnapshot.value);
            print("Iterating the value map: ");
            var friendTmpList = [];
            datasnapshot.value.forEach((k, v) {
              print(k);
              print(v);
              friendTmpList.add(v);
            });
            print("Final Friend List: ");
            print(friendTmpList);
            friendList = friendTmpList;
            setState(() {

            });

          })
          .catchError((error) {
          print("Failed to load data");
          print(error);
          });
    }





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
        },
      )
    );
  }
}
