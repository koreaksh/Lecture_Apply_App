import 'package:flutter/material.dart';

class AppbarBlackClose extends StatelessWidget {
  const AppbarBlackClose({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.close,
          color: Color(0xff707070),
        ));
  }
}