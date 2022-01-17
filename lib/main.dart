import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/home.dart';
import 'package:riverpod_demo/login_screen.dart';
import 'package:riverpod_demo/model/data.dart';
import 'package:riverpod_demo/state/state_manager.dart';
import 'package:riverpod_demo/story_screen.dart';
import 'package:riverpod_demo/tabs/tab1.dart';
import 'package:riverpod_demo/tabs/tab2.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: LoginScreen());
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<dynamic>?> photos = ref.watch(photoStateFuture);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo,
            title: Text('Riverpod'),
            centerTitle: true,
            elevation: 0,
            bottom: TabBar(tabs: [
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.photo)),
            ]),
          ),
          body: TabBarView(children: [Tab1(), Tab2()])),
    );
  }
}
