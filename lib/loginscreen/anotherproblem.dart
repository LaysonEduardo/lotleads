import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:lotleads/core/app_colors.dart';
import 'package:lotleads/core/app_text_styles.dart';

// ignore: must_be_immutable
class AnotherProblemWidget extends StatelessWidget {
  var returnhome;
  var returnhomedialog;

  AnotherProblemWidget({required this.returnhome, this.returnhomedialog});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 350,
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
                "Precisa de Ajuda?",
                style: AppTextStyles.heading15,
              ),
            ),
            Center(
              child: Text(
                "Reporte ao o Desenvolvedor",
                style: AppTextStyles.heading,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 250,
              height: 150,
              decoration: BoxDecoration(
                border: Border.fromBorderSide(
                  BorderSide(color: AppColors.borderLogin),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Informe o problema...'),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AnimatedButton(
                  width: 130,
                  height: 40,
                  color: AppColors.borderLogin,
                  child: Text(
                    'Enviar',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: returnhomedialog,
                ),
                AnimatedButton(
                  width: 130,
                  height: 40,
                  color: AppColors.borderLogin,
                  child: Text(
                    'Cancelar',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: returnhome,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
