import 'package:tax_collect/generated/assets.gen.dart';

AssetGenImage? imageCashProvider(int? amountCash) {
  if (amountCash != null) {
    switch (amountCash) {
      case 500:
        return Assets.images.a500fc;
      case 1000:
        return Assets.images.a1000fc;
      case 1500:
        return Assets.images.a1000fc;
      default:
        return null;
    }
  } else {
    return null;
  }
}
