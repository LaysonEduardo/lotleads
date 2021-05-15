import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lotleads/loggedScreen/leads/widgets/leadsFailContainer.dart';
import 'package:lotleads/loggedScreen/leads/widgets/leadsHistoricContainer.dart';

// ignore: must_be_immutable
class HistoricScreen extends StatefulWidget {
  var leadNumber;
  var leadCallText;
  var leadName;
  var leadRegion;
  var results;
  @override
  _HistoricScreen createState() => _HistoricScreen();
}

class _HistoricScreen extends State<HistoricScreen> {
  FirebaseAuth user = FirebaseAuth.instance;
  var phoneNumberGet;
  var phoneNumber;
  var userSignature;
  var userSignatureStatus;
  @override
  Widget build(BuildContext context) {
    var _refreshKey = GlobalKey<RefreshIndicatorState>();
    FirebaseFirestore.instance
        .collection("payments")
        .doc(user.currentUser!.uid)
        .get()
        .then(
      (value) {
        userSignature = value.data();
        userSignatureStatus = userSignature['status'];
      },
    );

    return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection('leads')
            .where('uid', isEqualTo: user.currentUser!.uid)
            .where('status', isEqualTo: true)
            .get(),
        builder: (context, snapshot) {
          if (userSignatureStatus == false) {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: LeadsFailWidget(
                    message: 'Assinatura Bloqueada',
                  ),
                )
              ],
            );
          } else if (snapshot.hasData) {
            final List<DocumentSnapshot> documents = snapshot.data!.docs;
            if (documents.isEmpty) {
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: LeadsFailWidget(
                      message: 'Sem Leads disponíveis no momento',
                    ),
                  )
                ],
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RefreshIndicator(
                  key: _refreshKey,
                  onRefresh: _pullRefresh,
                  child: ListView(
                      children: documents
                          .map((doc) => LeadsHistoricWidget(
                              leadName: doc['leadName'],
                              leadRegion: doc['leadRegion'],
                              whatsPhone: doc['leadPhone'],
                              docId: doc['did'],
                              reload: () {
                                _refreshKey.currentState!.show();
                              }))
                          .toList()),
                ),
              );
            }
          } else {
            return ListView(
              children: [
                LeadsFailWidget(
                  message: 'Erro de conexão, verifique sua internet',
                )
              ],
            );
          }
        });
  }

  Future<void> _pullRefresh() async {
    setState(() {});
  }
}
