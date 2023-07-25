import 'package:flutter/material.dart';
import 'package:flutter_application_6/app_fonts.dart';
import 'package:flutter_application_6/app_screens/custom_button.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    List<UserProfileData> items = [
      UserProfileData('assets/images/hospital.png',
          'Записывайтесь на прием к самым лучшим специалистам'),
      UserProfileData('assets/images/clipboard2.png',
          'Сохраняйте результаты ваших анализов, диагнозы и рекомендации от врачей в собственную библиотеку'),
      UserProfileData('assets/images/speech.png',
          'Просматривайте отзывы о врачах и дополняйте собственными комментариями'),
      UserProfileData('assets/images/bell.png',
          'Получайте уведомления о приеме или оп оступивших сообщениях'),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.white,
        title: const Text(
          'Профиль',
          style: TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            const Text(
              'Зачем нужен профиль?',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return UserProfileItems(data: items[index]);
              },
            ),
            CustomButton(
              width: 296,
              height: 54,
              text: 'Войти',
              color: Color(0xff4A86CC),
            ),
          ],
        ),
      ),
    );
  }
}

class UserProfileItems extends StatefulWidget {
  const UserProfileItems({super.key, required this.data});
  final UserProfileData data;

  @override
  State<UserProfileItems> createState() => _UserProfileItemsState();
}

class _UserProfileItemsState extends State<UserProfileItems> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Image.asset(
            widget.data.image,
            height: 32,
            width: 32,
          ),
          const SizedBox(width: 18),
          Flexible(
            child: Text(
              widget.data.text,
              style: AppFonts.w400s15,
            ),
          ),
        ],
      ),
    );
  }
}

class UserProfileData {
  final String image;
  final String text;

  UserProfileData(this.image, this.text);
}
