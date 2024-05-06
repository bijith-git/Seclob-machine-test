import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:machine_test/models/profile_model.dart';
import 'package:machine_test/provider/profile_provider.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../widget/widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var userData = {};
  int postLen = 0;
  int followers = 0;
  int following = 0;
  String img =
      'https://rubidya.s3.ap-south-1.amazonaws.com/images/1714998401044-GfYn5fNupz.png';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        top: true,
        child:
            Consumer<ProfileProvider>(builder: (context, profileProvider, _) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              scrolledUnderElevation: 0,
              leading: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 15),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: blueColor.withOpacity(.4),
                ),
                child: const Icon(
                  Icons.ios_share_rounded,
                ),
              ),
              actions: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 15),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: blueColor.withOpacity(.4),
                  ),
                  child: const Icon(
                    Icons.more_horiz,
                  ),
                )
              ],
            ),
            bottomNavigationBar: CurvedBottomNavigationBar(
              onTap: (index) {},
              currentIndex: 1,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add_a_photo), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.smart_display), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
              ],
            ),
            body: profileProvider.state == AppState.loading
                ? const Center(child: CircularProgressIndicator())
                : profileProvider.state == AppState.error
                    ? Center(
                        child: Text(
                          profileProvider.errorMessage,
                          style: textTheme.bodyLarge!.copyWith(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      )
                    : ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      backgroundImage:
                                          CachedNetworkImageProvider(img),
                                      radius: 40,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          buildStatColumn(
                                              profileProvider.posts.length,
                                              "posts"),
                                          buildStatColumn(
                                              followers, "followers"),
                                          buildStatColumn(
                                              following, "following"),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.only(
                                    top: 15,
                                  ),
                                  child: Text("Rayan Moon",
                                      style: textTheme.bodyLarge!.copyWith(
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.only(
                                    top: 8,
                                  ),
                                  child: Text("Photographer",
                                      style: textTheme.bodyMedium),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding:
                                      const EdgeInsets.only(top: 6, right: 20),
                                  child: Text(
                                    "🌟 You are beautiful, and I'm here to capture it! 🌟",
                                    maxLines: 4,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    style: textTheme.bodyMedium!.copyWith(
                                        letterSpacing: 1, height: 1.6),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: blueColor,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 36),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16))),
                                        onPressed: () {},
                                        child: Text(
                                          "Edit Profile",
                                          style: textTheme.bodyLarge!.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        )),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: blueDarkColor,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 36),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16))),
                                        onPressed: () {},
                                        child: Text(
                                          "Wallet",
                                          style: textTheme.bodyLarge!.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        )),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                blueColor.withOpacity(.7),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 5),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16))),
                                        onPressed: () {},
                                        child: const Icon(Icons.call_outlined,
                                            color: Colors.white)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          TabBar(
                              indicator: const UnderlineTabIndicator(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              labelStyle: textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                              unselectedLabelStyle: textTheme.bodyMedium!
                                  .copyWith(letterSpacing: 1),
                              // insets: EdgeInsets.zero,
                              dividerColor: Colors.grey,
                              tabs: const [
                                Tab(
                                  text: "Photos",
                                ),
                                Tab(
                                  text: "Video",
                                )
                              ]),
                          SizedBox(
                            // width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 2,
                            child: TabBarView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: profileProvider.posts.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 15,
                                      childAspectRatio: .6,
                                    ),
                                    itemBuilder: (context, index) {
                                      var post = profileProvider.posts[index];
                                      return GridImageWIdget(
                                          post: post, textTheme: textTheme);
                                    },
                                  ),
                                ),
                                const Text("Video")
                              ],
                            ),
                          )
                        ],
                      ),
          );
        }),
      ),
    );
  }

  Column buildStatColumn(int num, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          num.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
