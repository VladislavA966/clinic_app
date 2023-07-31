import 'package:flutter/material.dart';
import 'package:flutter_application_6/app_screens/user_auth_screens/name_auth_screen.dart';
import 'package:flutter_application_6/app_screens/user_auth_screens/phone_auth_screen.dart';
import 'package:flutter_application_6/app_screens/user_auth_screens/pin_auth_screeen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Мой профиль',
                      style: TextStyle(
                          fontSize: 34,
                          color: Color(0xff333333),
                          fontWeight: FontWeight.w700),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.settings))
                  ],
                ),
                SizedBox(height: 32),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CustomCircleAvatar(),
                    Positioned(
                      bottom: 5,
                      right: 0,
                      child: Container(
                        height: 32,
                        width: 32,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Icon(Icons.camera_alt, size: 16),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Айзан Алишерова',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '+996 555 55 55 55',
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 90),
                Image.asset(
                  'assets/images/clipboard.png',
                ),
                SizedBox(height: 22),
                Text(
                  'У вас пока нет добавленных результатов\nанализов',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF757575),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 33),
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.bookmark_add,
                      size: 24,
                    ),
                    label: Text(
                      'Добавить документ',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ))
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 64,
        height: 64,
        child: ElevatedButton(
          onPressed: () {},
          child: Image.asset('assets/images/car.png'),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
        ),
      ),
      bottomNavigationBar: Container(
        height: 83,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.person_add), label: 'Доктора'),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_outlined), label: 'Статьи'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark), label: 'Мои доктора'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
          ],
        ),
      ),
    );
  }
}

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: Color(0xffB6D8FF),
      child: Text(
        'AA',
        style: TextStyle(
            color: Color(0xffFFFFFF),
            fontSize: 40,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
