import 'package:freezed_annotation/freezed_annotation.dart';

import 'object_properties.dart';

part 'object_meta_data.freezed.dart';

@freezed
class ObjectMetaData with _$ObjectMetaData {
  const ObjectMetaData._();
  const factory ObjectMetaData({
    required List<int> id,
    required String name,
    @Default([]) List<int> type,
    required List<int> size,
    @Default('') String lastModified,
    required ObjectProperties objectProperties,
  }) = _ObjectMetaData;
}
