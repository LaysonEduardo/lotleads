import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:lotleads/core/app_colors.dart';
import 'package:lotleads/core/app_gradients.dart';
import 'package:lotleads/core/app_text_styles.dart';

// ignore: must_be_immutable
class BottomBarWidget extends StatelessWidget {
  var functionHelper;
  var passwordrecover;
  BottomBarWidget({required this.functionHelper, this.passwordrecover});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      child: Container(
        height: 162,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.maxFinite,
        decoration: BoxDecoration(
            gradient: AppGradients.linear,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: AppColors.borderLogin.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Precisa de ajuda?",
              style: AppTextStyles.title,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AnimatedButton(
                    width: 150,
                    height: 50,
                    color: AppColors.white,
                    child: Text(
                      'Esqueci a senha',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.borderLogin,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: passwordrecover,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
