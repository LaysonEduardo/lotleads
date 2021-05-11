import 'package:flutter/material.dart';
import 'package:lotleads/core/app_colors.dart';

class LeadsScreen extends StatefulWidget {
  @override
  _LeadsScreenState createState() => _LeadsScreenState();
}

class _LeadsScreenState extends State<LeadsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          Container(
            height: 80,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Text('teste'),
          ),
        ],
      ),
    );
  }
}
