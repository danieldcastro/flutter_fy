import 'result.dart';

/// Adds methods for converting any object
/// into a `Result` type (`Left` or `Right`).
extension ResultObjectExtension<W extends Object> on W {
  /// Converts the object to a `Result` type [Left].
  ///
  /// A `Left` represents a failure or an error case, using the object as the error value.
  /// Will throw an error if used on a `Result` or `Future` instance.
  Left<W, R> toLeft<R extends Object?>() {
    assert(
      this is! Result,
      'Don`t use the "toLeft()" method '
      'on instances of the Result.',
    );
    assert(
      this is! Future,
      'Don`t use the "toLeft()" method '
      'on instances of the Future.',
    );

    return Left<W, R>(this);
  }

  /// Converts the object to a `Result` type [Right].
  ///
  /// A `Right` represents a success case, using the object as the success value.
  /// Will throw an error if used on a `Result` or `Future` instance.
  Right<L, W> toRight<L extends Object>() {
    assert(
      this is! Result,
      'Don`t use the "toRight()" method '
      'on instances of the Result.',
    );
    assert(
      this is! Future,
      'Don`t use the "toRight()" method '
      'on instances of the Future.',
    );
    return Right<L, W>(this);
  }
}
