import 'package:flutter/material.dart';
import 'package:flutter_application_6/app_fonts.dart';
import 'package:flutter_application_6/custom_button.dart';
import 'package:flutter_application_6/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAuthScreen extends StatefulWidget {
  const UserAuthScreen({super.key});

  @override
  State<UserAuthScreen> createState() => _UserAuthScreenState();
}

class _UserAuthScreenState extends State<UserAuthScreen> {
  String userName = '';
  String userSurname = '';
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();

  @override
  void initState() {
    initName();
    initSurname();
    super.initState();
  }

  void initName() async {
    final prefs = await SharedPreferences.getInstance();
    userName = prefs.getString('name') ?? '';
  }

  void initSurname() async {
    final prefs = await SharedPreferences.getInstance();
    userSurname = prefs.getString('surname') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Войти',
          style: AppFonts.w600s17,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.close,
            color: Colors.black.withOpacity(0.54),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Имя', style: AppFonts.w400s15),
            CustomTextField(hintText: 'Введите ваше имя', controller: name),
            const SizedBox(height: 32),
            Text('Фамилия', style: AppFonts.w400s15),
            CustomTextField(
              hintText: 'Введите вашу фамилию',
              controller: surname,
            ),
            const SizedBox(height: 130),
            CustomButton(
              text: 'Далее',
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setString('name', name.text);
                prefs.setString('surname', surname.text);
                userName = prefs.getString('name') ?? '';
                userSurname = prefs.getString('surname') ?? '';

                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}
