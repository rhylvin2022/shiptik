import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:redux/redux.dart';

import '../../../../redux/app_state.dart';
import '../../../../redux/diary/diary_action.dart';

class NextButtonComponent extends StatelessWidget {
  const NextButtonComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Store store = StoreProvider.of<AppState>(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 10.0,
          backgroundColor: Colors.lightGreen,
          textStyle: const TextStyle(fontSize: 15, color: Colors.white)),
      child: SizedBox(
          width: (MediaQuery.of(context).size.width * 0.75),
          child: const Center(child: Text('Next'))),
      onPressed: () {
        store?.dispatch(NextButton());
      },
    );
  }
}
