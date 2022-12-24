import 'package:flutter/material.dart';
import 'package:my_compta_app/views/main-views/main.dart';
import 'package:my_compta_app/workers/main.dart';

import 'constants/memory.dart';

void main() async {
  await initWorders();
  amoun ();
  runApp(MyApp());
}
