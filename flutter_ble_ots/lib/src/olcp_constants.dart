// ignore_for_file: constant_identifier_names

abstract class OLCPConstants {
  /* commands */
  static const FIRST = 0x01;
  static const LAST = 0x02;
  static const PREVIOUS = 0x03;
  static const NEXT = 0x04;
  static const GO_TO = 0x05;
  static const ORDER = 0x06;
  static const REQUEST_NUMBER_OF_OBJECTS = 0x07;
  static const CLEAR_MARKING = 0x08;
  static const RESPONSE_CODE = 0x70;

  /* responses */
  static const SUCCESS = 0x01;
  static const OP_CODE_NOT_SUPPORTED = 0x02;
  static const INVALID_PARAMETER = 0x03;
  static const OPERATION_FAILED = 0x04;
  static const OUT_OF_BOUNDS = 0x05;
  static const TOO_MANY_OBJECTS = 0x06;
  static const NO_OBJECT = 0x07;
  static const OBJECT_ID_NOT_FOUND = 0x08;
}
