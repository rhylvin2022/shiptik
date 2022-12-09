import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../redux/app_state.dart';
import 'package:redux/redux.dart';

class Location extends StatelessWidget {
  Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Store store = StoreProvider.of<AppState>(context);
    return StoreConnector<AppState, String>(
      converter: (store) => store.state.diaryState.location,
      builder: (context, location) => Container(
        height: 40.0,
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.location_on),
            location.isEmpty
                ? const CircularProgressIndicator()
                : FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      location,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
