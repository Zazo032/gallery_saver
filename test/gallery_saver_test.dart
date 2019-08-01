import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gallery_saver/gallery_saver.dart';

void main() {
  const MethodChannel channel = MethodChannel('gallery_saver');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      switch (methodCall.method) {
        case 'saveImage':
          return 'image saved';
        case 'saveVideo':
          return 'video saved';
      }
      return 'unknown method';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('save image', () async {
    expect(await GallerySaver.saveImage('/storage/emulated/...'),
        'image saved');
  });

  test('save video', () async {
    expect(await GallerySaver.saveVideo('/storage/emulated/...'),
        'video saved');
  });
}
