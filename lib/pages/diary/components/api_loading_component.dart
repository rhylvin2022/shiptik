import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class APILoadingComponent extends StatelessWidget {
  final bool apiLoading;

  const APILoadingComponent({Key? key, required this.apiLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return apiLoading
        ? Container(
            color: const Color.fromRGBO(255, 255, 255, 0.6),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Container();
  }
}
