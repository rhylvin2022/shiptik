import 'package:flutter/material.dart';
import 'diary/diary_state.dart';

@immutable
class AppState {
  final DiaryState diaryState;

  const AppState({
    required this.diaryState,
  });

  factory AppState.initial() {
    return AppState(
      diaryState: DiaryState.initial(),
    );
  }

  AppState copyWith({
    DiaryState? diaryState,
  }) =>
      AppState(
        diaryState: diaryState ?? this.diaryState,
      );
}
