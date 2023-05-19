part of 'profile_cubit.dart';

@immutable
class ProfileState {
    final bool isLoading;

  const ProfileState({this.isLoading = true});

    ProfileState copyWith({
    final bool? isLoading,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

