import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lotleads/core/app_colors.dart';
import 'package:lotleads/core/app_text_styles.dart';
import 'package:lotleads/loggedScreen/loggedScreen.dart';
import 'package:ndialog/ndialog.dart';

// ignore: must_be_immutable
class LoginBox extends StatefulWidget {
  @override
  _LoginBoxState createState() => _LoginBoxState();
}

class _LoginBoxState extends State<LoginBox> {
  final _formKey = GlobalKey<FormState>();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                  "Entre e administre suas Leads 😄",
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
                    child: TextFormField(
                      controller: emailController,
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
                    child: TextFormField(
                      controller: passwordController,
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
              InkWell(
                onTap: fblogin,
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
                        'Entrar',
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
          ),
        ),
      ),
    );
  }

  fblogin() {
    if (emailController.text == '' || passwordController.text == '') {
      NDialog(
        dialogStyle: DialogStyle(titleDivider: true),
        title: Text(
          "Erro",
          style: AppTextStyles.heading15,
        ),
        content: Text(
          'Um ou mais campos obrigatórios estão vazios.',
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
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((result) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoggedScreen()),
        );
      }).catchError((err) {
        if (err.code == 'wrong-password') {
          NDialog(
            dialogStyle: DialogStyle(titleDivider: true),
            title: Text(
              "Erro",
              style: AppTextStyles.heading15,
            ),
            content: Text(
              'O email ou a senha estão incorretos.',
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
              'Endereço de email não cadastrado.',
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
        } else if (err.code == 'invalid-email') {
          NDialog(
            dialogStyle: DialogStyle(titleDivider: true),
            title: Text(
              "Erro",
              style: AppTextStyles.heading15,
            ),
            content: Text(
              'Email não existente.',
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
        }
      });
    }
  }

  dialogDismiss() {
    Navigator.of(context, rootNavigator: true).pop('dialog');
  }
}
