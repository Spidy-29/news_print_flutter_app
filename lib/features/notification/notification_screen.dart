import 'package:flutter/material.dart';
import 'package:news_print_app/constants/global_variable.dart';

class NotificationScreen extends StatefulWidget {
  static const String routeName = '/notification';
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

enum NotificationFilter {
  isAllNotification,
  isImportantAndBreackingNotification,
  isCuratedForMeNotification,
  disable
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isNotificationOn = false;
  bool isMutedOnNight = false;
  NotificationFilter? _notificationFliterValue =
      NotificationFilter.isAllNotification;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF2F2F2),
        appBar: AppBar(
          backgroundColor: const Color(0xFFE0E0E0),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_circle_left_rounded),
            color: const Color(0xFF333333),
            onPressed: () => Navigator.pop(context),
            iconSize: 32.0,
          ),
          centerTitle: true,
          title: const Text(
            "Notification Settings",
          ),
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFD9D9D9),
                    width: 1.0,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: const Text(
                        "Notification",
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Switch(
                        value: isNotificationOn,
                        onChanged: (value) {
                          setState(() {
                            isNotificationOn = value;
                          });
                        },
                        activeColor: GlobalVariables.primaryColor,
                        activeTrackColor: const Color(0xFFD9D9D9),
                      ),
                    ),
                    Visibility(
                      visible: isNotificationOn,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(
                            color: Color(0xFFD9D9D9),
                            thickness: 1,
                            height: 0,
                          ),
                          const ListTile(
                            title: Text(
                              "Notification Filter",
                              style: TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 32,
                            ),
                            child: Divider(
                              color: Color(0xFFD9D9D9),
                              thickness: 1,
                              height: 0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                            ),
                            child: RadioListTile(
                              value: NotificationFilter.isAllNotification,
                              controlAffinity: ListTileControlAffinity.trailing,
                              toggleable: true,
                              fillColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (states) {
                                if (states.contains(MaterialState.selected)) {
                                  return GlobalVariables.primaryColor;
                                }
                                return const Color(0xFFBDBDBD);
                              }),
                              groupValue: _notificationFliterValue,
                              onChanged: (NotificationFilter? value) {
                                setState(() {
                                  _notificationFliterValue = value;
                                });
                              },
                              activeColor: GlobalVariables.primaryColor,
                              title: const Text(
                                "All Notification",
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              splashRadius: 25.0,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 32,
                            ),
                            child: Divider(
                              color: Color(0xFFD9D9D9),
                              thickness: 1,
                              height: 0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                            ),
                            child: RadioListTile(
                              controlAffinity: ListTileControlAffinity.trailing,
                              value: NotificationFilter
                                  .isImportantAndBreackingNotification,
                              groupValue: _notificationFliterValue,
                              toggleable: true,
                              fillColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (states) {
                                if (states.contains(MaterialState.selected)) {
                                  return GlobalVariables.primaryColor;
                                }
                                return const Color(0xFFBDBDBD);
                              }),
                              onChanged: (NotificationFilter? value) {
                                setState(() {
                                  _notificationFliterValue = value;
                                });
                              },
                              activeColor: GlobalVariables.primaryColor,
                              title: const Text(
                                "Important and Breaking",
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              splashRadius: 25.0,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 32,
                            ),
                            child: Divider(
                              color: Color(0xFFD9D9D9),
                              thickness: 1,
                              height: 0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                            ),
                            child: RadioListTile(
                              controlAffinity: ListTileControlAffinity.trailing,
                              value:
                                  NotificationFilter.isCuratedForMeNotification,
                              groupValue: _notificationFliterValue,
                              toggleable: true,
                              fillColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (states) {
                                if (states.contains(MaterialState.selected)) {
                                  return GlobalVariables.primaryColor;
                                }
                                return const Color(0xFFBDBDBD);
                              }),
                              onChanged: (value) {
                                setState(() {
                                  _notificationFliterValue = value;
                                });
                              },
                              activeColor: GlobalVariables.primaryColor,
                              title: const Text(
                                "Curated for me ",
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              splashRadius: 25.0,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 32,
                            ),
                            child: Divider(
                              color: Color(0xFFD9D9D9),
                              thickness: 1,
                              height: 0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isMutedOnNight = !isMutedOnNight;
                                });
                              },
                              child: ListTile(
                                title: const Text(
                                  "Mute Notification on Night",
                                  style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.check_circle_rounded,
                                  color: isMutedOnNight
                                      ? GlobalVariables.primaryColor
                                      : const Color(0xFFBDBDBD),
                                  size: 26,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
