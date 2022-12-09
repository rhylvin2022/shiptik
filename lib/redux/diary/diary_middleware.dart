import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';
import 'package:redux/redux.dart';
import 'package:shiptek/api/api.dart';
import 'package:shiptek/helpers/photo_helper.dart';
import 'package:shiptek/redux/diary/diary_action.dart';
import '../app_state.dart';

//* diary redux middleware
class DiaryMiddleware extends MiddlewareClass<AppState> {
  final photoHelper = PhotoHelper();
  final api = API();

  @override
  void call(Store<AppState> store, action, NextDispatcher next) async {
    if (action is PickPhotos) {
      final bool includeGallery = store.state.diaryState.includeGallery;
      final photos = await photoHelper.pickImage(
        imageQuality: 100,
        source: includeGallery ? ImageSource.gallery : ImageSource.camera,
        multiple: includeGallery,
      );

      store.dispatch(AddPhotos(photos: photos));
    }
    if (action is RemovePhoto) {
      List<XFile>? photos = store.state.diaryState.photos;
      photos?.removeAt(action.index);

      store.dispatch(UpdatePhotos(photos: photos));
    }
    if (action is NextButton) {
      store.dispatch(SetAPILoading(apiLoading: true));
      //photos to base64
      List<String> photosBase64 = [];
      Future.forEach(
          store.state.diaryState.photos?.map((e) => e.path).toList() ?? [],
          (element) async {
        String base64String = base64Encode(File(element).readAsBytesSync());
        photosBase64.add(base64String);
      }).then((value) {
        api
            .postAPI(
                photos: photosBase64,
                comment: store.state.diaryState.comment,
                item: store.state.diaryState.dropDownValue1,
                area: store.state.diaryState.dropDownValue2,
                taskCategory: store.state.diaryState.dropDownValue3,
                tags: store.state.diaryState.tags,
                events: store.state.diaryState.eventDropdownValue)
            .then((value) {
          print(value.body);
          store.dispatch(SetAPILoading(apiLoading: false));
        });
      });
    }

    if (action is GetLocation) {
      bool serviceEnabled;
      LocationPermission permission;

      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Location services are not enabled don't continue
        // accessing the position and request users of the
        // App to enable the location services.
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      // When we reach here, permissions are granted and we can
      // continue accessing the position of the device.
      await Geolocator.getCurrentPosition().then((value) async {
        await placemarkFromCoordinates(value.latitude, value.longitude)
            .then((value) {
          store.dispatch(SetLocation(
              location:
                  "${value.first.locality}, ${value.first.postalCode}, ${value.first.country}"));
          return;
        });
      });
    }
    next(action);
  }
}
