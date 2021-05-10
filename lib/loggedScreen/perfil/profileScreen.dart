import 'package:animated_button/animated_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lotleads/core/app_colors.dart';
import 'package:lotleads/loginscreen/loginscreen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedButton(
          width: 150,
          height: 50,
          color: AppColors.borderLogin,
          child: Text(
            'Perfil',
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: () {},
        ),
        AnimatedButton(
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
          onPressed: () {
            FirebaseAuth auth = FirebaseAuth.instance;
            auth.signOut().then(
              (res) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (Route<dynamic> route) => false);
              },
            );
          },
        ),
      ],
    );
  }
}
