int whoWins(Map<String, int> teamA, Map<String, int> teamB) {
  int score(Map<String, int> team) {
    return (team['Free throws'] ?? 0) * 1 +
        (team['2 pointers'] ?? 0) * 2 +
        (team['3 pointers'] ?? 0) * 3;
  }

  int a = score(teamA);
  int b = score(teamB);

  if (a > b) return 1;
  if (a < b) return 2;
  return 0;
}
