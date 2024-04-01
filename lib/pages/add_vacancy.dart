// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_work/database/firebaseFireStore/vacancy_collection.dart';
import 'package:toast/toast.dart';

class AddVacancyPage extends StatefulWidget {
  const AddVacancyPage({super.key});

  @override
  State<AddVacancyPage> createState() => _AddVacancyPageState();
}

class _AddVacancyPageState extends State<AddVacancyPage> {
  TextEditingController postController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController workSheduleController = TextEditingController();
  TextEditingController nameOrganizationController = TextEditingController();
  VacancyCollection vacancyCollection = VacancyCollection();

  dynamic vacancyDoc;

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.popAndPushNamed(context, '/home'),
          icon: const Icon(
            Icons.arrow_left,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Добавление/Изменение вакансии',
          textScaler: TextScaler.linear(1.2),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  controller: postController,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.white70,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    labelText: 'Должность',
                    labelStyle: const TextStyle(
                      color: Colors.white38,
                    ),
                    hintText: 'Должность',
                    hintStyle: const TextStyle(color: Colors.white38),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  controller: salaryController,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.white70,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    labelText: 'З/П',
                    labelStyle: const TextStyle(
                      color: Colors.white38,
                    ),
                    hintText: 'З/П',
                    hintStyle: const TextStyle(color: Colors.white38),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  controller: descriptionController,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.white70,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    labelText: 'Описание',
                    labelStyle: const TextStyle(
                      color: Colors.white38,
                    ),
                    hintText: 'Описание',
                    hintStyle: const TextStyle(color: Colors.white38),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  controller: workSheduleController,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.white70,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    labelText: 'График',
                    labelStyle: const TextStyle(
                      color: Colors.white38,
                    ),
                    hintText: 'График',
                    hintStyle: const TextStyle(color: Colors.white38),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  controller: nameOrganizationController,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.white70,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    labelText: 'Название организации',
                    labelStyle: const TextStyle(
                      color: Colors.white38,
                    ),
                    hintText: 'Название организации',
                    hintStyle: const TextStyle(color: Colors.white38),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              //////////Доделать добавление в Firebase

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.45,
                child: ElevatedButton(
                  onPressed: () async {
                    if (nameOrganizationController.text.isEmpty ||
                        workSheduleController.text.isEmpty ||
                        descriptionController.text.isEmpty ||
                        salaryController.text.isEmpty ||
                        postController.text.isEmpty) {
                      Toast.show('Заполните все поля');
                    } else {
                      await vacancyCollection.addVacancy(
                        postController.text,
                        salaryController.text,
                        descriptionController.text,
                        workSheduleController.text,
                        nameOrganizationController.text,
                      );
                      Toast.show('Успешно');
                      Navigator.popAndPushNamed(context, '/home');
                    }
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Добавить'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
