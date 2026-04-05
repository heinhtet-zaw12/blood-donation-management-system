class DonateNotifierState {
  final bool isLoading;
  final bool isSuccess;
  final bool isFailed;

  DonateNotifierState({
    required this.isLoading,
    required this.isSuccess,
    required this.isFailed,
  });

  DonateNotifierState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isFailed,
  }) {
    return DonateNotifierState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailed: isFailed ?? this.isFailed,
    );
  }
}