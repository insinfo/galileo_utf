library galileo_utf.utf_test;

import 'package:test/test.dart';
import "package:galileo_utf/galileo_utf.dart";

import "expect.dart" as expect;

main() {
  test('utf', () {
    String str = new String.fromCharCodes([0x1d537]);
    // String.codeUnits gives 16-bit code units, but stringToCodepoints gives
    // back the original code points.
    expect.listEquals([0xd835, 0xdd37], str.codeUnits);
    expect.listEquals([0x1d537], stringToCodepoints(str));
  });
}
