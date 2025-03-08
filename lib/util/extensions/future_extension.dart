import 'dart:async';

extension FutureExtension<T> on Future<T> {
  Future<T> timeout(
    Duration duration, {
    required Future<T> Function() onTimeout,
  }) {
    return Future.any([this, Future.delayed(duration, onTimeout)]);
  }

  Future<(T? data, Object? error)> tryCatch() async {
    try {
      final data = await this;
      return (data, null);
    } catch (e) {
      return (null, e);
    }
  }
}
