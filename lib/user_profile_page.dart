import 'package:flutter/material.dart';
import 'list_view_demo_page.dart';
import 'list_view_firebase_demo_page.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: Row(
              children: [
                Expanded(
                  flex: 20,
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    color: Colors.purple,
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  flex: 60,
                  child: Container(
                    height: 35,
                    child: Image(
                      image: NetworkImage('https://blog.hootsuite.com/wp-content/uploads/2021/05/all-apps-5.png'),
                    ),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.purple,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListViewFirebaseDemoPage()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 65,
            child: Column(
              children: [
                Expanded(
                  flex: 70,
                  child: Image(
                    image: NetworkImage('https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80'),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Container(
                    margin: EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      children: [
                        Text(
                            'Bobby, Los Angeles',
                                style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent
                    )
                        ),
                        Spacer(),
                        Text(
                            '949-123-4567',
                                style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent
                        )),
                        IconButton(
                          icon: Icon(Icons.check),
                              color: Colors.blue,
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 50,
                          child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 30),
                                  child: IconButton(
                                      icon: Icon(
                                          Icons.contacts,
                                          size: 40,
                                          color: Colors.blueAccent
                                      ),
                                      onPressed: () {},
                                  ),
                                )
                              ],
                          ),
                      ),
                      Expanded(
                        flex: 50,
                        child: Container(
                          margin: EdgeInsets.only(left: 30, right: 30),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 30),
                                child: IconButton(
                                  icon: Icon(
                                      Icons.more,
                                      size: 40,
                                      color: Colors.blueAccent
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 25,
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Emoji_u1f44b.svg/480px-Emoji_u1f44b.svg.png'),
                    iconSize: 50,
                    color: Colors.orangeAccent,
                    onPressed: () {},
                  ),
                  Spacer(),
                  IconButton(
                    icon: Image.network('https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-image-512.png'),
                    iconSize: 50,
                    onPressed: () {},
                  ),
                  Spacer(),
                  IconButton(
                    icon: Image.network('https://cdn3.iconfinder.com/data/icons/google-material-design-icons/48/ic_add_48px-512.png'),
                    iconSize: 50,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
