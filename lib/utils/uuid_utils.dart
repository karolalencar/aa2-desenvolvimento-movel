import 'package:uuid/uuid.dart';

String convertBytesToUuid(List<dynamic> bytes) {
  int id = bytes.fold<int>(0, (previousValue, element) {
    return (previousValue << 8) | element;
  });

  Uuid uuid = Uuid();
  return uuid.v5(Uuid.NAMESPACE_OID, id.toString());
}
