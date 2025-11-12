# galileo_utf

[![Pub Package](https://img.shields.io/pub/v/galileo_utf.svg)](https://pub.dev/packages/galileo_utf)
[![CI](https://github.com/insinfo/galileo_utf/actions/workflows/dart.yml/badge.svg)](https://github.com/insinfo/galileo_utf/actions/workflows/dart.yml)

Utility helpers and codecs for working with Unicode in pure Dart.
The package exposes fast UTF-8/16/32 encoders, decoders, iterable
transformers, and convenience methods for stepping between strings,
code units, and code points in a null-safe API surface.

## Highlights

- Decode or encode UTF-8/UTF-16/UTF-32 byte sequences without materializing
	intermediate buffers.
- Stream transformers for UTF-8 that can be composed with `Stream<List<int>>`
	pipelines.
- Helpers such as `stringToCodepoints` that bridge String code units and
	Unicode scalar values.
- Configurable replacement code points so consumers can choose between strict
	validation and lossy decoding.

## Install

Add the dependency in your `pubspec.yaml`:

```yaml
dependencies:
	galileo_utf: ^3.0.0
```

Then install:

```bash
dart pub get
```

## Quick start

```dart
import 'package:galileo_utf/galileo_utf.dart';

void main() {
	const phrase = 'Îñţérñåţîöñåļîžåţîờñ';

	// UTF-8 round-trip
	final utf8Bytes = encodeUtf8(phrase);
	final decoded = decodeUtf8(utf8Bytes);

	// Work with code points directly
	final codepoints = stringToCodepoints(phrase);
	final utf16 = codepointsToUtf16CodeUnits(codepoints);

	print(decoded); // Îñţérñåţîöñåļîžåţîờñ
	print('Code points: ${codepoints.length}, UTF-16 units: ${utf16.length}');
}
```

For streaming workloads, use the provided transformers:

```dart
final stream = Stream.value(encodeUtf8('Hello 👋'));
await for (final chunk in stream.transform(Utf8DecoderTransformer())) {
	print(chunk); // Hello 👋
}
```

## Tooling

- Format: `dart format .`
- Static analysis: `dart analyze --fatal-infos --fatal-warnings`
- Tests: `dart test`

## Contributing

Issues and pull requests are welcome. Please run the formatter,
analyzer, and test suite locally before opening a PR. By contributing,
you agree that your work will be licensed under the BSD license included
in this repository.

## License

BSD 3-Clause. See [LICENSE](LICENSE).

