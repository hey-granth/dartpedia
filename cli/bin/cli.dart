// dart:io is a core library in the Dart SDK, and provides APIs to deal with files, directories, sockets, and HTTP clients and servers, and more.
import 'dart:io';

// const variable sets the value at compile time and cannot be changed at runtime.
const version = '0.0.1';

void main(List<String> arguments) {
  // List<String> arguments is a list of strings that contains the command-line arguments passed to the program.
  // In Dart, the main function is the entry point of the program.

  if (arguments.isEmpty || arguments.first == "help") {
    printUsage();
  } else if (arguments.first == 'search') {
    // final keyword makes the variable immutable, meaning its value cannot be changed after it is assigned.
    // arguments.length > 1 means that there are more than one argument passed to the program.
    // arguments.sublist(1) creates a new list containing all elements of the original list starting from index 1 to the end of the list.
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else if (arguments.first == "search") {
    print("Search command recognized!");
  } else if (arguments.first == 'version') {
    print('DartPedia CLI Version: $version');
  } else {
    printUsage();
  }
}

void printUsage() {
  print(
    "the available commands are: 'help', 'version' and search '<ARTICLE-TITLE>'",
  );
}

// suppose the user doesn't enter anything after search command, that is the case where this list can go null.
void searchWikipedia(List<String>? arguments) {
  // ? arguments means that the arguments variable can be null. dart ensures sound null safety where the variable can never ever be null, unless explicitly declared as nullable with the ? operator.

  final String articleTitle;

  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title.');
    // Await input and provide a default empty string if the input is null.
    // ?? is a null coalescing operator that returns the expression on its right if the expression on its left is null.
    // readLineSync() reads a line of text from standard input (stdin) synchronously, unless the user hits enter, meaning until the program hits \n character or EOF.
    articleTitle = stdin.readLineSync() ?? '';
  } else {
    // Otherwise, join the arguments into a single string.
    // arguments.join(' ') joins all elements of the list into a single string, with a space character as the separator.
    articleTitle = arguments.join(' ');

    print('Looking up articles about "$articleTitle". Please wait.');
    print('Here ya go!');
    print('(Pretend this is an article about "$articleTitle")');
  }

  // print('Current article title: $articleTitle');
}
