import 'package:flutter/material.dart';

class NavigationBarView extends StatefulWidget {
  const NavigationBarView({super.key});

  static const routeName = '/navigation_bar';

  @override
  State<NavigationBarView> createState() => _NavigationBarViewState();
}

class _NavigationBarViewState extends State<NavigationBarView> {
  int navIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: NavigationBar(
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              selectedIndex: navIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  navIndex = index;
                });
              },
              destinations: const <Widget>[
                NavigationDestination(icon: Icon(Icons.home), label: "Home"),
                NavigationDestination(
                    icon: Icon(Icons.analytics), label: "Stats"),
                NavigationDestination(icon: Icon(Icons.people), label: "Friends"),
              ]),
          body: Page(navIndex)),
    );
  }
}

class Page extends StatelessWidget {
  const Page(this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    final IconData icon = index == 0
        ? Icons.home
        : index == 1
            ? Icons.analytics
            : Icons.people;
    return Center(
      child: Icon(icon, size: 64)
    );
  }
}
