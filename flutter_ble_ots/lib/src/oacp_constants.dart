// ignore_for_file: constant_identifier_names

abstract class OACPConstants {
  static const CREATE = 0x01;
  static const DELETE = 0x02;
  static const CALCULATE_CHECKSUM = 0x03;
  static const EXECUTE = 0x04;
  static const READ = 0x05;
  static const WRITE = 0x06;
  static const ABORT = 0x07;
  static const RESPONSE_CODE = 0x60;

  /* result codes */
  static const SUCCESS = 0x01;
  static const OP_CODE_NOT_SUPPORTED = 0x02;
  static const INVALID_PARAMETER = 0x03;
  static const INSUFFICIENT_RESOURCES = 0x04;
  static const INVALID_OBJECT = 0x05;
  static const CHANNEL_UNAVAILABLE = 0x06;
  static const UNSUPPORTED_TYPE = 0x07;
  static const PROCEDURE_NOT_PERMITTED = 0x08;
  static const OBJECT_LOCKED = 0x09;
  static const OPERATION_FAILED = 0x0A;
}
