import 'package:flutter_test/flutter_test.dart';

import 'package:smart_progress_bar/smart_progress_bar.dart';

void main() {
  test('test progress bar exist', () {
    expect(() => showProgressBar(), throwsNoSuchMethodError);
  });
}
