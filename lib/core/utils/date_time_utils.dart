

import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

const String dateTime='dd/MM/yyyy';

extension DateTimeExtendstion on DateTime{
  String format({
    String pattern = dateTime,
    String? locale,
  }){
    if(locale!=null && locale.isNotEmpty){
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern,locale).format(this);
  }
}