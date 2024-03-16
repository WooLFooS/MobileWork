import 'package:flutter/material.dart';

class VacancyPage extends StatelessWidget {
  const VacancyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Должность', 
                  style: TextStyle(
                    color: Colors.white
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                  const Text(
                    "50000 - 100000",
                    style: TextStyle(
                      color: Colors.white
                      ),
                    ),
                  const Divider(
                    color: Colors.white
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: const Text(
                    "щ4кцпрщцхууууууупкурцщму2щкалукпухщкрмщуаварповсотчипутапджуцкапуджщцлркджарвыптлочорсрауктвгрпоува",
                    style: TextStyle(color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Дата публикации",
                    style: TextStyle(
                      color: Colors.white
                      ),
                    ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                  OutlinedButton(onPressed: () {}, child: const Text(
                    "Откликнуться",
                    style: TextStyle(
                      color: Colors.white
                      ),
                    )
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
