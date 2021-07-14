import 'package:CWCFlutter/controller/user_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => Card(
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: ${context.watch<UserNotifier>().userList[index].name}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'City: ${context.watch<UserNotifier>().userList[index].city}',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => context.read<UserNotifier>().deleteUser(index),
              ),
            ],
          ),
        ),
      ),
      //rebuilding user list and adding user to the list
      itemCount: context.watch<UserNotifier>().userList.length,
    );
  }
}
