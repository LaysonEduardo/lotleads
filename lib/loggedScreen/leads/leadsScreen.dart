import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lotleads/loggedScreen/leads/widgets/leadsContainer.dart';
import 'package:lotleads/loggedScreen/leads/widgets/leadsFailContainer.dart';

// ignore: must_be_immutable
class LeadsScreen extends StatefulWidget {
  var leadNumber;
  var leadCallText;
  var leadName;
  var leadRegion;
  var results;

  @override
  _LeadsScreenState createState() => _LeadsScreenState();
}

class _LeadsScreenState extends State<LeadsScreen> {
  var _refreshKey = GlobalKey<RefreshIndicatorState>();
  FirebaseAuth user = FirebaseAuth.instance;
  var phoneNumberGet;
  var phoneNumber;
  var userSignature;
  var userSignatureStatus;
  @override
  Widget build(BuildContext context) {
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
            .where('status', isEqualTo: false)
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
                          .map(
                            (doc) => LeadsWidget(
                              leadName: doc['leadName'],
                              leadRegion: doc['leadRegion'],
                              whatsPhone: doc['leadPhone'],
                              docId: doc['did'],
                              reload: () {
                                _refreshKey.currentState!.show();
                              },
                            ),
                          )
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
    await Future.delayed(Duration(seconds: 2));
    setState(() {});
  }
}
