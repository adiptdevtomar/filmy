part of 'view.dart';

final _vsProvider = StateNotifierProvider.autoDispose<_VSController, _ViewState>((ref) {
  final stateController = _VSController();
  stateController._checkForAlreadyStoredDetails();

  return stateController;
});

class _ViewState {
  final ViewStatus status;
  final ViewStatus isChecking;

  _ViewState({
    required this.status,
    required this.isChecking,
  });

  _ViewState.initial()
      : this(
          status: ViewStatus.init,
    isChecking: ViewStatus.loading,
        );

  _ViewState copyWith({
    ViewStatus? status,
    ViewStatus? isChecking,
  }) {
    return _ViewState(
      status: status ?? this.status,
      isChecking: isChecking ?? this.isChecking,
    );
  }
}

class _VSController extends StateNotifier<_ViewState> {
  late GoogleSignIn _googleSignIn;

  _VSController() : super(_ViewState.initial()) {
    _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
  }

  void _checkForAlreadyStoredDetails() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final authDetails = _prefs.getString(Names.authenticationDetailsKey);
    if (authDetails != null) {
      QAppX.router.push(HomeRouteView());
    } else {
      state = state.copyWith(
        isChecking: ViewStatus.success,
      );
    }
  }

  void _storeDetails(AuthDetails authDetails) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString(Names.authenticationDetailsKey, jsonEncode(authDetails.toJson()));
  }

  void onSkipPressed(){
    QAppX.router.push(HomeRouteView());
  }

  void onLoginTapped() async {
    state = state.copyWith(
      status: ViewStatus.loading,
    );
    try {
      var details = await _googleSignIn.signIn();
      if (details != null) {
        final authDetails = AuthDetails(
          name: details.displayName!,
          avatarUrl: details.photoUrl!,
          emailId: details.email,
        );
        _storeDetails(authDetails);
      } else {
        state = state.copyWith(
          status: ViewStatus.failed,
        );
      }
    } catch (e) {
      print(e.toString());
      state = state.copyWith(
        status: ViewStatus.failed,
      );
    } finally {
      state = state.copyWith(
        status: ViewStatus.init,
      );
    }
  }
}
