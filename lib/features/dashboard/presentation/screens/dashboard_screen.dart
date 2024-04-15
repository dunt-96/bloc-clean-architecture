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
                  iconPath: 'assets/icon/ic_profile.svg',
                  title: 'Profile',
                  isSelected: selectedIndex == 1,
                ),
              ),
              GestureDetector(
                onTap: () => onDestinationSelected(2),
                child: ItemNavigation(
                  iconPath: 'assets/icon/ic_saved.svg',
                  title: 'Saved',
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
        body: CustomScrollView(
          shrinkWrap: true,
          // scrollBehavior: const ScrollBehavior(),
          // physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              stretch: false,
              onStretchTrigger: () async {
                // Triggers when stretching
              },
              // [stretchTriggerOffset] describes the amount of overscroll that must occur
              // to trigger [onStretchTrigger]
              //
              // Setting [stretchTriggerOffset] to a value of 300.0 will trigger
              // [onStretchTrigger] when the user has overscrolled by 300.0 pixels.
              stretchTriggerOffset: 100,
              expandedHeight: 100,
              flexibleSpace: const FlexibleSpaceBar(
                title: Text('SliverAppBar'),
                background: FlutterLogo(),
              ),
            ),
            SliverFixedExtentList.builder(
              itemExtent: 50,
              itemCount: 20,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.red,
                  child: const Text('adasd'),
                );
              },
            ),
            // SliverFixedExtentList.builder(
            //   itemBuilder: (context, index) {
            //     return const Text('data');
            //   },
            //   itemExtent: 100,
            //   itemCount: 10,
            // ),
            SliverFillRemaining(
              // hasScrollBody: false,
              child: body,
            ),
          ],
        ),
      ),
    );
  }
}
