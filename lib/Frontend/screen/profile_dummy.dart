import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../widget/bottom_nav.dart';

class ProfileDummy extends StatefulWidget {
  const ProfileDummy({super.key});

  @override
  State<ProfileDummy> createState() => _ProfileDummyState();
}

class _ProfileDummyState extends State<ProfileDummy> {
  Widget listTile(
      {required IconData icon, required String title, required onTab1}) {
    return Column(
      children: [
        const Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
          onTap: onTab1,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 7, 7),
      appBar: AppBar(
        leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.network(
              fit: BoxFit.cover,
              'https://static.vecteezy.com/system/resources/previews/021/608/790/large_2x/chatgpt-logo-chat-gpt-icon-on-black-background-free-vector.jpg',
            )),
        title: const Text(
          'AI Assistants',
          style: TextStyle(
              fontFamily: 'Gotham',
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 19),
        ),
        centerTitle: true,
        toolbarHeight: 50,
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 15, 1, 1),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 300,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 8, 8, 8),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 250,
                          height: 80,
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text(
                                    "Aryan Kumar",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "gmail",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Row(
                    //   children: <Widget>[
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(horizontal: 16),
                    //       child: Text(
                    //         'General',
                    //         style: TextStyle(
                    //           color: Colors.white,
                    //           fontSize: 14,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //     ),
                    //     Expanded(
                    //       child: Divider(
                    //         color: Colors.white,
                    //         height: 36,
                    //         thickness: 0.2,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const ListTile(
                      leading: Text(
                        'General',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      title: Divider(
                        color: Colors.white,
                        height: 36,
                        thickness: 0.2,
                      ),
                    ),

                    listTile(
                        icon: Icons.person,
                        title: "Personal Info",
                        onTab1: () {}),
                    listTile(
                        icon: Icons.security, title: "Security", onTab1: () {}),
                    listTile(
                        icon: Icons.language_outlined,
                        title: "Languages",
                        onTab1: () {}),

                    //  listTile(icon: Icons.shop, title: "My orders"),
                  ],
                ),
              ),
              const ListTile(
                leading: Text(
                  ' About',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                title: Divider(
                  color: Colors.white,
                  height: 36,
                  thickness: 0.2,
                ),
              ),
              Container(
                height: 300,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 7, 6, 6),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 180,
                          height: 30,
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    listTile(
                        icon: Icons.help_outline,
                        title: "Help Center",
                        onTab1: () {}),

                    listTile(
                        icon: Icons.policy_outlined,
                        title: "Privacy policy",
                        onTab1: () {}),
                    listTile(
                        icon: Icons.exit_to_app_outlined,
                        title: "About Us",
                        onTab1: () {}),
                    listTile(
                        icon: Icons.exit_to_app_outlined,
                        title: "LogOut",
                        onTab1: () {}),

                    //  listTile(icon: Icons.shop, title: "My orders"),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 40, left: 30),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Color.fromARGB(255, 59, 255, 85),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://img.freepik.com/free-photo/robot-doing-peace-sign_1048-3527.jpg?w=2000'),
                radius: 45,
                backgroundColor: Colors.green,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
