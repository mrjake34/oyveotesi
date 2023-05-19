part of 'verify_page_cubit.dart';

@immutable
class VerifyPageState {
  final bool isLoading;

  const VerifyPageState({this.isLoading = false});
  VerifyPageState copyWith({
    final bool? isLoading,
  }) {
    return VerifyPageState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
