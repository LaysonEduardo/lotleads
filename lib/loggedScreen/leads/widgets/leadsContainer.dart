import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lotleads/core/app_colors.dart';
import 'package:lotleads/core/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

// ignore: must_be_immutable
class LeadsWidget extends StatelessWidget {
  var leadName;
  var leadRegion;
  var whatsPhone;
  var docId;
  var reload;
  var userName;

  LeadsWidget(
      {required this.leadName,
      required this.leadRegion,
      required this.whatsPhone,
      required this.docId,
      required this.reload});
  @override
  Widget build(BuildContext context) {
    FirebaseAuth user = FirebaseAuth.instance;
    userName = user.currentUser!.displayName;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 80,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text.rich(
                  TextSpan(
                    text: leadName,
                    style: AppTextStyles.body,
                    children: [
                      TextSpan(
                          text: ' - ',
                          style: AppTextStyles.body11,
                          children: [
                            TextSpan(
                                text: leadRegion, style: AppTextStyles.body11)
                          ]),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    reload();
                    launchwhatsapp();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.borderLogin,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Capturar',
                            style: AppTextStyles.bodylightWhite,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  launchwhatsapp() async {
    final link = WhatsAppUnilink(
      phoneNumber: whatsPhone,
      text: 'Olá $leadName, como vai?\n'
          'Meu nome é $userName e recebi seu cadastro de interesse em nosso loteamento.\n\n'
          'Gostaria de saber qual é o seu principal interesse neste momento\n\n'
          '🟢 Lazer e Tranquilidade para sua família e amigos.\n'
          '🟢 Morar em uma área repleta de natureza e com qualidade de vida.\n'
          '🟢 Investir com segurança em um ímovel.\n',
    );
    await launch('$link');
    CollectionReference users = FirebaseFirestore.instance.collection('leads');
    users.doc(docId).update({'status': true});
  }
}
