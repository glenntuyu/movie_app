import 'package:intl/intl.dart';

extension DateExtensionString on String {
  String? formatDate({
    String outputType = 'MMM dd, yyyy',
    String inputType = 'yyyy-MM-dd',
    bool isLocalTimeZone = false,
  }) {
    var inputFormat = DateFormat(inputType);
    var inputDate = isLocalTimeZone
        ? inputFormat.parseUTC(this).toLocal()
        : inputFormat.parse(this);

    var outputFormat = DateFormat(outputType);
    var outputDate = outputFormat.format(inputDate);

    return outputDate;
  }
}

extension StringExtension on String? {
  bool get isNullOrEmpty {
    return this == null || this == '';
  }
}
