class Config {
  final net = _Net();
  final meta = _Meta();
  final preset = _Preset();

  final imAppId = 1400599428;
}

/// Network config, include http and websocket
class _Net {
  final baseURL = 'http://127.0.0.1:9999/api/v0/';
  final timeout = const Duration(seconds: 5);
}

class _Meta {
  final appName = 'Client';
  final appEnglishName = 'client';
}

class _Preset {
  final avatar =
      'https://raw.githubusercontent.com/mocaraka/assets/main/picture/841.jpg';
}
