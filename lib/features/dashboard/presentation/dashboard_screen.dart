import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
        "https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExd2V3bjdnZjJxYWV1MXo5d3cwZnl1ODdtbnp4ZG92NHlrcWN1MDZvZyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/mxBPB4kduFphaMnab7/giphy.gif",
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const CircularProgressIndicator();
        },
        width: 150,
        height: 150,
      ),
    );
  }
}
