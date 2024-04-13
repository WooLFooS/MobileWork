
// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_work/database/firebaseFireStore/responses_collection.dart';
import 'package:toast/toast.dart';


class VacancyPage extends StatefulWidget {
  const VacancyPage({super.key});

  @override
  State<VacancyPage> createState() => _VacancyPageState();
}

class _VacancyPageState extends State<VacancyPage> {
  ResponsesCollection responsesCollection = ResponsesCollection();
  Widget vacanciesCard(BuildContext context, dynamic docs) {
    
    return
        Card(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Должность " + docs['post'],
                    style: const TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                  Text(
                    "ЗП " + docs['salary'],
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                ],
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.005,
              // ),
              Text(
                "Оранизация: " + docs['nameOrganization'],
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
                  "График работы: " + docs['workSchedule'],
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
                    onPressed: () async{
                      await responsesCollection.addResponses(docs);
                      Toast.show('Откликнулся');
                    },
                    child: const Text(
                      "Откликнуться",
                      style: TextStyle(color: Colors.white),
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
    ToastContext().init(context);
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('vacancy').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return vacanciesCard(context, snapshot.data!.docs[index]);
            },
          );
        }
      },
    );
  }
}
