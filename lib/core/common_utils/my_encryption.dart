import 'dart:convert';

import 'package:crypto/crypto.dart';

class MyEncryption {
  static String encrypt(String password) {
    // Convert the password to a list of bytes
    List<int> bytes = utf8.encode(password);

    // Calculate the SHA-256 hash
    Digest sha256Digest = sha256.convert(bytes);

    // Convert the Digest to a hex string and return
    return sha256Digest.toString();
  }
}
