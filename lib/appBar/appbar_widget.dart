import 'package:flutter/cupertino.dart';
import 'package:lotleads/core/app_colors.dart';

import 'package:lotleads/core/app_gradients.dart';
import 'package:lotleads/core/app_text_styles.dart';

class AppbarWidget extends PreferredSize {
  AppbarWidget()
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 150,
            child: Container(
              height: 162,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  gradient: AppGradients.linear,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.borderLogin.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Bem vindo ao LotLeads!",
                      style: AppTextStyles.title,
                    ),
                    Text(
                      "Faça login para prosseguir",
                      style: AppTextStyles.bodylightGrey,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
}
