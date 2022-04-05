import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'list_view_firebase_demo_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddFriendPage extends StatefulWidget {
  const AddFriendPage({Key? key}) : super(key: key);

  @override
  State<AddFriendPage> createState() => _AddFriendPageState();
}

class _AddFriendPageState extends State<AddFriendPage> {

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                controller: nameController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                )
            ),
            TextField(
                controller: phoneController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone',
                )
            ),
            TextField(
                controller: typeController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Type',
                )
            ),
            ElevatedButton(
              child: Text(
                'Add Friend'
              ),
              onPressed: () {
                setState(() {

                });
                print(nameController.text);
                print(phoneController.text);
                print(typeController.text);

                var timestamp = new DateTime.now().millisecondsSinceEpoch;
                FirebaseFirestore.instance.collection("Friends" + timestamp.toString()).add(
                  {
                    'Name' : nameController.text,
                    "Phone Number" : phoneController.text,
                    'Type' : typeController.text,
                    'ImageURL' : 'https://www.clipartmax.com/png/middle/162-1623921_stewardess-510x510-user-profile-icon-png.png'
                  }
                ).then((value) {
                  print('Successfully added friend');
                }).catchError((error) {
                  print('Failed to add.' + error.toString());
                });
              },
            )
          ]
        )
      )
    );
  }
}
