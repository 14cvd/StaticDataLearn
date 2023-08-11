import 'package:flutter/material.dart';
import 'package:flutter_api/screen/static_api.dart';

import '../widget/appbar_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(titleName: "Learing API"),
      body: Center(
        child: OutlinedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StaticAPI(),
                  ));
            },
            child: const Text("Static Json")),
      ),
    );
  }
}
