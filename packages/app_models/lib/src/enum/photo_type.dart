enum PhotoType {
  None,
  Restaurant,
  Recipe,
  Waiter,
  // Special for user.
  User,
}

extension PhotoTypeExtension on PhotoType {
  String get vnText {
    switch (this) {
      case PhotoType.Restaurant:
        return "restaurant";
      case PhotoType.Recipe:
        return "recipe";
      case PhotoType.Waiter:
        return "waiter";
      case PhotoType.User:
        return "user";
      default:
        return "none";
    }
  }

  static PhotoType fromString(String text) {
    switch (text) {
      case 'restaurant':
        {
          return PhotoType.Restaurant;
        }
      case 'recipe':
        {
          return PhotoType.Recipe;
        }
      case 'waiter':
        {
          return PhotoType.Waiter;
        }
      case 'user':
        {
          return PhotoType.User;
        }
      default:
        return PhotoType.None;
    }
  }
}
