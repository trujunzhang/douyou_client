double calcRateForRestaurant(int rate, int total) {
  if (total == 0) {
    return 0.0;
  }
  double base = rate * 10 / total;
  int value = base.round() % 10;
  int left = ((base - value) / 10).round();

  double right = 0.0;
  if (value > 7) {
    right = 1;
  } else if (value > 2 && value <= 7) {
    right = 0.5;
  }

  double nextRate = left + right;

  return nextRate;
}
