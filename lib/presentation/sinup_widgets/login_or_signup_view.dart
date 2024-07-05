import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/assets_manager.dart';

class LoginOrSignUpPage extends StatelessWidget {
  const LoginOrSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffEFEFEF),
      body: Column(
        children: [
          Spacer(flex: 2),
          _AppLogoAndHeadline(),
          Spacer(),
          _Footer(),
          Spacer(),
        ],
      ),
    );
  }
}

// social icon buttons
class _Footer extends StatelessWidget {
  const _Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 55,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff04658E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      8), // Adjust the radius value as needed
                ),
              ),
              onPressed: () => Navigator.pushNamed(context, '/Login'),
              child: const Padding(
                padding: EdgeInsets.all(2.0),
                child: Text(
                  'Login With Email',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'OR',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  fontFamily: 'myfont',
                ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xff273b7a), width: 2),
                      //borderRadius: BorderRadius.circular(80)
                      shape: BoxShape.circle),
                  child: SvgPicture.asset(
                    'assets/SVG/google50.svg',
                    //color: Color(0xffdd4b39),
                  ),
                ),
                iconSize: 50,
              ),
              IconButton(
                onPressed: () {},
                icon: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xff513da8), width: 2),
                      shape: BoxShape.circle),
                  child: SvgPicture.asset(
                    'assets/SVG/instagram50.svg', //color: Colors.black,
                  ),
                ),
                iconSize: 50,
              ),
              IconButton(
                onPressed: () {},
                icon: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xff000000), width: 2),
                      shape: BoxShape.circle),
                  child: SvgPicture.asset(
                    'assets/SVG/twitter50.svg',
                    //color: Colors.black,
                  ),
                ),
                //SvgPicture.asset(AppIcons.facebookIcon),
                iconSize: 40,
              ),
              IconButton(
                onPressed: () {},
                icon: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xff4a7aff), width: 2),
                      shape: BoxShape.circle),
                  child: SvgPicture.asset(
                    'assets/SVG/facebook50.svg',
                  ),
                ),
                //SvgPicture.asset(AppIcons.facebookIcon),
                iconSize: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AppLogoAndHeadline extends StatelessWidget {
  const _AppLogoAndHeadline({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: AspectRatio(
            aspectRatio: 1 / 1,
            // child: Image.asset('assets/images/key1.gif'),
            // child: ColorFiltered(
            //   colorFilter: ColorFilter.mode(const Color(0xffefefef),
            //       BlendMode.colorBurn), // Change the background color here
            //   child: Image.asset('assets/images/key1.gif'),
            // ),
            child: ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Color(0xffefefef), // Set the desired background color here
                BlendMode.darken,
              ),
              child: Image.asset(ImageAssets.keyImg),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Welcome to our',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                //color: Colors.blue,
              ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'TripEase',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: "Myfont",
                fontSize: 35,
                color: const Color(0xff04658E),
              ),
        )
      ],
    );
  }
}
