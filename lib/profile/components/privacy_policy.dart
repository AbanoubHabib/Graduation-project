import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privacy Policy',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff04658e),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Text(
              'Introduction',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Welcome to TripEase! We value your privacy and are committed to protecting your personal information. This Privacy Policy outlines how we collect, use, and safeguard your data when you use our app to facilitate your travel in Egypt.',
            ),
            SizedBox(height: 20),
            Text(
              'Information We Collect',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Personal Information: When you register or use our app, we may collect the following personal information: Name, Email address, Phone number, Travel preferences.',
            ),
            SizedBox(height: 10),
            Text(
              'Usage Data: We automatically collect information about how you interact with our app, including: Device type and operating system, IP address, App usage data (e.g., features used, time spent on the app), Crash reports and performance data.',
            ),
            SizedBox(height: 20),
            Text(
              'How We Use Your Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'We use your information to: Provide and improve our services, Personalize your experience, Communicate with you about updates, promotions, and news, Analyze usage patterns to improve app performance, Ensure the security of our app and users.',
            ),
            SizedBox(height: 20),
            Text(
              'Data Sharing and Disclosure',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'We do not sell, trade, or otherwise transfer your personal information to outside parties except in the following circumstances: With your consent, To comply with legal obligations, To protect and defend our rights and property, With service providers who assist us in operating our app (e.g., analytics providers).',
            ),
            SizedBox(height: 20),
            Text(
              'Data Security',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'We implement a variety of security measures to protect your personal information. However, no method of transmission over the Internet or electronic storage is completely secure. While we strive to use commercially acceptable means to protect your data, we cannot guarantee its absolute security.',
            ),
            SizedBox(height: 20),
            Text(
              'Your Rights',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'You have the right to: Access and review your personal data, Request corrections to any inaccurate or incomplete information, Request the deletion of your personal data, subject to certain exceptions, Opt-out of receiving marketing communications from us.',
            ),
            SizedBox(height: 20),
            Text(
              'Changes to This Privacy Policy',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'We may update our Privacy Policy from time to time. Any changes will be posted on this page, and we will notify you through the app or via email. We encourage you to review this policy periodically for any updates.',
            ),
            SizedBox(height: 20),
            Text(
              'Contact Us',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'If you have any questions or concerns about this Privacy Policy, please contact us at: Email: support@tripease.com, Address: 123 Travel Road, Cairo, Egypt.',
            ),
          ],
        ),
      ),
    );
  }
}