import 'package:flutter/material.dart';

class FriendsContactDetails extends StatefulWidget {

  var contactDetails;
  FriendsContactDetails(this.contactDetails);

  @override
  State<FriendsContactDetails> createState() => _FriendsContactDetailsState();
}

class _FriendsContactDetailsState extends State<FriendsContactDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('${widget.contactDetails['name']}'),
          Text('${widget.contactDetails['phone']}'),
          Text('${widget.contactDetails['imageURL']}'),
          Text('${widget.contactDetails['type']}'),
        ]
      )
    );
  }
}
