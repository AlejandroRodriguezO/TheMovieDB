import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';
import '../../../search/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'assets/logo.png',
          width: 150.w,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: AppColors.white,
              size: 22.w,
            ),
            onPressed: () => showSearch(
              context: context,
              delegate: SearchScreen(locator<SearchCubit>()),
            ),
          ),
        ],
      ),
      body: Container(
        foregroundDecoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Theme.of(context).primaryColor.withOpacity(0.3),
              Theme.of(context).primaryColor,
            ],
          ),
        ),
        child: Image.asset(
          'assets/home.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
