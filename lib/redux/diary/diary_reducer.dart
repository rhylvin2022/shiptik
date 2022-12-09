import 'package:image_picker/image_picker.dart';
import 'package:redux/redux.dart';
import 'package:shiptek/redux/diary/diary_action.dart';
import 'diary_state.dart';

final diaryReducer = combineReducers<DiaryState>([
  TypedReducer<DiaryState, AddPhotos>(
      _addPhotosReducers),
  TypedReducer<DiaryState, SetIncludeGallery>(
      _setIncludeGalleryReducers),
  TypedReducer<DiaryState, UpdatePhotos>(
      _updatePhotosReducers),
  TypedReducer<DiaryState, UpdateComment>(
      _updateCommentReducers),
  TypedReducer<DiaryState, UpdateTags>(
      _updateTagsReducers),
  TypedReducer<DiaryState, SetDropDownValue1>(
      _setDropDownValue1Reducers),
  TypedReducer<DiaryState, SetDropDownValue2>(
      _setDropDownValue2Reducers),
  TypedReducer<DiaryState, SetDropDownValue3>(
      _setDropDownValue3Reducers),
  TypedReducer<DiaryState, SetIncludeExistingEvents>(
      _setIncludeExistingEventsReducers),
  TypedReducer<DiaryState, SetEventDropdownValue>(
      _setEventDropdownValueReducers),
  TypedReducer<DiaryState, SetLocation>(
      _setLocationReducers),
  TypedReducer<DiaryState, SetAPILoading>(
      _setAPILoadingReducer),
]);

DiaryState _addPhotosReducers(
    DiaryState state, AddPhotos action) {
  List<XFile>? photos = state.photos;
  List<XFile>? newPhotoList = [...?photos, ...?action.photos];
  return state.copyWith(photos: newPhotoList);
}

DiaryState _updatePhotosReducers(
    DiaryState state, UpdatePhotos action) {
  return state.copyWith(photos: action.photos);
}

DiaryState _updateCommentReducers(
    DiaryState state, UpdateComment action) {
  return state.copyWith(comment: action.comment);
}

DiaryState _updateTagsReducers(
    DiaryState state, UpdateTags action) {
  return state.copyWith(tags: action.tags);
}

DiaryState _setIncludeGalleryReducers(
    DiaryState state, SetIncludeGallery action) {
  return state.copyWith(includeGallery: action.includeGallery);
}

DiaryState _setDropDownValue1Reducers(
    DiaryState state, SetDropDownValue1 action) {
  return state.copyWith(dropDownValue1: action.dropDownValue);
}

DiaryState _setDropDownValue2Reducers(
    DiaryState state, SetDropDownValue2 action) {
  return state.copyWith(dropDownValue2: action.dropDownValue);
}

DiaryState _setDropDownValue3Reducers(
    DiaryState state, SetDropDownValue3 action) {
  return state.copyWith(dropDownValue3: action.dropDownValue);
}

DiaryState _setIncludeExistingEventsReducers(
    DiaryState state, SetIncludeExistingEvents action) {
  return state.copyWith(includeExistingEvents: action.includeExistingEvents);
}

DiaryState _setEventDropdownValueReducers(
    DiaryState state, SetEventDropdownValue action) {
  return state.copyWith(eventDropdownValue: action.dropDownValue);
}

DiaryState _setLocationReducers(
    DiaryState state, SetLocation action) {
  return state.copyWith(location: action.location);
}

DiaryState _setAPILoadingReducer(
    DiaryState state, SetAPILoading action) {
  return state.copyWith(apiLoading: action.apiLoading);
}