import 'package:easy_localization/easy_localization.dart';

extension NumberFormatting on num? {
  String toStringAsMinFixed(int fractionDigit) {
    String formattedNumber;
    int significantDigits = 0;

    if (toString().contains(".")) {
      final String decimalPart = toString().split('.')[1];
      // Find the last non-zero digit in the decimal part
      for (int i = decimalPart.length - 1; i >= 0; i--) {
        if (decimalPart[i] != '0') {
          significantDigits = i + 1;
          break;
        }
      }
    }

    if (this != null) {
      if (this!.floor() == this) {
        formattedNumber =
            this!.toStringAsFixed(0); // Remove decimals if integer
      } else if (significantDigits <= fractionDigit) {
        formattedNumber =
            this!.toStringAsFixed(significantDigits); // Keep all decimals
      } else {
        // Round to the nearest tenth (one significant digit after decimal)
        formattedNumber =
            ((this! * 10.0).roundToDouble() / 10.0).toStringAsFixed(1);
      }
      return formattedNumber;
    } else {
      return '';
    }
  }
}




extension StringExtensions on String {
  // put here your mapping, this cover chars corresponding to regex [À-ž]
  static const diacriticsMapping = {
    //[À-ÿ]
    'À': 'A',
    'Á': 'A',
    'Â': 'A',
    'Ã': 'A',
    'Ä': 'A',
    'Å': 'A',
    'Æ': 'AE',
    'Ç': 'C',
    'È': 'E',
    'É': 'E',
    'Ê': 'E',
    'Ë': 'E',
    'Ì': 'I',
    'Í': 'I',
    'Î': 'I',
    'Ï': 'I',
    'Ð': 'D',
    'Ñ': 'N',
    'Ò': 'O',
    'Ó': 'O',
    'Ô': 'O',
    'Õ': 'O',
    'Ö': 'O',
    '×': 'x', //math multiplication
    'Ø': 'O',
    'Ù': 'U',
    'Ú': 'U',
    'Û': 'U',
    'Ü': 'U',
    'Ý': 'Y',
    'Þ': 'TH',
    'ß': 'SS',
    'à': 'a',
    'á': 'a',
    'â': 'a',
    'ã': 'a',
    'ä': 'a',
    'å': 'a',
    'æ': 'ae',
    'ç': 'c',
    'è': 'e',
    'é': 'e',
    'ê': 'e',
    'ë': 'e',
    'ì': 'i',
    'í': 'i',
    'î': 'i',
    'ï': 'i',
    'ð': 'd',
    'ñ': 'n',
    'ò': 'o',
    'ó': 'o',
    'ô': 'o',
    'õ': 'o',
    'ö': 'o',
    '÷': ' ', //math division
    'ø': 'o',
    'ù': 'u',
    'ú': 'u',
    'û': 'u',
    'ü': 'u',
    'ý': 'y',
    'þ': 'th',
    'ÿ': 'y',
    //[Ā-ž] EuropeanLatin
    'Ā': 'A',
    'ā': 'a',
    'Ă': 'A',
    'ă': 'a',
    'Ą': 'A',
    'ą': 'a',
    'Ć': 'C',
    'ć': 'c',
    'Ĉ': 'C',
    'ĉ': 'c',
    'Ċ': 'C',
    'ċ': 'c',
    'Č': 'C',
    'č': 'c',
    'Ď': 'D',
    'ď': 'd',
    'Đ': 'D',
    'đ': 'd',
    'Ē': 'E',
    'ē': 'e',
    'Ĕ': 'E',
    'ĕ': 'e',
    'Ė': 'E',
    'ė': 'e',
    'Ę': 'E',
    'ę': 'e',
    'Ě': 'E',
    'ě': 'e',
    'Ĝ': 'G',
    'ĝ': 'g',
    'Ğ': 'G',
    'ğ': 'g',
    'Ġ': 'G',
    'ġ': 'g',
    'Ģ': 'G',
    'ģ': 'g',
    'Ĥ': 'H',
    'ĥ': 'h',
    'Ħ': 'H',
    'ħ': 'h',
    'Ĩ': 'I',
    'ĩ': 'i',
    'Ī': 'I',
    'ī': 'i',
    'Ĭ': 'I',
    'ĭ': 'i',
    'Į': 'I',
    'į': 'i',
    'İ': 'I',
    'ı': 'i',
    'Ĳ': 'IJ',
    'ĳ': 'ij',
    'Ĵ': 'J',
    'ĵ': 'j',
    'Ķ': 'K',
    'ķ': 'k',
    'ĸ': 'k',
    'Ĺ': 'L',
    'ĺ': 'l',
    'Ļ': 'L',
    'ļ': 'l',
    'Ľ': 'L',
    'ľ': 'l',
    'Ŀ': 'L',
    'ŀ': 'l',
    'Ł': 'L',
    'ł': 'l',
    'Ń': 'N',
    'ń': 'n',
    'Ņ': 'N',
    'ņ': 'n',
    'Ň': 'N',
    'ň': 'n',
    'ŉ': 'n',
    'Ŋ': 'N',
    'ŋ': 'n',
    'Ō': 'O',
    'ō': 'o',
    'Ŏ': 'O',
    'ŏ': 'o',
    'Ő': 'O',
    'ő': 'o',
    'Œ': 'OE',
    'œ': 'oe',
    'Ŕ': 'R',
    'ŕ': 'r',
    'Ŗ': 'R',
    'ŗ': 'r',
    'Ř': 'R',
    'ř': 'r',
    'Ś': 'S',
    'ś': 's',
    'Ŝ': 'S',
    'ŝ': 's',
    'Ş': 'S',
    'ş': 's',
    'Š': 'S',
    'š': 's',
    'Ţ': 'T',
    'ţ': 't',
    'Ť': 'T',
    'ť': 't',
    'Ŧ': 'T',
    'ŧ': 't',
    'Ũ': 'U',
    'ũ': 'u',
    'Ū': 'U',
    'ū': 'u',
    'Ŭ': 'U',
    'ŭ': 'u',
    'Ů': 'U',
    'ů': 'u',
    'Ű': 'U',
    'ű': 'u',
    'Ų': 'U',
    'ų': 'u',
    'Ŵ': 'W',
    'ŵ': 'w',
    'Ŷ': 'Y',
    'ŷ': 'y',
    'Ÿ': 'Y',
    'Ź': 'Z',
    'ź': 'z',
    'Ż': 'Z',
    'ż': 'z',
    'Ž': 'Z',
    'ž': 'z',
  };

