import 'profile_header_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        
        Container(
          height: MediaQuery.of(context).size.height * 25 / 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            image: DecorationImage(
              image: AssetImage(
                'assets/images/cover6.jpg',
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),

        Column(
          children: [const _UserData(), const ProfileHeaderOptions()],
        ),
      ],
    );
  }
}

class _UserData extends StatefulWidget {
  const _UserData({Key? key}) : super(key: key);

  @override
  State<_UserData> createState() => _UserDataState();
}

class _UserDataState extends State<_UserData> {
  String userName = '';
  String userEmail = '';
  String userImage = 'assets/images/user.jpg';

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (userDoc.exists) {
        setState(() {
          userName = userDoc['name'];
          userEmail = userDoc['email'];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 19 / 100,
      ),
      child: Row(
        children: [
          SizedBox(width: MediaQuery.of(context).size.width * 3 / 100),
          SizedBox(
            width: 100,
            height: 100,
            child: ClipOval(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image(image: AssetImage(userImage)),
              ),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 3 / 100),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 8),
              Text(
                userEmail,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.black87),
              ),
            ],
          )
        ],
      ),
    );
  }
}
