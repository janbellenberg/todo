// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Navigation extends StatelessWidget {
  const Navigation(this.index, this.onTap, {Key? key}) : super(key: key);

  final int index;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: this.index,
      onTap: this.onTap,
      items: [
        /// Home
        SalomonBottomBarItem(
          icon: const Icon(Icons.home),
          title: const Text("Home"),
          selectedColor: Theme.of(context).primaryColor,
        ),

        /// Likes
        SalomonBottomBarItem(
          icon: const Icon(Icons.school),
          title: const Text("Studium"),
          selectedColor: Theme.of(context).primaryColor,
        ),

        /// Search
        SalomonBottomBarItem(
          icon: const Icon(Icons.computer),
          title: const Text("Software"),
          selectedColor: Theme.of(context).primaryColor,
        ),
      ],
    );
  }
}
