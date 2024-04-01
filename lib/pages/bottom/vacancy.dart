
// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VacancyPage extends StatefulWidget {
  const VacancyPage({super.key});

  @override
  State<VacancyPage> createState() => _VacancyPageState();
}

class _VacancyPageState extends State<VacancyPage> {
  Widget vacanciesCard(BuildContext context, dynamic docs) {
    return ListView(
      children: [
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
                  "График работы: " + docs['workShedule'],
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
                    child: const Text(
                      "Откликнуться",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('vacancy').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return vacanciesCard(context, snapshot.data!.docs[index]);
            },
          );
        }
      },
    );
    //return ListView(
    //children: [
    // Card(
    //   child: Column(
    //     children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           const Text('Должность',
    //           style: TextStyle(
    //             color: Colors.white
    //             ),
    //           ),
    //           SizedBox(
    //             width: MediaQuery.of(context).size.width * 0.4,
    //           ),
    //           const Text(
    //             "50000 - 100000",
    //             style: TextStyle(
    //               color: Colors.white
    //               ),
    //             ),
    //           const Divider(
    //             color: Colors.white
    //           ),
    //         ],
    //       ),
    //       SizedBox(
    //         height: MediaQuery.of(context).size.height * 0.005,
    //       ),
    //       SizedBox(
    //         width: MediaQuery.of(context).size.width * 0.9,
    //         child: const Text(
    //             "щ4кцпрщцхууууууупкурцщму2щкалукпухщкрмщуаварповсотчипутапджуцкапуджщцлркджарвыптлочорсрауктвгрпоува",
    //             style: TextStyle(color: Colors.white),
    //         ),
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           const Text(
    //             "Дата публикации",
    //             style: TextStyle(
    //               color: Colors.white
    //               ),
    //             ),
    //           SizedBox(
    //             width: MediaQuery.of(context).size.width * 0.25,
    //           ),
    //           OutlinedButton(onPressed: () {}, child: const Text(
    //             "Откликнуться",
    //             style: TextStyle(
    //               color: Colors.white
    //               ),
    //             )
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // ),
    //],
    //);
  }
}
