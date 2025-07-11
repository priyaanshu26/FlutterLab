import 'dart:io';

void keyword_handling(String input) {
  try {
    int number = int.parse(input);
    print("Parsed Number: $number");
  } on FormatException catch (e) {
    print("Invalid number format: ${e.message}");
  } on SocketException catch (e) {
    print("Network error: ${e.message}");
  } catch (e) {
    print("Something went wrong: $e");
  }
}

void main() {
  keyword_handling("123");
  keyword_handling("abc");
}
