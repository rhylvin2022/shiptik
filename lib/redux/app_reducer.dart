import 'app_state.dart';
import 'diary/diary_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    diaryState: diaryReducer(state.diaryState, action),
  );
}
