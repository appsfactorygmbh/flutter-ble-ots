import 'dart:typed_data';

class Utils {
static int getIntFromBoolList(List<bool> bools) {
  if (bools.length != 8) {
    throw ArgumentError('bools list should have exactly 8 elements');
  }
  int result = 0;
  for (int i = 0; i < bools.length; i++) {
    if (bools[i]) {
      result += (1 << (7 - i));
    }
  }
  return result;
}

  static List<bool> getBoolListFromIntList(List<int> list, int bits) => getBoolListFromHex(getDecimalFromUint8List(Uint8List.fromList(list)), bits);

  /// Convert a bitmap to a [List] of [bool]s.
  ///
  /// [val] is the bitmap, [bits] is the number of relevant bits and therefore
  /// the length of the returned list.
  ///
  /// Assumes the bits are in the least significant bits of [val].
  static List<bool> getBoolListFromHex(int val, int bits) {
    List<bool> list = List.generate(bits, (index) => false);
    int mask = 1 << (bits - 1);
    for (var i = 0; i < bits; i++, mask >>= 1) {
      list[i] = val & mask != 0;
    }
    return list.reversed.toList();
  }

  static int getDecimalFromUint8List(Uint8List list) => ByteData.view(list.buffer).getInt16(0, Endian.little);

  static List<int> getIntListFromDecimal(int decimal, int length) {
    return List.generate(length, (index) => index == length - 1 ? decimal : 0x00);
  }

  static List<int> getIntAsByteArray(int number) {
    ByteData byteData = ByteData(Int32List.bytesPerElement);
    byteData.setInt32(0, number, Endian.little);
    return byteData.buffer.asUint8List().toList();
  }

  static List<List<int>> splitArrayIntoChunks(List<int> objectToSend, int chunkSize) {
    List<List<int>> listOfSlices = [];
    int remainder = objectToSend.length % chunkSize;
    int count = objectToSend.length ~/ chunkSize;
    if (remainder != 0) {
      count++;
    }

    for (int x = 0; x < count; x++) {
      int startIndex = x * chunkSize;
      if (remainder + startIndex != objectToSend.length) {
        listOfSlices.add(objectToSend.sublist(startIndex, startIndex + chunkSize));
      } else {
        listOfSlices.add(objectToSend.sublist(startIndex, startIndex + remainder));
      }
    }
    return listOfSlices;
  }

  static List<int> splitArrayTillMaxSize(int startIndex, int maxSize, List<int> objectChunk) {
  int size = maxSize - 1;
  int targetIndex = startIndex + size;
  if (targetIndex >= objectChunk.length) {
    targetIndex = objectChunk.length - 1;
  }

  return objectChunk.sublist(startIndex, targetIndex + 1);
}

}
