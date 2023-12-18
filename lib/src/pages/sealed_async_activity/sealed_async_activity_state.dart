import '../../models/activity.dart';

sealed class SealedAsyncActivityState {
  SealedAsyncActivityState();
}

class SealedAsyncActivityInitial extends SealedAsyncActivityState {
  SealedAsyncActivityInitial();

  @override
  String toString() {
    return 'SealedAsyncActivityInitial()';
  }
}

class SealedAsyncActivityLoading extends SealedAsyncActivityState {
  SealedAsyncActivityLoading();

  @override
  String toString() {
    return 'SealedAsyncActivityLoading()';
  }
}

class SealedAsyncActivitySuccess extends SealedAsyncActivityState {
  final Activity activity;

  SealedAsyncActivitySuccess({
    required this.activity,
  });

  @override
  String toString() {
    return 'SealedAsyncActivitySuccess(activity: $activity)';
  }
}

class SealedAsyncActivityFailure extends SealedAsyncActivityState {
  final String error;

  SealedAsyncActivityFailure({
    required this.error,
  });

  @override
  String toString() {
    return 'SealedAsyncActivityFailure(error: $error)';
  }
}
