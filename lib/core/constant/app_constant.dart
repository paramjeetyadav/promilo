import 'package:form_field_validator/form_field_validator.dart';
import 'package:promilo/core/constant/asset_constant.dart';

class AppConstant {
  //-------- String Constant -------------
  static const String token = "token";
  static const String dummyText =
      "From cardiovascular health to fitness, flexibility, balance, stress relief, better sleep, increased cognitive performance, and more, you can reap all of these benefits in just one session out on the waves. So, you may find yourself wondering what are the benefits of going on a surf camp.";

  //-------- Validation Constant -------------
  static var emailValidation = MultiValidator(
    [
      RequiredValidator(errorText: 'Required'),
      EmailValidator(errorText: 'Enter a valid email address'),
    ],
  );
  static var validation = MultiValidator(
    [
      RequiredValidator(errorText: 'Required'),
    ],
  );

  static var passwordValidation = MultiValidator(
    [
      RequiredValidator(errorText: 'Required'),
      PatternValidator(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#^<>=])[A-Za-z\d@$!%*?&#^<>=]{8,}$',
        errorText: 'Password should be between 6-12 characters',
      )
    ],
  );

  //-------- Image List Constant -------------
  static const List<String> socialLogo = [
    AssetConstant.googleLogo,
    AssetConstant.instaLogo,
    AssetConstant.whatsLogo,
    AssetConstant.linkedLogo,
    AssetConstant.fbLogo
  ];
  static const List<String> descriptionImageList = [
    AssetConstant.descImage1,
    AssetConstant.descImage2,
    AssetConstant.descImage3,
    AssetConstant.descImage4,
  ];
  static const List<String> carouselList = [
    AssetConstant.meetingImage1,
    AssetConstant.meetingImage2,
    AssetConstant.meetingImage3,
  ];
  static const List<String> writeList = [
    AssetConstant.write1,
    AssetConstant.write2,
    AssetConstant.write3,
    AssetConstant.write1,
    AssetConstant.write2,
    AssetConstant.write3,
    AssetConstant.write1,
    AssetConstant.write2,
    AssetConstant.write3,
  ];
}
