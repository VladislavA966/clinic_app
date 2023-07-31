import 'package:flutter/material.dart';
import 'package:flutter_application_6/presenatiton/resources/colors/app_colors.dart';
import 'package:flutter_application_6/presenatiton/resources/fonts/app_fonts.dart';
import 'package:flutter_application_6/presenatiton/pages/user_auth_screens/name_auth_screen.dart';
import 'package:flutter_application_6/presenatiton/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PinAuthScreeen extends StatefulWidget {
  const PinAuthScreeen({super.key});

  @override
  State<PinAuthScreeen> createState() => _PinAuthScreeenState();
}

class _PinAuthScreeenState extends State<PinAuthScreeen> {
  String userPin = '';
  TextEditingController pin = TextEditingController();

  @override
  void initState() {
    initPin();
    super.initState();
  }

  void initPin() async {
    final prefs = await SharedPreferences.getInstance();
    userPin = prefs.getString('pin') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.blue,
          ),
        ),
        title: Text(
          'Подтверждение номера',
          style: AppFonts.w600s17.copyWith(
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Text(
                'Введите код из смс',
                style: AppFonts.w500s22.copyWith(
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 178),
              TextField(
                obscureText: true,
                obscuringCharacter: '*',
                textAlign: TextAlign.center,
                controller: pin,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.lightGrey,
                      width: 2,
                    ),
                  ),
                  prefix: Text(
                    'Код',
                    style:
                        AppFonts.w600s18.copyWith(color: AppColors.lightGrey),
                  ),
                  suffix: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.close,
                      color: AppColors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: TextStyle(decoration: TextDecoration.underline),
                ),
                onPressed: () {},
                child: Text(
                  'Получить код повторно',
                  style: AppFonts.w400s15.copyWith(
                    color: AppColors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 70),
              CustomButton(
                text: 'Далее',
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setString('pin', pin.text);
                  userPin = prefs.getString('pin') ?? '';
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserAuthScreen(),
                    ),
                  );
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
