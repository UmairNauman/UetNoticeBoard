import 'dart:io';

checkInternetConnection() async {
  final result = await InternetAddress.lookup('www.google.com');
  print(result);
  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    return 'CONNECTED';
  } else {
    return 'NOTCONNECTED';
  }
}
