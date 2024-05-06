import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:machine_test/constants/colors.dart';

class CurvedBottomNavigationBar extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final int currentIndex;
  final Function(int) onTap;

  const CurvedBottomNavigationBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });
  final String imageUrl =
      'https://s3-alpha-sig.figma.com/img/d65f/a2e5/e3d238402bc77eff08983fb70b4ae1a4?Expires=1716163200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=F8fAJqx6l~5y6zTIMqRyQlEW24ZhfJOI7LD4HeJzXF4zFCNAnj84-LWhyluPQe5edSUtiOLwtGH9Ac8LlO9~Z4gvecjspRAerObKlCq0JbGRFvK0KMM7WB~3jIqlAHYb-PBqrUly8YP9gN~gcKTxgxVAnHaFuN1QqnsEX7qjaN9dRHDzbDGM1sTugjTxvj7hLkPizsXaTOFQNzJo1guQiRYNvsROekZEuRy6eD9Jn-GW0bXmi9l2TB-DFAkqbTCQzBAMtUdpviVKFdkhJR9wOdtRPjaon~dS1CsTdKU86BZzh75z9TQOisX~eF4z8peLBtyhwEregNFZPsjlj2TpkQ__';
  final double iconSize = 30;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: blueColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      padding: const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // Optional
        mainAxisAlignment:
            MainAxisAlignment.spaceEvenly, // Change to your own spacing
        children: [
          Icon(
            size: iconSize,
            Icons.home_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.search,
            size: iconSize,
            color: Colors.white,
          ),
          Icon(
            Icons.add_a_photo_outlined,
            color: Colors.white,
            size: iconSize,
          ),
          Icon(
            Icons.smart_display_outlined,
            color: Colors.white,
            size: iconSize,
          ),
          CircleAvatar(
            radius: 15,
            backgroundImage: CachedNetworkImageProvider(imageUrl),
          )
        ],
      ),
    );
  }
}
