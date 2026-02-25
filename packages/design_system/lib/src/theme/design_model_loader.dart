import 'dart:convert';
import 'dart:developer' as developer;

import 'design_config_data.dart';

/// Singleton class to load design tokens from embedded data
class DesignConfigLoader {
  static final DesignConfigLoader _instance = DesignConfigLoader._internal();

  factory DesignConfigLoader() => _instance;

  DesignConfigLoader._internal();

  /// Cache for the loaded design tokens
  Map<String, dynamic>? _designConfig;

  /// Loads design tokens from the embedded data
  Future<Map<String, dynamic>> loadDesignConfig() async {
    if (_designConfig != null) {
      return _designConfig!;
    }

    try {
      // Use the embedded design tokens
      developer.log('UI Design System: Loading embedded design tokens');

      if (designConfigJson.isEmpty) {
        throw Exception('Embedded design tokens JSON is empty');
      }

      // Parse embedded JSON data
      _designConfig = json.decode(designConfigJson) as Map<String, dynamic>;
      developer.log('UI Design System: Successfully loaded embedded tokens');
      return _designConfig!;
    } catch (e) {
      developer.log('UI Design System: Error loading design tokens: $e');
      throw Exception(
        'Failed to load design tokens: $e\n\n'
        'This may be an issue with the design_tokens_data.dart file in the package.',
      );
    }
  }

  /// Gets a specific section from the design tokens
  Future<Map<String, dynamic>> getConfigSection(String section) async {
    final tokens = await loadDesignConfig();
    if (!tokens.containsKey(section)) {
      throw Exception('Section "$section" not found in design tokens');
    }
    return tokens[section] as Map<String, dynamic>;
  }
}
