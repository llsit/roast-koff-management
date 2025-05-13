import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/layout/responsive.dart';
import '../../../../core/widgets/side_menu_widget.dart';
import 'menu_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    final selectedIndex = context.watch<MenuProvider>().selectedIndex;

    return Scaffold(
      body: Row(
        children: [
          if (isDesktop) const SideMenu(),
          Expanded(child: _getPage(selectedIndex)),
        ],
      ),
      bottomNavigationBar: !isDesktop
          ? BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) =>
            context.read<MenuProvider>().selectIndex(index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.looks_one), label: "หน้าแรก"),
          BottomNavigationBarItem(icon: Icon(Icons.looks_two), label: "เช็คสต๊อก"),
          BottomNavigationBarItem(icon: Icon(Icons.looks_3), label: "บุคคล"),
        ],
      )
          : null,
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const Center(child: Text("Page 1"));
      case 1:
        return const Center(child: Text("Page 2"));
      case 2:
        return const Center(child: Text("Page 3"));
      default:
        return const Center(child: Text("Unknown Page"));
    }
  }
}