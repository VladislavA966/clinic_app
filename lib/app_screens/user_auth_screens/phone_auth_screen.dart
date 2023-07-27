import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_6/app_fonts.dart';
import 'package:flutter_application_6/custom_button.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Войти',
              style: AppFonts.w700s34,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 49),
            Text('Номер телефона', style: AppFonts.w400s15),
            TextField(
              controller: phone,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF333333),
                      width: 2,
                    ),
                  ),
                  prefix: Text('0', style: AppFonts.w700s17),
                  hintStyle: AppFonts.w700s17,
                  hintText: '_ _ _  _ _  _ _'),
            ),
            const SizedBox(height: 15),
            const Flexible(
              child: Text(
                'На указанный вами номер придет однократное СМС-сообщение с кодом подтверждения.',
                style: AppFonts.w400s15,
              ),
            ),
            const SizedBox(height: 104),
            CustomButton(
              text: 'Далее',
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setString('phone', phone.text);
                userPhone = prefs.getString('phone') ?? '';

                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
