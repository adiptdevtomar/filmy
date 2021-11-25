part of 'view.dart';

final _vsProvider = StateNotifierProvider.autoDispose<_VSController, _ViewState>((ref) {
  final stateController = _VSController();

  return stateController;
});

class _ViewState {
  final String searchText;

  _ViewState({
    required this.searchText,
  });

  _ViewState.initial()
      : this(
    searchText: '',
  );

  _ViewState copyWith({
    String? searchText,
  }) {
    return _ViewState(
      searchText: searchText ?? this.searchText,
    );
  }
}

class _VSController extends StateNotifier<_ViewState> {

  _VSController() : super(_ViewState.initial());

  void onSearchTextChanged(String text){
    state = state.copyWith(
      searchText: text,
    );
  }
}
