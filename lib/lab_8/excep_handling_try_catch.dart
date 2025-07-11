void divide(int a, int b) {
  try {
    int result = a ~/ b;
    print("Result: $result");
  } catch (e) {
    print("Error: Cannot divide by zero.");
  }
}

void main() {
  divide(10, 2);
  divide(10, 0);
}
