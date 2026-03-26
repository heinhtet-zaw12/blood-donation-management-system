class LogoutStateModel {
  final bool isLoading;
  final bool isSuccess;
  final bool isFailed;

  LogoutStateModel({required this.isLoading, required this.isSuccess, required this.isFailed});

  LogoutStateModel copyWith({ bool? isLoading,
   bool? isSuccess,
  bool? isFailed}){
    return LogoutStateModel(isLoading: isLoading ?? this.isLoading, isSuccess: isSuccess ?? this.isSuccess, isFailed: isFailed ?? this.isSuccess);
  }

}