/// User app route paths.
///
/// Align with [AppPaths] in the authentication package where dashboard
/// and shell routes are configured.
class UserPaths {
  UserPaths._();

  static const String home = '/home';
  static const String category = '/category';
  static const String orders = '/orders';
  static const String search = '/search';
  static const String setLocation = '/set-Location';
  static const String profile = '/profile';
  static const String services = '/services';
  static const String notifications = '/notifications';
  static const String serviceDetails = '/service-details';
  static const String serviceDetails2 = '/service-details2';
  static const String serviceDetails3 = '/service-details3';
  static String serviceDetailsSummarywithid({int? id}) =>
      id == null
          ? '/service-details-summary/:id'
          : '/service-details-summary/$id';
  // static const String serviceDetailsSummary = '/service-details-summary/:id';
  static const String storiesScreen = '/stories-screen';
}
