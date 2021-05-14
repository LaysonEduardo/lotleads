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
  FirebaseAuth user = FirebaseAuth.instance;
  var phoneNumberGet;
  var phoneNumber;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection('leads')
            .where('uid', isEqualTo: user.currentUser!.uid)
            .where('status', isEqualTo: false)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<DocumentSnapshot> documents = snapshot.data!.docs;
            if (documents.isEmpty) {
              return ListView(
                children: [
                  LeadsFailWidget(
                    message: 'Sem Leads disponíveis no momento',
                  )
                ],
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                    children: documents
                        .map(
                          (doc) => LeadsWidget(
                            leadName: doc['leadName'],
                            leadRegion: doc['leadRegion'],
                            whatsPhone: doc['leadPhone'],
                            docId: doc['did'],
                          ),
                        )
                        .toList()),
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
}
