import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shiptek/colors/primary_black.dart';
import 'package:shiptek/pages/diary/diary_page.dart';
import '../redux/app_state.dart';
import '../redux/store.dart';
import 'package:redux/redux.dart';

void main() async {
  final store = await createStore();
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  const MyApp({Key? key, required this.store}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shiptek Solutions',
        theme: ThemeData(
          primarySwatch: primaryBlack,
        ),
        home: DiaryPage(),
      ),
    );
  }
}