  String replaceAllDiacritics() {
    return replaceAllMapped(
      RegExp('[À-ž]'),
          (m) => diacriticsMapping[m.group(0)] ?? '',
    );
  }
}


extension DateTimeFormatter on DateTime? {
  String? format(String pattern, {String? locale}) {
    if (this == null) return null;
    return DateFormat(pattern, locale).format(this!);
  }

  /// Formats the date in the format yyyy-mm-dd (ISO 8601)
  String? formatIso8601() => format('yyyy-MM-dd');

  /// this format is mostly used for server last update times in Batela or Evolve project
  String? formatServer() => format('yyyy-MM-dd HH:mm:ss');

  /// Formats the date in the format yyyy-mm-dd HH:mm:ss (e.g. 2024-12-30 22:45:30)
  String? formatYyyyMmDdHhMmSs() => format('yyyy-MM-dd HH:mm:ss');

  /// Formats the date in the format dd/mm/yyyy (e.g., 14/05/2024)
  String? formatDdMmYyyy() => format('dd/MM/yyyy');

  /// Formats the date in the format dd/mm/yyyy (e.g., 14/Jun/2024)
  String? formatDdMmmYyyy(String locale) =>
      format('dd/MMM/yyyy', locale: locale);

  /// Formats the date in the format dd-mm-yyyy HH:mm (e.g., 14 Jun 2024 22:30)
  String? formatDdMmmYyyyHhMm(String locale) =>
      format('dd MMM yyyy, HH:mm', locale: locale);

// You can add more methods for other desired formats...
// For example:
// String formatMonthNameDayYear({String nullValue = ''}) => format('MMMM dd, yyyy', nullValue: nullValue);
}
