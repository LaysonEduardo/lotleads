import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:lotleads/core/app_colors.dart';

class LoggedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedButton(
              width: 150,
              height: 50,
              color: AppColors.borderLogin,
              child: Text(
                'Sair',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
