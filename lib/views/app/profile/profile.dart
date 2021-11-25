// Created by Mohammed Sadiq on 30-08-2021

part of '../app_extensions.dart';

class QProfile {
  QProfile._();

  StateNotifierProvider<_CurrentProfileController, AuthDetails?> get current => _controller;

  Future<bool> profileDetails() async {
    final completer = Completer<bool>();



    return completer.future;
  }
}

final _controller = StateNotifierProvider<_CurrentProfileController, AuthDetails?>(
      (ref) {
    return _CurrentProfileController();
  },
);

class _CurrentProfileController extends StateNotifier<AuthDetails?> {
  _CurrentProfileController() : super(null);

  void onUpdate({required AuthDetails authDetails}) {
    state = authDetails;
  }

  void onLogIn({
    required AuthDetails authDetails,
  }) {
    state = authDetails;
  }

  void onLogOut() async {
    state = null;
  }
}
