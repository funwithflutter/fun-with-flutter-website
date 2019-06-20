class TagDisplayNameGenerator {
  static const tagNames = {
    "flutter": "Flutter",
    "architecture": "Architecture",
    "dependency-injection": "Dependency Injection",
    "animation": "Animation",
    "ui-layout": "UI Layout",
    "dart": "Dart",
    "cheat-sheet": "Cheat Sheet"
  };

  static String mapTagToDisplayName(String tag) {
    if (tagNames.containsKey(tag)) {
      return tagNames[tag];
    }
    return tag;
  }
}
