import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../redux/app_state.dart';

class SiteDiary extends StatelessWidget {
  SiteDiary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Store store = StoreProvider.of<AppState>(context);
    return StoreConnector<AppState, bool>(
      converter: (store) => store.state.diaryState.includeExistingEvents,
      builder: (context, photos) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Add to site diary',
              style: TextStyle(fontSize: 20),
            ),
          ),
          MaterialButton(
            height: 20,
            minWidth: 20,
            onPressed: () {},
            elevation: 1.0,
            color: Colors.grey,
            shape: const CircleBorder(),
            child: const Icon(
              Icons.question_mark_sharp,
              color: Colors.white,
              size: 15,
            ),
          )
        ],
      ),
    );
  }
}
