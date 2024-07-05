import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'About Us',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff04658e),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Text(
              'Welcome to TripEase!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'TripEase is an application designed to facilitate tourist travel in Egypt. Our mission is to make your travel experience seamless and enjoyable, providing you with all the information and tools you need to explore Egypt with ease.',
            ),
            SizedBox(height: 20),
            Text(
              'Our Team',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Dr. Shaima Saber - Project Lead',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Dr. Shaima Saber is responsible for leading the TripEase project, overseeing its development and direction.',
            ),
            SizedBox(height: 10),
            Text(
              'Maged Metry - Team Leader',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Maged plays a crucial role in guiding the team towards achieving the project\'s goals.',
            ),
            SizedBox(height: 10),
            Text(
              'Abanoub Habib - Member',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Abanoub brings valuable insights and contributions to TripEase.',
            ),
            SizedBox(height: 10),
            Text(
              'Kerolos Wardy - Member',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Kerolos contributes to the development and implementation of TripEase.',
            ),
            SizedBox(height: 10),
            Text(
              'Yousef Ibrahim - Member',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Yousef is instrumental in ensuring the functionality and usability of TripEase.',
            ),
            SizedBox(height: 10),
            Text(
              'Virina Shawky - Member',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Virina brings creativity and innovation to the TripEase team.',
            ),
            SizedBox(height: 10),
            Text(
              'Nancy Magdy - Member',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Nancy contributes to the success of TripEase through her skills and teamwork.',
            ),
            SizedBox(height: 20),
            Text(
              'Our Commitment',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'At TripEase, we are committed to delivering a user-friendly and reliable platform for tourists visiting Egypt. We prioritize user satisfaction and safety, ensuring that our app meets the highest standards of quality and functionality.',
            ),
            SizedBox(height: 20),
            Text(
              'Contact Us',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'If you have any questions or feedback, please contact us at: Email: support@tripease.com, Address: 123 Travel Road, Cairo, Egypt.',
            ),
          ],
        ),
      ),
    );
  }
}