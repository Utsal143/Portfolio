import 'package:flutter/material.dart';
import 'package:myportfolioapp/Const/coolers.dart';
import 'package:myportfolioapp/Widgets/headerScreen.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Coolers.primaryColor,
      child: VStack([HeaderScreen()]).scrollVertical(),
    );
  }
}
