import 'dart:developer';

import 'package:flutter/foundation.dart';

void logging(Object message, {String name = ''}) {
  if (!kReleaseMode) log(message.toString(), name: name);
}
