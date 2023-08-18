abstract class BluetoothUtils {
  static String getStringFromTransmittedCharArray(List<int> input) {
    final filtered = input.where((e) => e != 0).toList();
    return String.fromCharCodes(filtered);
  }
}
