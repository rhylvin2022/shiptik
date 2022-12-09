import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../redux/app_state.dart';
import 'package:redux/redux.dart';

import '../../../redux/diary/diary_action.dart';

class ExistingEventsCard extends StatelessWidget {
  ExistingEventsCard({Key? key}) : super(key: key);

  List<String> eventList = <String>[
    'Birth Day',
    'Thanksgiving',
    'Christmas',
    'Summer'
  ];

  @override
  Widget build(BuildContext context) {
    Store store = StoreProvider.of<AppState>(context);
    return StoreConnector<AppState, Map<String, dynamic>>(
      converter: (store) => {
        "includeExistingEvents": store.state.diaryState.includeExistingEvents,
        "eventDropdownValue": store.state.diaryState.eventDropdownValue,
      },
      builder: (context, events) => Card(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Link to existing events?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey[600]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: SizedBox(
                        height: 25,
                        width: 25,
                        child: Checkbox(
                          activeColor: Colors.lightGreen,
                          checkColor: Colors.white,
                          value: events["includeExistingEvents"] ?? false,
                          onChanged: (bool? value) {
                            store.dispatch(SetIncludeExistingEvents(
                                includeExistingEvents: value ?? false));
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 0.5,
                endIndent: 10,
                indent: 10,
                color: Colors.grey,
              ),
              events["includeExistingEvents"]
                  ? SizedBox(
                      width: (MediaQuery.of(context).size.width * 0.85),
                      child: DropdownButton(
                        items: eventList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                color: Colors.black87,
                              ),
                            ),
                          );
                        }).toList(),
                        isExpanded: true,
                        hint: const Text(
                          "Select an event",
                          style: TextStyle(color: Colors.black38),
                        ),
                        // value: dropDownValue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        elevation: 16,
                        style: const TextStyle(color: Colors.grey),
                        underline: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                        onChanged: (String? value) {
                          store.dispatch(SetEventDropdownValue(
                              dropDownValue: value.toString()));
                        },
                        value: (events["eventDropdownValue"].toString() == "")
                            ? null
                            : events["eventDropdownValue"].toString(),
                      ),
                    )
                  : Container(),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
