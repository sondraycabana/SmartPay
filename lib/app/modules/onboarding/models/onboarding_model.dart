import '../../../constants/asset_paths.dart';

class OnboardingModel {
  final String backgroundImagePath, headline, body;

  OnboardingModel({
    required this.backgroundImagePath,
    required this.headline,
    required this.body,
  });

  static List<OnboardingModel> get onboardingPages => [
        OnboardingModel(
          backgroundImagePath: AssetPath.onboardingImage1,
          headline: "Finance app the safest\nand most trusted",
          body:
              'Your finance work starts here. Our here to help you track and deal with speeding up your transactions.',
        ),
        OnboardingModel(
          backgroundImagePath: AssetPath.onboardingImage2,
          headline: "The fastest transaction\nprocess only here",
          body:
              "Get easy to pay all your bills with just a few steps. Paying your bills become fast and efficient.",
        ),
      ];
}
