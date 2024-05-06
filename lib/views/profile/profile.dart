import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:machine_test/provider/profile_provider.dart';

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

  int followers = 564;
  int following = 564;
  final String imageUrl =
      'https://s3-alpha-sig.figma.com/img/d65f/a2e5/e3d238402bc77eff08983fb70b4ae1a4?Expires=1716163200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=F8fAJqx6l~5y6zTIMqRyQlEW24ZhfJOI7LD4HeJzXF4zFCNAnj84-LWhyluPQe5edSUtiOLwtGH9Ac8LlO9~Z4gvecjspRAerObKlCq0JbGRFvK0KMM7WB~3jIqlAHYb-PBqrUly8YP9gN~gcKTxgxVAnHaFuN1QqnsEX7qjaN9dRHDzbDGM1sTugjTxvj7hLkPizsXaTOFQNzJo1guQiRYNvsROekZEuRy6eD9Jn-GW0bXmi9l2TB-DFAkqbTCQzBAMtUdpviVKFdkhJR9wOdtRPjaon~dS1CsTdKU86BZzh75z9TQOisX~eF4z8peLBtyhwEregNFZPsjlj2TpkQ__';

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
              leading: AppBarIcon(
                icon: Icons.ios_share_rounded,
                margin: const EdgeInsets.only(left: 15),
              ),
              actions: [
                AppBarIcon(
                  icon: Icons.more_horiz,
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
                                          CachedNetworkImageProvider(imageUrl),
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
                                              profileProvider.postCount,
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
                                          color: blueTextColor,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.only(
                                    top: 8,
                                  ),
                                  child: Text("Photographer",
                                      style: textTheme.bodyMedium!.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: blueTextColor.withOpacity(.7),
                                      )),
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
                                    style: textTheme.bodyLarge!.copyWith(
                                        color: blueTextColor,
                                        letterSpacing: 1,
                                        height: 1.6),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ButtonWidget(
                                      backgroundColor: blueColor,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 36),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      buttonTitle: "Edit Profile",
                                    ),
                                    const ButtonWidget(buttonTitle: "Wallet"),
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
                            height: min(220, size.height * .3) *
                                (profileProvider.posts.length / 3.0)
                                    .ceil()
                                    .toDouble(),
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
                                Center(
                                    child: Text(
                                  "Video",
                                  style: textTheme.bodyLarge,
                                ))
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

  Container AppBarIcon(
      {required IconData icon,
      EdgeInsetsGeometry? margin = const EdgeInsets.only(right: 15)}) {
    return Container(
      alignment: Alignment.center,
      margin: margin,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: blueColor.withOpacity(.2),
      ),
      child: Icon(
        icon,
        color: blueDarkColor,
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
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 21, fontWeight: FontWeight.bold, color: blueDarkColor),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4),
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: blueDarkColor.withOpacity(.7)),
          ),
        ),
      ],
    );
  }
}
