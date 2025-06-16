import 'package:meta/meta.dart';

/// Represents a result that can either be [Left] (failure or left-hand value)
/// or [Right] (success or right-hand value).
@sealed
abstract class Result<L extends Object, R extends Object?> {
  /// Creates a [Result] representing a failure or a left-hand value.
  const factory Result.left(L left) = Left;

  /// Creates a [Result] representing a success or a right-hand value.
  const factory Result.right(R right) = Right;

  /// Extracts the right-hand (success) value or throws an exception if it's a left-hand (failure) value.
  R getOrThrow();

  /// Extracts the right-hand (success) value or provides a fallback using the left-hand (failure) value.
  R getOrElse(R Function(L left) orElse);

  /// Extracts the right-hand (success) value or returns a default.
  R getOrDefault(R defaultValue);

  /// Returns the right-hand (success) value or `null` if the result is a left-hand (failure) value.
  R? getOrNull();

  /// Returns the left-hand (failure) value or `null` if the result is a right-hand (success) value.
  L? exceptionOrNull();

  /// Returns `true` if this is a left-hand (failure) value.
  bool isLeft();

  /// Returns `true` if this is a right-hand (success) value.
  bool isRight();

  /// Transforms the result by applying a function to either the left-hand (failure) or right-hand (success) value.
  W fold<W>(W Function(L left) onLeft, W Function(R right) onRight);

  /// Maps the right-hand (success) value to another type.
  Result<L, T> map<T extends Object?>(T Function(R right) fn);

  /// Executes a side effect for the right-hand (success) value.
  Result<L, R> onRight(void Function(R right) action);

  /// Executes a side effect for the left-hand (failure) value.
  Result<L, R> onLeft(void Function(L left) action);
}

@immutable
class Right<L extends Object, R extends Object?> implements Result<L, R> {
  const Right(this._rightValue);
  final R _rightValue;

  @override
  bool isLeft() => false;

  @override
  bool isRight() => true;

  @override
  W fold<W>(W Function(L left) onLeft, W Function(R right) onRight) =>
      onRight(_rightValue);

  @override
  R getOrThrow() => _rightValue;

  @override
  R getOrElse(R Function(L left) orElse) => _rightValue;

  @override
  R getOrDefault(R defaultValue) => _rightValue;

  @override
  R? getOrNull() => _rightValue;

  @override
  L? exceptionOrNull() => null;

  @override
  Result<L, R> onRight(void Function(R right) action) {
    action(_rightValue);
    return this;
  }

  @override
  Result<L, R> onLeft(void Function(L left) action) => this;

  @override
  Result<L, T> map<T extends Object?>(T Function(R right) fn) => Right<L, T>(fn(_rightValue));

  @override
  int get hashCode => _rightValue.hashCode;

  @override
  bool operator ==(Object other) =>
      other is Right && other._rightValue == _rightValue;
}

@immutable
class Left<L extends Object, R extends Object?> implements Result<L, R> {
  const Left(this._leftValue);
  final L _leftValue;

  @override
  bool isLeft() => true;

  @override
  bool isRight() => false;

  @override
  W fold<W>(W Function(L left) onLeft, W Function(R right) onRight) =>
      onLeft(_leftValue);

  @override
  R getOrThrow() => throw _leftValue;

  @override
  R getOrElse(R Function(L left) orElse) => orElse(_leftValue);

  @override
  R getOrDefault(R defaultValue) => defaultValue;

  @override
  R? getOrNull() => null;

  @override
  L? exceptionOrNull() => _leftValue;

  @override
  Result<L, R> onRight(void Function(R right) action) => this;

  @override
  Result<L, R> onLeft(void Function(L left) action) {
    action(_leftValue);
    return this;
  }

  @override
  Result<L, T> map<T extends Object?>(T Function(R right) fn) => Left<L, T>(_leftValue);

  @override
  int get hashCode => _leftValue.hashCode;

  @override
  bool operator ==(Object other) =>
      other is Left && other._leftValue == _leftValue;
}
