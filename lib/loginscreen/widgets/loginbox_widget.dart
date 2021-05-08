import 'package:animated_button/animated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lotleads/core/app_colors.dart';
import 'package:lotleads/core/app_text_styles.dart';

class LoginBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Entre e administre suas Leads",
                style: AppTextStyles.heading15,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                  border: Border.fromBorderSide(
                    BorderSide(color: AppColors.borderLogin),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Email'),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                  border: Border.fromBorderSide(
                    BorderSide(color: AppColors.borderLogin),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Senha'),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            AnimatedButton(
              width: 150,
              height: 50,
              color: AppColors.borderLogin,
              child: Text(
                'Entrar',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
