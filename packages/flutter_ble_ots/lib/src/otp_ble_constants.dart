// ignore_for_file: constant_identifier_names

abstract class OtpBleConstants {
  static const sleepDuration = Duration(milliseconds: 10);
  static const maxSleepAmount = 10;

  static const idByteLength = 6;

  static const MAX_MTU = 256;
  static const MAX_TRANSMISSION_SIZE = 200;
  static const MAX_BULK_WRITE_SIZE = 4096;
  static const MAX_RETRY_COUNT = 3;

  static const OBJECT_SIZE_SIZE = 8;

  static const INT_SIZE = 4;
}
