import '../../models/activity.dart';

sealed class SealedActivityState {
  SealedActivityState();
}

class SealedActivityInitial extends SealedActivityState {
  SealedActivityInitial();

  @override
  String toString() {
    return 'SealedActivityInitial()';
  }
}

class SealedActivityLoading extends SealedActivityState {
  SealedActivityLoading();

  @override
  String toString() {
    return 'SealedActivityLoading()';
  }
}

class SealedActivitySuccess extends SealedActivityState {
  final Activity activity;

  SealedActivitySuccess({
    required this.activity,
  });

  @override
  String toString() {
    return 'SealedActivitySuccess(activity: $activity)';
  }
}

class SealedActivityFailure extends SealedActivityState {
  final String error;

  SealedActivityFailure({
    required this.error,
  });

  @override
  String toString() {
    return 'SealedActivityFailure(error: $error)';
  }
}
