import 'dart:math';
import 'package:flutter/material.dart';
import 'add_friend.dart';
import 'friend_data.dart';
import 'friends_contact_details.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListViewFirebaseDemoPage extends StatefulWidget {
  const ListViewFirebaseDemoPage({Key? key}) : super(key: key);

  @override
  State<ListViewFirebaseDemoPage> createState() => _ListViewFirebaseDemoPageState();
}

class _ListViewFirebaseDemoPageState extends State<ListViewFirebaseDemoPage> {


  var friendList = [];

    void loadall() {
      FirebaseFirestore.instance.collection("Friends").get()
          .then((querySnapshot) {
        print("Successfully load all the students");
        // print(querySnapshot);
        querySnapshot.docs.forEach((element) {
          print(element.data()['Name']);
          print(element.data()['Phone Number']);
          print(element.data()['TYPE']);
          friendList.add(element.data()['Name'] + element.data()['Phone Number'] + element.data()['TYPE']);
        });
        setState(() {

        });
      }).catchError((error) {
        print("Failed to load all the students.");
        print(error);
      });
    }

    //   FirebaseDatabase.instance.ref().child('Friends').once()
    //       .then((datasnapshot) {
    //
    //         print("Successfully loaded data");
    //         print(datasnapshot);
    //         print("Key: ");
    //         print(datasnapshot.snapshot.key);
    //         print("Value: ");
    //         print(datasnapshot.snapshot.value);
    //         print("Iterating the value map: ");
    //         var friendTmpList = [];
    //         datasnapshot.snapshot.value!;
    //         .forEach((k, v) {
    //           print(k);
    //           print(v);
    //           friendTmpList.add(v);
    //         });
    //         print("Final Friend List: ");
    //         print(friendTmpList);
    //         friendList = friendTmpList;
    //         setState(() {
    //
    //         });
    //
    //       })
    //       .catchError((error) {
    //       print("Failed to load data");
    //       print(error);
    //       });
    // }



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
                            '${friendList[index]['Name']}',
                                style: TextStyle(
                                fontWeight: FontWeight.bold
            )
                        ),
                        Text(
                          '${friendList[index]['Phone Number']}',
                        ),
                      ]
                    ),
                    Spacer(),
                    Text(
                        '${friendList[index]['TYPE']}'
                    ),
                  ],
              ),
            ),
          );
        }
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          loadall();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddFriendPage()),
          );
        },
      ),
    );
  }
}
