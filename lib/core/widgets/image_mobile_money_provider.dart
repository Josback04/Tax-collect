import 'package:tax_collect/generated/assets.gen.dart';

AssetGenImage? imageMobileMoneyProvider(String phoneNumber) {
  if (phoneNumber.length >= 2) {
    switch (phoneNumber.substring(0, 2)) {
      case '80':
      case '81':
      case '82':
      case '83':
        return Assets.images.iconMpesa;
      case '84':
      case '85':
      case '89':
        return Assets.images.iconOrange;
      case '90':
      case '91':
        return Assets.images.iconAfricell;
      case '97':
      case '98':
      case '99':
        return Assets.images.iconAirtel;
      default:
        return null;
    }
  } else {
    return null;
  }
}
