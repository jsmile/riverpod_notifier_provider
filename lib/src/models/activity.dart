import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.freezed.dart';
part 'activity.g.dart';

@freezed
class Activity with _$Activity {
  const factory Activity({
    required String activity, // corrected from 'activity'
    required double accessibility,
    required String type,
    required int participants,
    required double price,
    required String key,
  }) = _Activity;

  // for json_serializable & edition
  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);

  // for initializtion
  factory Activity.empty() => const Activity(
        activity: '',
        accessibility: 0.0,
        type: '',
        participants: 0,
        price: 0.0,
        key: '',
      );
}

final activityTypes = [
  'education',
  'recreational',
  'social',
  'diy',
  'charity',
  'cooking',
  'relaxation',
  'music',
  'busywork',
];
