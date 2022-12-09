import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shiptek/pages/diary/cards/components/api_loading_component.dart';
import 'package:shiptek/pages/diary/cards/existing_events_card.dart';
import 'package:shiptek/pages/diary/cards/components/next_button_component.dart';
import 'package:shiptek/pages/diary/cards/photo_card.dart';
import 'package:shiptek/pages/diary/site_diary.dart';
import 'package:shiptek/redux/diary/diary_action.dart';

import '../../redux/app_state.dart';
import 'cards/card_spacing.dart';
import 'cards/comments_card.dart';
import 'cards/details_card.dart';
import 'location.dart';
import 'package:redux/redux.dart';

class DiaryPage extends StatefulWidget {
  DiaryPage({Key? key}) : super(key: key);

  @override
  _DiaryPageState createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  Store<dynamic>? store;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      runInitTasks();
    });
  }

  @protected
  Future runInitTasks() async {
    store = StoreProvider.of<AppState>(context);
    store?.dispatch(GetLocation());
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
      converter: (store) => store.state.diaryState.apiLoading,
      builder: (context, apiLoading) => Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          leading: const Icon(Icons.close),
          title: const Text(
            'New Diary',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Location(),
                  Stack(
                    children: [
                      SiteDiary(),
                      Padding(
                        padding: const EdgeInsets.only(top: 45),
                        child: Center(
                          child: Column(
                            children: [
                              PhotoCard(),
                              const CardSpacing(),
                              CommentsCard(),
                              const CardSpacing(),
                              DetailsCard(),
                              const CardSpacing(),
                              ExistingEventsCard(),
                              const CardSpacing(),
                              const NextButtonComponent(),
                              const CardSpacing(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            APILoadingComponent(apiLoading: apiLoading),
          ],
        ),
      ),
    );
  }
}
