import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Afișează o imagine de la un URL primit din API.
/// Alege automat SvgPicture.network pentru .svg și Image.network pentru
/// restul (jpg/png), cu placeholder cât se încarcă și dacă apare o eroare.
class NetImage extends StatelessWidget {
  const NetImage(
    this.url, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholderColor = const Color(0x11000000),
  });

  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color placeholderColor;

  bool get _isSvg => Uri.tryParse(url)?.path.toLowerCase().endsWith('.svg') ?? false;

  Widget _placeholder() => SizedBox(
        width: width,
        height: height,
        child: ColoredBox(color: placeholderColor),
      );

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) return _placeholder();

    if (_isSvg) {
      return SvgPicture.network(
        url,
        width: width,
        height: height,
        fit: fit == BoxFit.cover ? BoxFit.contain : fit,
        placeholderBuilder: (_) => SizedBox(width: width, height: height),
        errorBuilder: (_, __, ___) => SizedBox(width: width, height: height),
      );
    }

    return Image.network(
      url,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, child, progress) =>
          progress == null ? child : _placeholder(),
      errorBuilder: (_, __, ___) => _placeholder(),
    );
  }
}
