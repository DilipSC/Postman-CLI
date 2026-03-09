import 'dart:io';

import 'package:args/args.dart';
import 'package:http/http.dart' as http;

void urlCli(List<String> arguments) async {
  final parser = ArgParser();
  parser.addOption('url', abbr: 'u', help: 'Enter the url', mandatory: true);
  parser.addOption(
    'method',
    abbr: 'm',
    help: 'Enter the method',
    mandatory: true,
  );

  try {
    final ArgResults results = parser.parse(arguments);
    final url = results['url'];
    final method = results['method'];
    if (method == 'get') {
      final response = await http.get(Uri.parse(url));
      print(response.body);
      exit(0);
    }
  } on FormatException catch (e) {
    stderr.writeln(e.message);
    stderr.writeln(parser.usage);
    exit(1);
  }
}
