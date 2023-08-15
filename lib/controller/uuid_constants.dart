import 'dart:typed_data';

import 'package:flutter_ble_ots/flutter_ble_ots.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

abstract class UuidConstants {
  static MetaDataUuids metaDataUuids = MetaDataUuids(
    featureDiscoveryUuid: Uuid.parse('2abd').data,
    oacpUuid: Uuid.parse('2ac5').data,
    objectIdUuid: Uuid.parse('2ac3').data,
    objectNameUuid: Uuid.parse('2abe').data,
    objectPropertiesUuid: Uuid.parse('2ac4').data,
    objectSizeUuid: Uuid.parse('2ac0').data,
    olcpUuid: Uuid.parse('2ac6').data,
    otsUuid: Uuid.parse('1825').data,
    transmissionUuid: Uuid.parse('3bc9').data,
  );

  static String getNameFromUuid(Uint8List uuid) {
    if (uuid == metaDataUuids.featureDiscoveryUuid) {
        return 'Feature Discovery';
    }else if (uuid == metaDataUuids.oacpUuid){
        return 'OACP';
      }else if (uuid == metaDataUuids.objectIdUuid){
        return 'Object ID';
      }else if (uuid == metaDataUuids.objectNameUuid){
        return 'Object Name';
      }else if (uuid == metaDataUuids.objectPropertiesUuid){
        return 'Object Properties';
      }else if (uuid == metaDataUuids.objectSizeUuid){
        return 'Object Size';
      }else if (uuid == metaDataUuids.olcpUuid){
        return 'OLCP';
      }else if (uuid == metaDataUuids.otsUuid){
        return 'OTS';
      }else if (uuid == metaDataUuids.transmissionUuid){
        return 'Transmission';
      }else{
        return 'Unknown';
    }
  }
}
