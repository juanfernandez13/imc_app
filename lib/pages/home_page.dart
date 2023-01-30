import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:imc_app/constants/constants.dart';
import 'package:imc_app/pages/imc_page.dart';
import 'package:imc_app/pages/list_imc_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    Constants constants = Constants(context);
    return SafeArea(
        child: Column(
      children: [
        Expanded(
          child: PageView(
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            controller: pageController,
            children: const [
              ImcPage(),
              ListImcPage(),
            ],
          ),
        ),
        BottomNavigationBar(
            unselectedItemColor: Colors.white,
            selectedItemColor: constants.vermelhoPadrao,
            backgroundColor: constants.azulBackground,
            type: BottomNavigationBarType.fixed,
            onTap: ((value) {
              var time = (currentPage - value) * 500;
              pageController.animateToPage(value,
                  duration: Duration(milliseconds: time.abs()),
                  curve: Curves.easeInCubic);
            }),
            currentIndex: currentPage,
            items: [
              BottomNavigationBarItem(
                  backgroundColor: constants.vermelhoPadrao,
                  label: "Calcular imc",
                  icon: const Icon(Icons.calculate_sharp)),
              BottomNavigationBarItem(
                  backgroundColor: constants.vermelhoPadrao,
                  label: "salvos",
                  icon: const Icon(Icons.health_and_safety_sharp)),
            ]),
      ],
    ));
  }
}
