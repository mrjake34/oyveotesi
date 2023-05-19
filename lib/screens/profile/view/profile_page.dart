import 'package:flutter/material.dart';
import 'package:oyveotesi/components/buttons/outline_button.dart';
import 'package:oyveotesi/constants/sizes/sizes.dart';
import 'package:oyveotesi/constants/style/text_styles.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: pagePadding, vertical: pagePadding),
        child: Column(
          children: [
            ListTile(
              leading: SizedBox(
                height: 64,
                width: 64,
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 232, 232, 232),
                      ),
                    ),
                    const Positioned(
                      top: 3,
                      child: Icon(
                        Icons.person,
                        size: 64,
                        color: Color.fromARGB(255, 165, 165, 165),
                      ),
                    ),
                  ],
                ),
              ),
              title: const Text(
                "Alkan Ataş",
                style: contextTitleTextStyle,
              ),
              subtitle: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("alkanatas34@gmail.com"),
                  Text("Okul Sorumlusu")
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: MainOutlineButton(
                      buttonFunction: () {},
                      textWidget: const Text("Şifre Değiştir")),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            elevation: 3.0,
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(buttonRadius))),
                        onPressed: () {},
                        icon: const Icon(Icons.logout),
                        label: const Text("Çıkış"))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
