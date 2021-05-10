import 'package:animated_button/animated_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lotleads/core/app_colors.dart';
import 'package:lotleads/core/app_text_styles.dart';
import 'package:ndialog/ndialog.dart';

// ignore: must_be_immutable
class AnotherProblemWidget extends StatefulWidget {
  var returnhome;
  AnotherProblemWidget({required this.returnhome});

  @override
  _AnotherProblemWidgetState createState() => _AnotherProblemWidgetState();
}

class _AnotherProblemWidgetState extends State<AnotherProblemWidget> {
  final _helpform = GlobalKey<FormState>();

  TextEditingController emailhelpController = TextEditingController();

  TextEditingController messageController = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
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
          key: _helpform,
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
                    controller: emailhelpController,
                    keyboardType: TextInputType.emailAddress,
                    enableSuggestions: true,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Seu Email'),
                  ),
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
                  child: TextFormField(
                    maxLines: 7,
                    controller: messageController,
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
                    onPressed: sendHelpMessage,
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
                    onPressed: widget.returnhome,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  sendHelpMessage() {
    CollectionReference helpmessage =
        FirebaseFirestore.instance.collection('feedback');

    // Call the user's CollectionReference to add a new user
    if (emailhelpController.text == '' || messageController.text == '') {
      NDialog(
        dialogStyle: DialogStyle(titleDivider: true),
        title: Text(
          "Erro",
          style: AppTextStyles.heading15,
        ),
        content: Text(
          'Ambos os campos são obrigatórios  e não podem ficar vazios.',
          style: AppTextStyles.heading,
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: AnimatedButton(
                width: 150,
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
              ),
            ),
          )
        ],
      ).show(context);
    } else {
      helpmessage.add({
        'email': emailhelpController.text, // John Doe
        'message': messageController.text, // Stokes and Sons
        'data': DateTime.now() // 42
      }).then((value) {
        NDialog(
          dialogStyle: DialogStyle(titleDivider: true),
          title: Text(
            "Pedido de ajuda encaminhado!",
            style: AppTextStyles.heading15,
          ),
          content: Text(
            'O desenvolvedor ira investigar e dar um feedback o mais breve possível. Agradecemos por estar ajudando nossa plataforma a melhorar cada vez mais ☺️',
            style: AppTextStyles.heading,
          ),
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: AnimatedButton(
                  width: 150,
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
                ),
              ),
            )
          ],
        ).show(context);
      }).catchError((error) {
        print(error.code);
      });
    }
  }

  dialogDismiss() {
    Navigator.of(context, rootNavigator: true).pop('dialog');
  }
}
