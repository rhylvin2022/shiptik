import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../redux/app_state.dart';
import 'package:redux/redux.dart';

import '../../../redux/diary/diary_action.dart';

class PhotoThumbnail extends StatelessWidget {
  const PhotoThumbnail({Key? key, required, this.index = 0}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    Store store = StoreProvider.of<AppState>(context);
    return StoreConnector<AppState, List<XFile>?>(
      converter: (store) => store.state.diaryState.photos,
      builder: (context, photos) => SizedBox(
        width: 100,
        height: 100,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white70,
                    image: DecorationImage(
                      image: FileImage(
                        File(photos?[index].path ?? ''),
                      ),
                      fit: BoxFit.contain,
                    )),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  store.dispatch(RemovePhoto(index: index));
                },
                child: const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    // radius: 20,
                    child: Center(
                        child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 15,
                    )),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
