import 'package:flutter/material.dart';
import 'package:news_print_app/features/home_screens/profile_page/circular_profile_widget.dart';
import 'package:news_print_app/features/notification/notification_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.47),
            const Color(0xFFEDD1CE).withOpacity(0.33),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "User Profile",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color:Color(0xFF333333),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(
                  top: 60,
                  bottom: 12,
                ),
                child: const CircularProfileWidget(),
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Rashmika Manddna, 28",
                  style: TextStyle(
                    fontSize: 24,
                    color:Color(0xFF333333),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(
                  top: 4,
                ),
                child: const Text(
                  "suriyavasan@buzzwire.com",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF828282),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 32,
                ),
                child: Text(
                  "Basic Settings",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF828282),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 6,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFE0E0E0),
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pushNamed(
                        context,
                        NotificationScreen.routeName,
                      ),
                      child: const ListTile(
                        title: Text("Notification Settings"),
                        leading: Icon(
                          Icons.notifications_active_outlined,
                          color:Color(0xFF333333),
                        ),
                      ),
                    ),
                    const Divider(
                      color: Color(0xFFE0E0E0),
                      height: 0,
                      thickness: 1.0,
                    ),
                    const ListTile(
                      title: Text("Language Selection"),
                      tileColor: Colors.white,
                      leading: Icon(
                        Icons.translate_outlined,
                        color:Color(0xFF333333),
                      ),
                    ),
                    const Divider(
                      color: Color(0xFFE0E0E0),
                      height: 0,
                      thickness: 1.0,
                    ),
                    const ListTile(
                      title: Text("My Activity"),
                      tileColor: Colors.white,
                      leading: Icon(
                        Icons.access_time_rounded,
                        color:Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 26,
                ),
                child: Text(
                  "User Settings",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF828282),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 6,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFE0E0E0),
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  children: [
                    ListTile(
                      title: Text("Account Details"),
                      leading: Icon(
                        Icons.person,
                        color:Color(0xFF333333),
                      ),
                    ),
                    Divider(
                      color: Color(0xFFE0E0E0),
                      height: 0,
                      thickness: 1.0,
                    ),
                    ListTile(
                      title: Text("Unit Setting"),
                      leading: Icon(
                        Icons.settings,
                        color:Color(0xFF333333),
                      ),
                    ),
                    Divider(
                      color: Color(0xFFE0E0E0),
                      height: 0,
                      thickness: 1.0,
                    ),
                    ListTile(
                      title: Text("User Policy"),
                      leading: Icon(
                        Icons.policy_outlined,
                        color:Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 30),
                child: const Text(
                  "Let’s cheers for the great things",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFBDBDBD),
                    fontSize: 10,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(
                  top: 6,
                  bottom: 16,
                ),
                child: const Text(
                  "Made with ❤️ in Banglore, KA, India",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFBDBDBD),
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
