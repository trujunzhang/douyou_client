enum AppPermissionStatus {
  /// The permission wasn't requested yet.
  Undetermined,

  /// The user granted access to the requested feature.
  Granted,

  /// The user denied access to the requested feature.
  Denied,
}
