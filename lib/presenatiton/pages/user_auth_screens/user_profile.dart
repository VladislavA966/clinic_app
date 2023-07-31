import 'package:flutter/material.dart';
import 'package:flutter_application_6/presenatiton/resources/colors/app_colors.dart';
import 'package:flutter_application_6/presenatiton/resources/fonts/app_fonts.dart';
import 'package:flutter_application_6/presenatiton/pages/user_auth_screens/phone_auth_screen.dart';
import 'package:flutter_application_6/presenatiton/widgets/custom_button.dart';

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
      backgroundColor: AppColors.white,
      appBar: AppBar(
        shadowColor: AppColors.white,
        title: Text(
          'Профиль',
          style: AppFonts.w600s17.copyWith(color: AppColors.black),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: AppColors.black,
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
                  color: AppColors.black,
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
              text: 'Войти',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhoneAuthScreen(),
                  ),
                );
              },
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
