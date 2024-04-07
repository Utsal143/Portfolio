import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myportfolioapp/Const/coolers.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:velocity_x/velocity_x.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: VxBox(
          child: VStack([
        ZStack([
          PictureWidget(),
          Row(
            children: [
              VStack([
                CustomAppBar().shimmer(primaryColor: Coolers.accentColor),
                70.heightBox,
                Text(
                  "Utsal K.\nTamrakar",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ).shimmer(),
                20.heightBox,
                VxBox()
                    .color(Coolers.accentColor)
                    .size(60, 10)
                    .make()
                    .shimmer(primaryColor: Coolers.accentColor),
                20.heightBox,
                SocialAccounts(),
                30.heightBox,
                AboutMe(),
                20.heightBox,
                MyProjects()
              ])
            ],
          )
        ]),
      ])).make(),
    );
  }
}

class PictureWidget extends StatelessWidget {
  const PictureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(pi),
      child: Image.asset(
        "assets/utsal.png",
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Icon(
        Icons.terminal,
        size: 50,
      ),
    );
  }
}

class SocialAccounts extends StatelessWidget {
  const SocialAccounts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildSocialIcon(
            icon: FontAwesomeIcons.facebook,
            onTap: () {
              // Handle Facebook icon tap
              const facebookUrl =
                  'https://www.facebook.com/profile.php?id=100076712525557';
              launchUrlString(facebookUrl);
              print('Facebook tapped!');
            },
          ),
          _buildSocialIcon(
            icon: FontAwesomeIcons.instagram,
            onTap: () {
              // Handle Instagram icon tap
              const instaUrl = 'https://www.instagram.com/negativex_creep/';
              launchUrlString(instaUrl);
              print('Instagram tapped!');
            },
          ),
          _buildSocialIcon(
            icon: FontAwesomeIcons.twitter,
            onTap: () {
              // Handle Twitter icon tap
              const twitterUrl = 'https://x.com/UtsalTamrakar?s=09';
              launchUrlString(twitterUrl);

              print('Twitter tapped!');
            },
          ),
          _buildSocialIcon(
            icon: FontAwesomeIcons.linkedin,
            onTap: () {
              // Handle LinkedIn icon tap
              const linkedinUrl =
                  'https://www.linkedin.com/in/utsal-tamrakar-830023279/';
              launchUrlString(linkedinUrl);
              print('LinkedIn tapped!');
            },
          ),
          _buildSocialIcon(
            icon: FontAwesomeIcons.github,
            onTap: () {
              // Handle GitHub icon tap
              const gitHubUrl = 'https://github.com/Utsal143';
              launchUrlString(gitHubUrl);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(
      {required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        size: 35,
        color: Colors.white,
      ).shimmer(),
    );
  }
}

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Coolers.secondaryColor,
      shadowColor: Colors.black,
      elevation: 10,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.89,
        child: Column(
          children: [
            10.heightBox,
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Center(
                child: Text(
                  'About me:',
                  style: TextStyle(color: Colors.grey[300], fontSize: 15),
                ),
              ),
            ),
            Divider(
              indent: 100,
              endIndent: 100,
            ),
            5.heightBox,
            Padding(
                padding: const EdgeInsets.all(9.0),
                child: Text(
                  "Enthusiastic mobile developer skilled in Flutter and Firebase, blending a passion for UI/UX design with a flair for teamwork. A lively and extroverted individual, I'm equally devoted to music—singing and playing the guitar. Proactive researcher committed to staying ahead in the dynamic world of mobile development. Eager to contribute creativity, collaboration, and continuous learning to your team.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.grey[300]),
                ))
          ],
        ),
      ),
    );
  }
}

class MyProjects extends StatelessWidget {
  const MyProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.89,
      child: Card(
        margin: EdgeInsets.only(left: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Coolers.secondaryColor,
        shadowColor: Colors.black,
        elevation: 10,
        child: Column(
          children: [
            10.heightBox,
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Center(
                child: Text(
                  'My Projects:',
                  style: TextStyle(color: Colors.grey[300], fontSize: 15),
                ),
              ),
            ),
            Divider(
              indent: 100,
              endIndent: 100,
            ),
            5.heightBox,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: VxSwiper(
                  height: 200,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayAnimationDuration: 1.seconds,
                  autoPlayCurve: Curves.linear,
                  scrollDirection: Axis.horizontal,
                  items: [
                    _buildProjectCard(
                      projectName: 'Meno Pal',
                      context: context,
                      onTap: () {
                        const menoPalURL =
                            'https://github.com/Utsal143/MenoPal.git';
                        launchUrlString(menoPalURL);
                      },
                    ),
                    _buildProjectCard(
                      projectName: 'Science Friction',
                      context: context,
                      onTap: () {
                        const naoCoinURL =
                            'https://github.com/Utsal143/Science-Friction.git';
                        launchUrlString(naoCoinURL);
                      },
                    ),
                    _buildProjectCard(
                      projectName: 'NAO Coin',
                      context: context,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectCard(
      {required String projectName,
      required BuildContext context,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Coolers.accentColor,
        child: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Text(
            projectName,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
