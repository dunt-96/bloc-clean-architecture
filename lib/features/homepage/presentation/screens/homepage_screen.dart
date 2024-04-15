import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   context.read<HomepageBloc>().add(
    //         const HomeEventGetData(),
    //       );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text('go to detail home page'),
          onPressed: () => context.push('/home/home-details'),
        ),
      ),
    );
  }
}
