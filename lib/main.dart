import 'package:flutter/material.dart';
import 'package:flutter_feed_app/src/app.dart';
import 'package:flutter_feed_app/utils/riverpod_logger/state_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(observers: const [StateLogger()], child: MyApp()));
}
