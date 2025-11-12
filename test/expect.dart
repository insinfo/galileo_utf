import 'package:test/test.dart' as ut;

void listEquals<T>(Iterable<T> a, Iterable<T> b, [String? message]) {
  ut.expect(b, ut.orderedEquals(a), reason: message);
}

void equals(Object? a, Object? b) {
  ut.expect(b, ut.equals(a));
}

void stringEquals(String a, String b, [String? message]) {
  ut.expect(b, ut.equals(a), reason: message);
}

void isFalse(Object? value) {
  ut.expect(value, ut.isFalse);
}
