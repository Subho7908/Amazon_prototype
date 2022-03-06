import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl ="https://images.theconversation.com/files/430483/original/file-20211105-9897-18ahqx2.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1200&h=1200.0&fit=crop";
    return  Drawer(
      child: Container(
        color: Color.fromARGB(255, 11, 222, 250),
        child: ListView(
          children: [
            DrawerHeader(
             
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                 decoration: BoxDecoration(color: Color.fromARGB(255, 43, 230, 255)),
                margin: EdgeInsets.zero,
                accountName: Text("Amit Mondal"),
                accountEmail: Text("amit7908@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
                )
              ),

              ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                ),
                title: Text(
                  "Home",
                  textScaleFactor: 1.4,
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),

               ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white,
                ),
                title: Text(
                  "Profile",
                  textScaleFactor: 1.4,
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),

               ListTile(
                leading: Icon(
                  CupertinoIcons.mail_solid,
                  color: Colors.white,
                ),
                title: Text(
                  "Email",
                  textScaleFactor: 1.4,
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
          ],
        ),
      ),

    );
  }
}