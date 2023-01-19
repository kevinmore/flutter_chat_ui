import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import 'base_conditional.dart';

/// Create a [IOConditional].
///
/// Used from conditional imports, matches the definition in `conditional_stub.dart`.
BaseConditional createConditional() => IOConditional();

/// A conditional for anything but browser.
class IOConditional extends BaseConditional {
  /// Returns [ExtendedNetworkImageProvider] if URI starts with http
  /// otherwise uses IO to create File
  @override
  ImageProvider getProvider(String uri, {Map<String, String>? headers}) {
    if (uri.startsWith('http')) {
      return ExtendedNetworkImageProvider(uri, headers: headers, cache: true);
    } else {
      return FileImage(File(uri));
    }
  }
}
