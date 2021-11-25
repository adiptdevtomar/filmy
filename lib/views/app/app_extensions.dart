import 'dart:async';
import 'dart:developer';

import 'package:filmy/domain/models/auth_details.dart';
import 'package:filmy/views/app/routes/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'routes/access.dart';
part 'routes/paths_registry.dart';
part 'profile/profile.dart';

class QAppX{
  QAppX._();

  static QRouter router = QRouter._();

  static QProfile profile = QProfile._();
}