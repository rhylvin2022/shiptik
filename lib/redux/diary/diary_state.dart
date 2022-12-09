import 'package:image_picker/image_picker.dart';

class DiaryState {
  String example;
  List<XFile>? photos;
  bool includeGallery;
  String comment;
  String tags;
  String dropDownValue1;
  String dropDownValue2;
  String dropDownValue3;
  bool includeExistingEvents;
  String eventDropdownValue;
  String location;
  bool apiLoading;

  DiaryState({
    required this.example,
    required this.photos,
    required this.includeGallery,
    required this.comment,
    required this.tags,
    required this.dropDownValue1,
    required this.dropDownValue2,
    required this.dropDownValue3,
    required this.includeExistingEvents,
    required this.eventDropdownValue,
    required this.location,
    required this.apiLoading,
  });

  factory DiaryState.initial() {
    return DiaryState(
      example: "",
      photos: null,
      includeGallery: false,
      comment: "",
      tags: "",
      dropDownValue1: "",
      dropDownValue2: "",
      dropDownValue3: "",
      includeExistingEvents: false,
      eventDropdownValue: "",
      location: "",
      apiLoading: false,
    );
  }

  DiaryState copyWith({
    String? example,
    List<XFile>? photos,
    bool? includeGallery,
    String? comment,
    String? tags,
    String? dropDownValue1,
    String? dropDownValue2,
    String? dropDownValue3,
    bool? includeExistingEvents,
    String? eventDropdownValue,
    String? location,
    bool? apiLoading,
  }) {
    return DiaryState(
      example: example ?? this.example,
      photos: photos ?? this.photos,
      includeGallery: includeGallery ?? this.includeGallery,
      comment: comment ?? this.comment,
      tags: tags ?? this.tags,
      dropDownValue1: dropDownValue1 ?? this.dropDownValue1,
      dropDownValue2: dropDownValue2 ?? this.dropDownValue2,
      dropDownValue3: dropDownValue3 ?? this.dropDownValue3,
      includeExistingEvents: includeExistingEvents ?? this.includeExistingEvents,
      eventDropdownValue: eventDropdownValue ?? this.eventDropdownValue,
      location: location ?? this.location,
      apiLoading: apiLoading ?? this.apiLoading,
    );
  }
}
