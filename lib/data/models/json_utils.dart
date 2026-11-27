/// Funcții mici pentru citirea sigură a valorilor din JSON:
/// dacă un câmp lipsește sau are alt tip, primim o valoare implicită
/// în loc de crash.

String readString(Object? v) => v is String ? v : (v?.toString() ?? '');

int readInt(Object? v) => v is num ? v.toInt() : int.tryParse('$v') ?? 0;

double readDouble(Object? v) =>
    v is num ? v.toDouble() : double.tryParse('$v') ?? 0;

bool readBool(Object? v) => v is bool ? v : v == 'true';

Map<String, dynamic> readMap(Object? v) =>
    v is Map<String, dynamic> ? v : const <String, dynamic>{};

List<Map<String, dynamic>> readList(Object? v) => v is List
    ? v.whereType<Map<String, dynamic>>().toList()
    : const <Map<String, dynamic>>[];
