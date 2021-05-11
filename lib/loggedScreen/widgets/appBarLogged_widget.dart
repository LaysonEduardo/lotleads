import 'package:flutter/material.dart';
import 'package:lotleads/core/app_colors.dart';
import 'package:lotleads/core/app_gradients.dart';
import 'package:lotleads/core/app_text_styles.dart';

// ignore: must_be_immutable
class AppbarLoggedWidget extends PreferredSize {
  var username;
  var subtitle;
  var teste;

  AppbarLoggedWidget({required this.username, required this.subtitle})
      : super(
          preferredSize: Size.fromHeight(143),
          child: Stack(
            children: [
              Container(
                height: 115,
                width: double.maxFinite,
                decoration: BoxDecoration(gradient: AppGradients.linear),
                child: SizedBox(
                  height: 10,
                ),
              ),
              Align(
                alignment: Alignment(0, 0),
                child: SafeArea(
                  child: Container(
                    height: 100,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text.rich(
                          TextSpan(
                              text: "Olá, ",
                              style: AppTextStyles.title2,
                              children: [
                                TextSpan(
                                  text: username,
                                  style: AppTextStyles.title3,
                                )
                              ]),
                        ),
                        Text(
                          subtitle,
                          style: AppTextStyles.body,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
}
