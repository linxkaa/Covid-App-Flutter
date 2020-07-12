import 'package:flutter/material.dart';

Future<void> bottomSheetLoginPage(BuildContext context, Widget child) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: child,
      ),
    ),
  );
}
