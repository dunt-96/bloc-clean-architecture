import 'package:flutter/material.dart';
import 'package:template/features/dashboard/presentation/screens/components/item_navigation.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey.shade400)),
            color: Colors.red,
          ),
          child: NavigationBar(
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            destinations: [
              // NavigationDestination(label: 'Section A', icon: Icon(Icons.home)),
              // NavigationDestination(label: 'Section B', icon: Icon(Icons.settings)),
              GestureDetector(
                onTap: () => onDestinationSelected(0),
                child: ItemNavigation(
                  iconPath: 'assets/icon/ic_home.svg',
                  title: 'Home',
                  isSelected: selectedIndex == 0,
                ),
              ),
              GestureDetector(
                onTap: () => onDestinationSelected(1),
                child: ItemNavigation(
                  iconPath: 'assets/icon/ic_qibla.svg',
                  title: 'Qibla',
                  isSelected: selectedIndex == 1,
                ),
              ),
              GestureDetector(
                onTap: () => onDestinationSelected(2),
                child: ItemNavigation(
                  iconPath: 'assets/icon/ic_saved.svg',
                  title: 'Prayer times',
                  isSelected: selectedIndex == 2,
                ),
              ),
              GestureDetector(
                onTap: () => onDestinationSelected(3),
                child: ItemNavigation(
                  iconPath: 'assets/icon/ic_explore.svg',
                  title: 'Explore',
                  isSelected: selectedIndex == 3,
                ),
              ),
            ],
          ),
        ),
        body: body,
      ),
    );
  }
}
