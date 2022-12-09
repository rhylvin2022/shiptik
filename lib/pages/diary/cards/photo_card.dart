import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shiptek/pages/diary/cards/photo_thumbnail.dart';
import 'package:shiptek/redux/diary/diary_action.dart';

import '../../../redux/app_state.dart';
import 'package:redux/redux.dart';

class PhotoCard extends StatelessWidget {
  PhotoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Store store = StoreProvider.of<AppState>(context);
    return StoreConnector<AppState, List<XFile>?>(
      converter: (store) => store.state.diaryState.photos,
      builder: (context, photos) => Card(
        elevation: 10.0,
        shadowColor: Colors.black87,
        child: SizedBox(
          width: (MediaQuery.of(context).size.width * 0.9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Add Photos to site diary',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 0.5,
                endIndent: 10,
                indent: 10,
                color: Colors.grey,
              ),
              Container(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: photos?.length ?? 0,
                  separatorBuilder: (context, _) => const SizedBox(
                    width: 5,
                  ),
                  itemBuilder: (context, index) => PhotoThumbnail(
                    index: index,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 10.0,
                    backgroundColor: Colors.lightGreen,
                    textStyle:
                        const TextStyle(fontSize: 15, color: Colors.white)),
                child: SizedBox(
                    width: (MediaQuery.of(context).size.width * 0.75),
                    child: const Center(child: Text('Add a Photo'))),
                onPressed: () {
                  store.dispatch(PickPhotos());
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8, top: 8),
                    child: Text(
                      'Include in photo gallery',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                  StoreConnector<AppState, bool>(
                    converter: (store) => store.state.diaryState.includeGallery,
                    builder: (context, includeGallery) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: Checkbox(
                          activeColor: Colors.lightGreen,
                          checkColor: Colors.white,
                          value: includeGallery,
                          onChanged: (bool? value) {
                            store.dispatch(SetIncludeGallery(
                                includeGallery: value ?? false));
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
