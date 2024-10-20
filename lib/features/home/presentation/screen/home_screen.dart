import 'package:flutter/material.dart';

import '../../../../core/di/di.dart';
import '../../../search/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => showSearch(
              context: context,
              delegate: SearchScreen(locator<SearchCubit>()),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Welcome to the Home Screen!'),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Go to Second Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
