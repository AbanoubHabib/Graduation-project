import '../cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class ChatScreen extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return Center(child: Text('Please login first'));
    }

    // Fetch the user's name from Firestore
    Future<String> getUserName() async {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      return userDoc['name'];
    }

    return FutureBuilder<String>(
      future: getUserName(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        String userName = snapshot.data!;

        return BlocProvider(
          create: (context) =>
              ChatCubit(FirebaseFirestore.instance)..fetchMessages(),
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text('Chat Room',style: TextStyle(color: Colors.white,),),
              backgroundColor: const Color(0xff04658e),
            ),
            body: FadeInUp(
              delay: const Duration(milliseconds: 600),
              child: Column(
                children: [
                  Expanded(
                    child: BlocBuilder<ChatCubit, ChatState>(
                      builder: (context, state) {
                        if (state.loading) {
                          return Center(child: CircularProgressIndicator());
                        }
              
                        return ListView.builder(
                          itemCount: state.messages.length,
                          itemBuilder: (context, index) {
                            final message = state.messages[index];
                            final isCurrentUser = message['userId'] == user.uid;
              
                            return Align(
                              alignment: isCurrentUser
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (!isCurrentUser)
                                      CircleAvatar(
                                        child: Text(
                                          message['userName'][0],
                                          // Display the first letter of the user's name
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        backgroundColor: const Color(0xff04658e),
                                      ),
                                    if (!isCurrentUser) SizedBox(width: 10),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (!isCurrentUser)
                                            Text(
                                              message['userName'],
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: const Color(0xff04658e),
                                              ),
                                            ),
                                          SizedBox(height: 4),
                                          Container(
                                            padding: EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              color: isCurrentUser
                                                  ? Colors.grey.shade400
                                                  :const Color(0xff04658e),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Text(
                                              message['message'],
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: isCurrentUser
                                                    ? Colors.black
                                                    : Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (isCurrentUser) SizedBox(width: 10),
                                    if (isCurrentUser)
                                      CircleAvatar(
                                        child: Text(
                                          message['userName'][0],
                                          // Display the first letter of the user's name
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        backgroundColor: Colors.grey.shade600,
                                      ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _messageController,
                            decoration: InputDecoration(
                              labelText: 'Enter Message...',
                              labelStyle: TextStyle(color:Colors.black87),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromARGB(255, 0, 140, 255),),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromARGB(255, 0, 140, 255),),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        IconButton(
                          icon: Icon(Icons.send, color: Color.fromARGB(255, 0, 140, 255),),
                          onPressed: () {
                            if (_messageController.text.isNotEmpty) {
                              context.read<ChatCubit>().sendMessage(
                                  user.uid, userName, _messageController.text);
                              _messageController.clear();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
