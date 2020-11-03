import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({this.msg});

  final String msg;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(
            height: 250,
            child: FlareActor(
              "assets/flare/empty.flr",
              animation: "idle",
            ),
          ),
          Text(
            msg ?? "",
            style: const TextStyle(fontSize: 17),
          )
        ],
      ),
    );
  }
}
