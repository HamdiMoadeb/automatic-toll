class MediaRes {
  const MediaRes._();

  static const _baseVector = 'assets/vectors';
  static const _baseImage = 'assets/images';
  static const _baseLottie = 'assets/lottie';
  static const _baseIcon = 'assets/icons';

  // Vectors
  static const payToll = '$_baseVector/pay_toll.png';
  static const tollAlert = '$_baseVector/toll_alert.png';
  static const tollTrip = '$_baseVector/toll_trip.png';

  /// Backgrounds
  static const onBoardingBackground = '$_baseImage/onBoarding_background.png';
  static const authGradientBackground =
      '$_baseImage/auth_gradient_background.png';
  static const homeGradientBackground =
      '$_baseImage/home_gradient_background.png';
  static const profileGradientBackground =
      '$_baseImage/profile_gradient_background.png';
  static const documentsGradientBackground =
      '$_baseImage/documents_gradient_background.png';
  static const leaderboardGradientBackground =
      '$_baseImage/leaderboard_gradient_background.png';

  // Icons
  static const user = '$_baseIcon/user.png';

  // Lottie
  static const emptyLeaderboard = '$_baseLottie/empty_leaderboard.json';
  static const noNotifications = '$_baseLottie/no_notifications.json';
  static const pageUnderConstruction =
      '$_baseLottie/page_under_construction.json';
}