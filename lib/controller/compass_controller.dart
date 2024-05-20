import 'dart:async';

import 'package:flutter/material.dart';
import 'package:seeker/services/compass_service.dart';

class CompassController with ChangeNotifier {
  final CompassService _compassService = CompassService();
  StreamSubscription<double>? _compassHeadingSubscription;
  StreamSubscription<String>? _compassDirectionSubscription;
  double? compassHeading;
  String? compassDirection;

  CompassController() {
    _compassService.compassHeadingStream?.listen((event) {
      compassHeading = event;
      notifyListeners();
    });
    _compassService.compassDirectionStream?.listen((event) {
      compassDirection = event;
      notifyListeners();
    });

    @override
    void dispose() {
      _compassHeadingSubscription?.cancel();
      _compassDirectionSubscription?.cancel();
      super.dispose();
    }
  }
}
