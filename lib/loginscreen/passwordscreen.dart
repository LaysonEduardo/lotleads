import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lotleads/core/app_colors.dart';
import 'package:lotleads/core/app_text_styles.dart';
import 'package:ndialog/ndialog.dart';

// ignore: must_be_immutable
class PasswordRecoverScreen extends StatefulWidget {
  var returnhome;
  PasswordRecoverScreen({required this.returnhome});

  @override
  _PasswordRecoverScreenState createState() => _PasswordRecoverScreenState();
}

class _PasswordRecoverScreenState extends State<PasswordRecoverScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailrecoveryController = TextEditingController();

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
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Esqueceu a sua senha?",
                  style: AppTextStyles.heading15,
                ),
              ),
              Center(
                child: Text(
                  "Recupere já",
                  style: AppTextStyles.heading,
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
                    child: TextFormField(
                      controller: emailrecoveryController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email cadastrado'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: passwordrecovery,
                    child: Ink(
                      width: 130,
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.borderLogin,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ]),
                        child: Center(
                          child: Text(
                            'Recuperar Senha',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: widget.returnhome,
                    child: Ink(
                      width: 130,
                      height: 40,
                      color: AppColors.borderLogin,
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.borderLogin,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ]),
                        child: Center(
                          child: Text(
                            'Cancelar',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  passwordrecovery() async {
    if (emailrecoveryController.text == '') {
      NDialog(
        dialogStyle: DialogStyle(titleDivider: true),
        title: Text(
          "Erro de Preenchimento",
          style: AppTextStyles.heading15,
        ),
        content: Text(
          "O Campo de email está vazio",
          style: AppTextStyles.heading,
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: InkWell(
                onTap: dialogDismiss,
                child: Ink(
                  width: 150,
                  height: 50,
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.borderLogin,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ]),
                    child: Center(
                      child: Text(
                        'Ok',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ).show(context);
    } else {
      firebaseAuth
          .sendPasswordResetEmail(email: emailrecoveryController.text)
          .then((recover) {
        NDialog(
          dialogStyle: DialogStyle(titleDivider: true),
          title: Text(
            "Email Encaminhado",
            style: AppTextStyles.heading15,
          ),
          content: Text(
            "Verifique seu email e siga os passos indicados para efetuar a troca de sua senha.",
            style: AppTextStyles.heading,
          ),
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: InkWell(
                  onTap: dialogDismiss,
                  child: Ink(
                    width: 150,
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.borderLogin,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ]),
                      child: Center(
                        child: Text(
                          'Ok',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ).show(context);
      }).catchError((err) {
        if (err.code == 'invalid-email') {
          NDialog(
            dialogStyle: DialogStyle(titleDivider: true),
            title: Text(
              "Erro",
              style: AppTextStyles.heading15,
            ),
            content: Text(
              'Este endereço de email não existe.',
              style: AppTextStyles.heading,
            ),
            actions: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: InkWell(
                    onTap: dialogDismiss,
                    child: Ink(
                      width: 150,
                      height: 50,
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.borderLogin,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ]),
                        child: Center(
                          child: Text(
                            'Ok',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ).show(context);
        } else if (err.code == 'user-not-found') {
          NDialog(
            dialogStyle: DialogStyle(titleDivider: true),
            title: Text(
              "Erro",
              style: AppTextStyles.heading15,
            ),
            content: Text(
              'Endereço de Email não cadastrado.',
              style: AppTextStyles.heading,
            ),
            actions: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: InkWell(
                    onTap: dialogDismiss,
                    child: Ink(
                      width: 150,
                      height: 50,
                      color: AppColors.borderLogin,
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.borderLogin,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ]),
                        child: Center(
                          child: Text(
                            'Ok',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ).show(context);
        }
      });
    }
  }

  dialogDismiss() {
    Navigator.of(context, rootNavigator: true).pop('dialog');
  }
}
