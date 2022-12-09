import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../app_state.dart';

class AddPhotos{
  final List<XFile>? photos;

  AddPhotos({
    required this.photos,
  });
}

class UpdatePhotos{
  final List<XFile>? photos;

  UpdatePhotos({
    required this.photos,
  });
}

class PickPhotos {}

class RemovePhoto {
  final int index;

  RemovePhoto({
    required this.index,
  });}

class SetIncludeGallery {
  final bool includeGallery;

  SetIncludeGallery({
    required this.includeGallery,
  });
}

class UpdateComment {
  final String comment;

  UpdateComment({
    required this.comment,
  });
}

class UpdateTags {
  final String tags;

  UpdateTags({
    required this.tags,
  });
}

class SetDropDownValue1 {
  final String dropDownValue;

  SetDropDownValue1({
    required this.dropDownValue,
  });
}
class SetDropDownValue2 {
  final String dropDownValue;

  SetDropDownValue2({
    required this.dropDownValue,
  });
}
class SetDropDownValue3 {
  final String dropDownValue;

  SetDropDownValue3({
    required this.dropDownValue,
  });
}

class SetIncludeExistingEvents {
  final bool includeExistingEvents;

  SetIncludeExistingEvents({
    required this.includeExistingEvents,
  });
}

class SetEventDropdownValue {
  final String dropDownValue;

  SetEventDropdownValue({
    required this.dropDownValue,
  });
}

class NextButton {}

class GetLocation {}

class SetLocation {
  final String location;

  SetLocation({
    required this.location,
  });
}

class SetAPILoading {
  final bool apiLoading;

  SetAPILoading({
    required this.apiLoading,
  });
}