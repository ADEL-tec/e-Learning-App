import 'common/routes/bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/service/storage_service.dart';

class Global {
  Global._();
  static late StorageService storageService;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    Bloc.observer = MyGlobalObseerver();
    await Firebase.initializeApp();
    storageService = await StorageService().init();
  }
}
