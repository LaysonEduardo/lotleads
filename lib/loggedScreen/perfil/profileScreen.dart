import 'package:animated_button/animated_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lotleads/core/app_colors.dart';
import 'package:lotleads/core/app_text_styles.dart';
import 'package:lotleads/loginscreen/loginscreen.dart';
import 'package:ndialog/ndialog.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  var username;
  var usermail;
  var signature;
  ProfileScreen(
      {required this.username,
      required this.usermail,
      required this.signature});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController namecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Text(
                    '- Dados Cadastrados - ',
                    style: AppTextStyles.heading15,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.username,
                    style: AppTextStyles.body20,
                  ),
                  Text(
                    widget.usermail,
                    style: AppTextStyles.body11,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '- Status da Assinatura -',
                    style: AppTextStyles.heading15,
                  ),
                  Text(
                    widget.signature,
                    style: AppTextStyles.body20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AnimatedButton(
                        width: 150,
                        height: 50,
                        color: AppColors.borderLogin,
                        child: Text(
                          'Atualizar Dados',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onPressed: updateprofile,
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
                        onPressed: logoutfunction,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  updateprofile() {
    NDialog(
      dialogStyle: DialogStyle(titleDivider: true),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Atualizar Dados",
            style: AppTextStyles.heading15,
          ),
        ],
      ),
      content: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: 250,
              height: 50,
              decoration: BoxDecoration(
                border: Border.fromBorderSide(
                  BorderSide(color: AppColors.borderLogin),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: namecontroller,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Nome'),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AnimatedButton(
                width: 120,
                height: 50,
                color: AppColors.borderLogin,
                child: Text(
                  'Salvar',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: saveName,
              ),
              AnimatedButton(
                width: 120,
                height: 50,
                color: AppColors.borderLogin,
                child: Text(
                  'Cancelar',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: dialogDismiss,
              )
            ],
          ),
        ),
      ],
    ).show(context);
  }

  dialogDismiss() {
    Navigator.of(context, rootNavigator: true).pop('dialog');
  }

  saveName() async {
    if (namecontroller.text == '') {
      NDialog(
        dialogStyle: DialogStyle(titleDivider: true),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Erro - Campo nome esta vazio",
              style: AppTextStyles.heading15,
            ),
          ],
        ),
        content: Text(
          'Você sabe que o nome não pode ficar vazio né?',
          style: AppTextStyles.body,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AnimatedButton(
                  width: 120,
                  height: 50,
                  color: AppColors.borderLogin,
                  child: Text(
                    'Ok',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: dialogDismiss,
                )
              ],
            ),
          ),
        ],
      ).show(context);
    } else {
      try {
        await FirebaseAuth.instance.currentUser!
            .updateProfile(displayName: namecontroller.text);
        NDialog(
          dialogStyle: DialogStyle(titleDivider: true),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Nome de usuário atualizado!",
                style: AppTextStyles.heading15,
              ),
            ],
          ),
          content: Text(
            'Será necessário efetuar login novamente para que a alteração seja concluída.',
            style: AppTextStyles.body,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AnimatedButton(
                    width: 120,
                    height: 50,
                    color: AppColors.borderLogin,
                    child: Text(
                      'Ok',
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
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                              (Route<dynamic> route) => false);
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ).show(context);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'requires-recent-login') {
          NDialog(
            dialogStyle: DialogStyle(titleDivider: true),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Erro 404",
                  style: AppTextStyles.heading15,
                ),
              ],
            ),
            content: Text('Usuário não autenticado, informe ao administrador!'),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AnimatedButton(
                      width: 120,
                      height: 50,
                      color: AppColors.borderLogin,
                      child: Text(
                        'Ok',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: dialogDismiss,
                    )
                  ],
                ),
              ),
            ],
          ).show(context);
        }
      }
    }
  }

  logoutfunction() {
    NDialog(
      dialogStyle: DialogStyle(titleDivider: true),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Você deseja mesmo sair?",
            style: AppTextStyles.heading15,
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AnimatedButton(
                width: 120,
                height: 50,
                color: AppColors.borderLogin,
                child: Text(
                  'Sim',
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
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                          (Route<dynamic> route) => false);
                    },
                  );
                },
              ),
              AnimatedButton(
                width: 120,
                height: 50,
                color: AppColors.borderLogin,
                child: Text(
                  'Não',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: dialogDismiss,
              )
            ],
          ),
        ),
      ],
    ).show(context);
  }
}
