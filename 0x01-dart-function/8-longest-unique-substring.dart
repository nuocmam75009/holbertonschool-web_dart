String longestUniqueSubstring(String str) {
  Map<String, int> lastSeen = {};
  int start = 0;
  int bestStart = 0;
  int bestLen = 0;

  for (int i = 0; i < str.length; i++) {
    String c = str[i];
    if (lastSeen.containsKey(c) && lastSeen[c]! >= start) {
      start = lastSeen[c]! + 1;
    }
    lastSeen[c] = i;
    if (i - start + 1 > bestLen) {
      bestLen = i - start + 1;
      bestStart = start;
    }
  }

  return str.substring(bestStart, bestStart + bestLen);
}
