import 'package:get/get.dart';
import '../../modules/confirmation/bindings/confirmation_binding.dart';
import '../../modules/confirmation/views/confirmation_view.dart';
import '../../modules/create_pin/bindings/create_pin_binding.dart';
import '../../modules/create_pin/views/create_pin_view.dart';
import '../../modules/enter_pin/bindings/enter_pin_binding.dart';
import '../../modules/enter_pin/views/enter_pin_view.dart';
import '../../modules/home/views/home_view.dart';
import '../../modules/onboarding/bindings/onboarding_binding.dart';
import '../../modules/onboarding/views/onboarding_view.dart';
import '../../modules/otp_authentication/bindings/otp_authentication_binding.dart';
import '../../modules/otp_authentication/views/otp_authentication_view.dart';
import '../../modules/password_recovery/bindings/password_recovery_binding.dart';
import '../../modules/password_recovery/views/password_recovery_view.dart';
import '../../modules/reset_password/bindings/reset_password_binding.dart';
import '../../modules/reset_password/views/reset_password_view.dart';
import '../../modules/sign_in/bindings/sign_in_binding.dart';
import '../../modules/sign_in/views/sign_in_view.dart';
import '../../modules/sign_up/bindings/sign_up_binding.dart';
import '../../modules/sign_up/views/sign_up_view.dart';
import '../../modules/splash/bindings/splash_binding.dart';
import '../../modules/splash/views/splash_view.dart';
import '../../modules/home/bindings/home_binding.dart';
import '../../modules/update_profile/bindings/update_profile_binding.dart';
import '../../modules/update_profile/views/update_profile_view.dart';
import '../../modules/verify_identity/bindings/verify_identity_binding.dart';
import '../../modules/verify_identity/views/verify_identity_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.onboarding,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.signIn,
      page: () => const SignInView(),
      binding: SignInBinding(),
      transition: Transition.fadeIn,
      showCupertinoParallax: true,
    ),
    GetPage(
      name: Routes.passwordRecovery,
      page: () => const PasswordRecoveryView(),
      binding: PasswordRecoveryBinding(),
      transition: Transition.fadeIn,
      showCupertinoParallax: true,
    ),
    GetPage(
      name: Routes.verifyIdentity,
      page: () => const VerifyIdentityView(),
      binding: VerifyIdentityBinding(),
      transition: Transition.fadeIn,
      showCupertinoParallax: true,
    ),
    GetPage(
      name: Routes.signUp,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
      transition: Transition.fadeIn,
      showCupertinoParallax: true,
    ),
    GetPage(
      name: Routes.resetPassword,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
      transition: Transition.fadeIn,
      showCupertinoParallax: true,
    ),
    GetPage(
      name: Routes.otpAuthentication,
      page: () => const OTPAuthenticationView(),
      binding: OTPAuthenticationBinding(),
      transition: Transition.fadeIn,
      showCupertinoParallax: true,
    ),
    GetPage(
      name: Routes.updateProfile,
      page: () => const UpdateProfileView(),
      binding: UpdateProfileBinding(),
      transition: Transition.fadeIn,
      showCupertinoParallax: true,
    ),
    GetPage(
      name: Routes.createPin,
      page: () => const CreatePinView(),
      binding: CreatePinBinding(),
      transition: Transition.fadeIn,
      showCupertinoParallax: true,
    ),
    GetPage(
      name: Routes.enterPin,
      page: () => const EnterPinView(),
      binding: EnterPinBinding(),
      transition: Transition.fadeIn,
      showCupertinoParallax: true,
    ),
    GetPage(
      name: Routes.confirmation,
      page: () => const ConfirmationView(),
      binding: ConfirmationBinding(),
      transition: Transition.fadeIn,
      showCupertinoParallax: true,
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
      showCupertinoParallax: true,
    ),
  ];
}
