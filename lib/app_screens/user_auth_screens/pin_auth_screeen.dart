import 'package:flutter/material.dart';
import 'package:flutter_application_6/app_fonts.dart';
import 'package:flutter_application_6/app_screens/custom_button.dart';
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
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xff007AFF),
          ),
        ),
        title: const Text('Подтверждение номера', style: AppFonts.w600s17),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              const Text('Введите код из смс', style: AppFonts.w500s22),
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
                      color: Color(0xff979797),
                      width: 2,
                    ),
                  ),
                  prefix: Text(
                    'Код',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff333333),
                    ),
                  ),
                  suffix: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.close,
                      color: Color(0xff333333),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Получить код еще раз',
                  style: AppFonts.w400s15,
                ),
              ),
              const SizedBox(height: 70),
              CustomButton(
                text: 'Далее',
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setString('pin', pin.text);
                  userPin = prefs.getString('pin') ?? '';

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
