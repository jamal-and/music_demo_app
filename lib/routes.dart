import 'package:get/get.dart';
import 'package:music_app/core/injection.dart';
import 'package:music_app/ui/screens/account/account_screen.dart';
import 'package:music_app/ui/screens/album/album_screen.dart';
import 'package:music_app/ui/screens/artist/artist_screen.dart';
import 'package:music_app/ui/screens/login/login_screen.dart';
import 'package:music_app/ui/screens/login_email/email_login_screen.dart';
import 'package:music_app/ui/screens/main/main_screen.dart';
import 'package:music_app/ui/screens/player/player_screen.dart';
import 'package:music_app/ui/screens/privacy_policy/prvcyp_screen.dart';
import 'package:music_app/ui/screens/settings/settings_screen.dart';
import 'package:music_app/ui/screens/signup/signup_screen.dart';
import 'package:music_app/ui/screens/splash/splash_screen.dart';
import 'package:music_app/ui/screens/support/support_screen.dart';

const String routeSplash = '/';
const String routeLogin = '/login';
const String routeSignup = '/signup';
const String routeEmailLogin = '/email_login';
const String routeHome = '/home';
const String routeSettings = '/settings';
const String routeAccount = '/account';
const String routeSupport = '/support';
const String routePrivacyPolicy = '/priavacy_policy';
const String routeAlbum = '/album';
const String routePlayer = '/player';
const String routeArtist = '/artist';

List<GetPage> routes = [
  GetPage(
    name: routeSplash,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: routeLogin,
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: routeSignup,
    page: () => const SignupScreen(),
  ),
  GetPage(
    name: routeEmailLogin,
    page: () => const EmailLoginScreen(),
  ),
  GetPage(
    name: routeHome,
    page: () => const MainScreen(),
    binding: AppBinding(),
    children: <GetPage>[
      GetPage(
        name: routeSettings,
        page: () => const SettingsScreen(),
        children: [
          GetPage(
            name: routeAccount,
            page: () => const AccountScreen(),
          ),
          GetPage(
            name: routeSupport,
            page: () => const SupportScreen(),
          ),
          GetPage(
            name: routePrivacyPolicy,
            page: () => const PrivacyPolicyScreen(),
          ),
        ],
      ),
      GetPage(
        name: routeAlbum,
        page: () => const AlbumScreen(),
      ),
      GetPage(
        name: routePlayer,
        page: () => const PlayerScreen(),
      ),
      GetPage(
        name: routeArtist,
        page: () => const ArtistScreen(),
      ),
    ],
  ),
];
