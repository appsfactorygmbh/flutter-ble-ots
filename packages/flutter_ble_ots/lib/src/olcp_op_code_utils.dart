import 'olcp_constants.dart';

abstract class OlcpOpCodeUtils {
  static List<int> getOLCPAsByteArray(int opCode, List<int> id) {
    if ((opCode >= 1 && opCode < 8) || opCode == OLCPConstants.RESPONSE_CODE) {
      return [opCode] + id;
    } else {
      throw Exception('OLCPOpCodeNotSupportedException($opCode)');
    }
  }
  
}
