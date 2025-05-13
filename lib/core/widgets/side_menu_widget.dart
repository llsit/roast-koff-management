import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/home/presentation/screen/menu_provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 220,
      color: Colors.grey[100],
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text("Menu", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          _buildMenuItem(context, 0, Icons.looks_one, "หน้าแรก"),
          _buildMenuItem(context, 1, Icons.looks_two, "เช็คสต๊อก"),
          _buildMenuItem(context, 2, Icons.looks_3, "บุคคล"),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, int index, IconData icon, String label) {
    final selectedIndex = context.watch<MenuProvider>().selectedIndex;
    final isSelected = selectedIndex == index;

    return ListTile(
      selected: isSelected,
      leading: Icon(icon, color: isSelected ? Colors.blue : Colors.black),
      title: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.blue : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: () => context.read<MenuProvider>().selectIndex(index),
    );
  }
}

