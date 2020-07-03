import 'package:meta/meta.dart';

const blogTestingUrl = 'http://localhost:8000';
const blogProductionUrl = 'https://blog.funwith.app';

const funWithYouTubeUrl = 'https://www.youtube.com/funwithflutter';
const funWithYouTubeSubscribeUrl =
    'https://www.youtube.com/funwithflutter/?sub_confirmation=1';

const courseAnimationPerf =
    'https://courses.funwith.app/p/mastering-animation-in-flutter/?product_id=1679475&coupon_code=FUN';

const funWithGithubUrl = 'https://github.com/funwithflutter';
const funWithPatreon = 'https://www.patreon.com/funwithflutter';
const funWithTwitter = 'https://twitter.com/FunFlutter';
const funWithMedium = ''; // TODO(Gordon): medium

const flutterDev = 'https://flutter.dev';

const PackageUrl waveSliderPackage = PackageUrl(
    pubUrl: 'https://pub.dev/packages/wave_slider',
    youtubeUrl:
        'https://www.youtube.com/playlist?list=PLjr4ufdmNA4J2-KwMutexAjjf_VmjL1eH');
const PackageUrl splashTapPackage = PackageUrl(
    pubUrl: 'https://pub.dev/packages/splash_tap',
    youtubeUrl: 'https://www.youtube.com/watch?v=7qkhpeZdD7U');
const PackageUrl confettiPackage = PackageUrl(
    pubUrl: 'https://pub.dev/packages/confetti',
    youtubeUrl: 'https://www.youtube.com/watch?v=jvhw3cfj2rk');

@immutable
class PackageUrl {
  const PackageUrl({this.pubUrl = '', this.youtubeUrl = ''})
      : assert(pubUrl != null && youtubeUrl != null);

  final String pubUrl;
  final String youtubeUrl;
}
