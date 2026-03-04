import 'package:flutter/material.dart';

class ComingSoonTab extends StatelessWidget {
  const ComingSoonTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Coming Soon...", style: TextStyle(fontSize: 22)),
      ),
    );
  }
}
