import 'package:my_getx_clean_architecture/app.dart';
import 'package:my_getx_clean_architecture/core/services/services.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(QuoteApp());
}
