import 'package:intl/intl.dart';

class FormatTeks {
  String changeFormat(int input) {
    String temp = "";
    var f = NumberFormat("###,###", "en_US");
    temp = f.format(input);
    temp = temp.replaceAll(",", ".");
    temp = "Rp. $temp";
    return temp;
  }
}
