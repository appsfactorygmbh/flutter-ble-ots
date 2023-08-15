import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta_data_uuids.freezed.dart';

@freezed
class MetaDataUuids with _$MetaDataUuids {
  const factory MetaDataUuids({
    required Uint8List oacpUuid,
    required Uint8List olcpUuid,
    required Uint8List objectIdUuid,
    required Uint8List objectNameUuid,
    required Uint8List objectSizeUuid,
    required Uint8List objectPropertiesUuid,
    required Uint8List otsUuid,
    required Uint8List featureDiscoveryUuid,
    required Uint8List transmissionUuid,
  }) = _MetaDataUuids;
}
