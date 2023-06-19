import 'package:bloc_app/src/exceptions/failure.dart';
import 'package:easy_localization/easy_localization.dart';

class NewsException implements Failure {
  NewsException();

  @override
  String? get message => 'label_network_failure'.tr();
}
