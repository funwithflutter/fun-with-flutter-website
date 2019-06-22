import 'package:flutter_web/material.dart';

// TODO(Anyone): Remove this if not used

Widget header1(String val) {
  return Text(val, style: TextStyle(fontFamily: 'WorkSans', fontSize: 28));
}

Widget body1(String val, {FontWeight weight = FontWeight.normal}) {
  return Text(val,
      style:
          TextStyle(fontFamily: 'WorkSans', fontSize: 18, fontWeight: weight));
}

Widget paragraph(List<String> val, List<bool> type) {
  return Column(
    children: <Widget>[
      for (var i = 0; i < val.length; i++) convert(val[i], type[i])
    ],
  );
}

Widget convert(String val, bool bo) {
  if (bo) {
    return body1(val, weight: FontWeight.bold);
  } else {
    return body1(val, weight: FontWeight.normal);
  }
}
