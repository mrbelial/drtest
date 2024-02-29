import 'package:flutter/material.dart';
import '../../tools/core.dart';

Widget _chatBox({
  required Widget body,
  required String date,
  required String time,
  required bool isClient,
}) {
  var img = Container(
    width: 65,
    height: 65,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage("assets/images/user.png"),
        fit: BoxFit.contain,
      ),
    ),
  );
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isClient) img,
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                body,
                const SizedBox(height: 10),
                Text("$date - $time"),
              ],
            ),
          ),
        ),
        if (isClient) img,
      ],
    ),
  );
}

Widget _chatContainer(Widget body) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: "e9ecef".toColor(),
    ),
    child: body,
  );
}

Widget messageBox({
  required String message,
  required String date,
  required String time,
  required bool isClient,
}) {
  return _chatBox(
    body: _chatContainer(Text(message)),
    date: date,
    time: time,
    isClient: isClient,
  );
}

Widget imageBox({
  required Widget image,
  required String date,
  required String time,
  required bool isClient,
}) {
  return _chatBox(
    body: _chatContainer(image),
    date: date,
    time: time,
    isClient: isClient,
  );
}

Widget audioBox({
  required Widget child,
  required String date,
  required String time,
  required bool isClient,
}) {
  return _chatBox(
    body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: "e9ecef".toColor(),
      ),
      child: child,
    ),
    date: date,
    time: time,
    isClient: isClient,
  );
}
