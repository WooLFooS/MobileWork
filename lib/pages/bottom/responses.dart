// ignore_for_file: depend_on_referenced_packages, prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResponsesPage extends StatefulWidget {
  const ResponsesPage({super.key});

  @override
  State<ResponsesPage> createState() => _ResponsesPageState();
}

class _ResponsesPageState extends State<ResponsesPage> {
  final String uid = FirebaseAuth.instance.currentUser!.uid.toString();
  Widget responsesCard(BuildContext context, dynamic docs) {
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Должность: " + docs['post'],
                style: const TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              Text(
                "ЗП:" + docs['salary'],
                style: const TextStyle(color: Colors.white),
              ),
              const Divider(
                color: Colors.white,
              ),
            ],
          ),
          Text(
            'Организация:' + docs['nameOrganization'],
            style: const TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Text(
              "Описание: " + docs['description'],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Text(
              "График работы:" + docs['workSchedule'],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                docs['datePublication'],
                style: const TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Row(
                  children: [
                    Text(
                      "Удалить",
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      // color: deepColor,
      child: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('responses').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              var responses = snapshot.data!.docs.where((element) => element['uid']==uid).toList();
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: responses.length,
                  itemBuilder: (context, index) =>
                      responsesCard(context, responses[index]));
            }
          }),
    );
  }
}