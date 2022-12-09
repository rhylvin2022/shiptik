import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../redux/app_state.dart';
import 'package:redux/redux.dart';

import '../../../redux/diary/diary_action.dart';

class DetailsCard extends StatelessWidget {
  DetailsCard({Key? key}) : super(key: key);

  List<String> itemList = <String>['Car', 'Building', 'Food', 'Animal'];
  List<String> areaList = <String>['Park', 'Mall', 'Metropolitan', 'Beach'];
  List<String> categoryList = <String>['Clean', 'Meeting', 'Play', 'Work'];

  @override
  Widget build(BuildContext context) {
    Store store = StoreProvider.of<AppState>(context);
    return StoreConnector<AppState, Map<String, dynamic>>(
      converter: (store) => {
        "dropDownValue1": store.state.diaryState.dropDownValue1,
        "dropDownValue2": store.state.diaryState.dropDownValue2,
        "dropDownValue3": store.state.diaryState.dropDownValue3,
      },
      builder: (context, dropDownValue) => Card(
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
                      'Details',
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
              SizedBox(
                width: (MediaQuery.of(context).size.width * 0.85),
                child: DropdownButton(
                  items: itemList.map<DropdownMenuItem<String>>((String value) {
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
                    "Choose an item",
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
                    store.dispatch(
                        SetDropDownValue1(dropDownValue: value.toString()));
                  },
                  value: (dropDownValue["dropDownValue1"].toString() == "")
                      ? null
                      : dropDownValue["dropDownValue1"].toString(),
                ),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width * 0.85),
                child: DropdownButton(
                  items: areaList.map<DropdownMenuItem<String>>((String value) {
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
                    "Select Area",
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
                    store.dispatch(
                        SetDropDownValue2(dropDownValue: value.toString()));
                  },
                  value: (dropDownValue["dropDownValue2"].toString() == "")
                      ? null
                      : dropDownValue["dropDownValue2"].toString(),
                ),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width * 0.85),
                child: DropdownButton(
                  items: categoryList
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
                    "Task Category",
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
                    store.dispatch(
                        SetDropDownValue3(dropDownValue: value.toString()));
                  },
                  value: (dropDownValue["dropDownValue3"].toString() == "")
                      ? null
                      : dropDownValue["dropDownValue3"].toString(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: SizedBox(
                  width: (MediaQuery.of(context).size.width * 0.85),
                  height: 30,
                  child: TextField(
                    obscureText: false,
                    decoration: const InputDecoration(
                      hintText: 'Tags',
                      hintStyle: TextStyle(
                        color: Colors.black38,
                        fontSize: 13,
                      ),
                    ),
                    onChanged: (text) {
                      store.dispatch(UpdateTags(tags: text));
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
