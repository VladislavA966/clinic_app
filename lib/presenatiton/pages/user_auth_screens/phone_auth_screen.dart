import 'package:flutter/material.dart';
import 'package:flutter_application_6/presenatiton/resources/colors/app_colors.dart';
import 'package:flutter_application_6/presenatiton/resources/fonts/app_fonts.dart';
import 'package:flutter_application_6/presenatiton/pages/user_auth_screens/pin_auth_screeen.dart';
import 'package:flutter_application_6/presenatiton/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  String userPhone = '';
  TextEditingController phone = TextEditingController();

  @override
  void initState() {
    initPhone();
    super.initState();
  }

  void initPhone() async {
    final prefs = await SharedPreferences.getInstance();
    userPhone = prefs.getString('phone') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Войти',
          style: AppFonts.w600s17.copyWith(
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            color: AppColors.black.withOpacity(0.54),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Войти',
              style: AppFonts.w700s34.copyWith(
                color: AppColors.grey,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 49),
            Text(
              'Номер телефона',
              style: AppFonts.w400s15.copyWith(
                color: AppColors.grey,
              ),
            ),
            TextField(
              maxLength: 9,
              controller: phone,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.grey,
                      width: 2,
                    ),
                  ),
                  prefix: Text(
                    '0',
                    style: AppFonts.w700s17.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                  hintStyle: AppFonts.w700s17.copyWith(
                    color: AppColors.grey,
                  ),
                  hintText: '_ _ _  _ _  _ _'),
            ),
            const SizedBox(height: 15),
            Flexible(
              child: Text(
                'На указанный вами номер придет однократное СМС-сообщение с кодом подтверждения.',
                style: AppFonts.w400s15
                  ..copyWith(
                    color: AppColors.grey,
                  ),
              ),
            ),
            const SizedBox(height: 104),
            CustomButton(
              text: 'Далее',
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setString('phone', phone.text);
                userPhone = prefs.getString('phone') ?? '';
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PinAuthScreeen()));

                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
