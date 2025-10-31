/// {@template local_api_exception}
/// Error thrown when a local API operation fails
/// {@endtemplate}
final class LocalApiException implements Exception {
  /// Creates a [LocalApiException] instance
  const LocalApiException({
    required this.message,
    this.error,
    this.stackTrace,
  });

  /// Error message
  final String message;

  /// Original error
  final Object? error;

  /// Stack trace
  final StackTrace? stackTrace;

  @override
  String toString() => 'LocalApiException: $message';
}
