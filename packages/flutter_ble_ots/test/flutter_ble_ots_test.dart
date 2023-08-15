import 'dart:developer';

import 'package:convert/convert.dart';
import 'package:flutter_ble_ots/flutter_ble_ots.dart';
import 'package:flutter_ble_ots/src/data_transformer.dart';
import 'package:flutter_ble_ots/src/oacp_constants.dart';
import 'package:flutter_ble_ots/src/oacp_op_code_utils.dart';
import 'package:flutter_ble_ots/src/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('getStringFromTransmittedCharArray should return correct name from hex', () {
    const inputAsString = 'Lock Serial Number';
    final input = [76, 111, 99, 107, 32, 83, 101, 114, 105, 97, 108, 32, 78, 117, 109, 98, 101, 114, 0, 0, 0, 0, 0];
    final name = BluetoothUtils.getStringFromTransmittedCharArray(input);

    expect(name, inputAsString);
  });

  test('test get int as byte array', () {
    final expectedResult = [127, 0, 0, 0];
    final actualResult = Utils.getIntAsByteArray(127);

    expect(actualResult, expectedResult);
  });

  test('getCurrentSizeFromByteArray should return 36', () {
    final array = [36, 0, 0, 0, 36, 0, 0, 0];
    final size = DataTransformer.getCurrentSizeFromByteArray(array);
    expect(size, 36);
  });

  test('test OACPOpCodeUtils.getReadRequest', () {
    const expectedResult = '0500000000c8000000';
    final readRequest = OacpOpCodeUtils.getReadRequest(0, 200);
    log('offset as bytearray ${Utils.getIntAsByteArray(0)}\n length as bytearray ${Utils.getIntAsByteArray(200)}');
    expect(hex.encode(readRequest), expectedResult);
  });

  test('test get write request', () {
    final expected = [6, 0, 0, 0, 0, 25, 0, 0, 0, 2];
    final request = OacpOpCodeUtils.getWriteRequest(0, 25, OacpOpCodeUtils.getModeByte(true));

    expect(request, expected);
  });

  test('test get execute request', () {
    final expected = [OACPConstants.EXECUTE];
    final request = OacpOpCodeUtils.getExecuteRequest();

    expect(request, expected);
  });

  test('test get mode byte', () {
    const expected = 2;
    final request = OacpOpCodeUtils.getModeByte(true);

    expect(request, expected);
  });

  // test('test send data', () {
  //   //  println("What is the printout? ${MetadataConstants.OPERATION_MODE_ID.contentToString()}")

  //       final dummyObject = CardConfiguration(255, byteArrayOf(1,1,1,1,1,1,1,1), 1, 1, 0);
  //       final features = const OACPFeatures(true,true,true,true,true,true,true,true,true,true);
  //       final properties = const ObjectProperties(write: true);
  //       final toSend = mapper.writefinalueAsBytes(dummyObject);
  //       final metaData = ObjectMetaData(id: [],
  //           objectProperties: properties,
  //           size : Utils.getIntAsByteArray(toSend.size), name: '',
  //       );

  //       final writeResult = writeCurrentObject(features, metaData, toSend)

  //       expect(writeResult, true);
  //       expect(toSend.size, receivedData.size);
  //       final res = mapper.readfinalue(receivedData, CardConfiguration::class.java)
  //       expect(res,dummyObject );
  // });
}
