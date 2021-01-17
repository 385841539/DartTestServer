import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;

import 'jktestcontrol.dart';
import 'http_config.dart';

// For Google Cloud Run, set _hostname to '0.0.0.0'.
//const _hostname = 'localhost';
//const _hostname = '172.21.220.50';//公司
const _hostname = '192.168.1.5';//家里

main(List<String> args) async {
  Map<String, String> envVars = Platform.environment;
  if (envVars.containsKey('HOSTNAME') &&
      envVars['HOSTNAME'] == 'izuf68g6a94fj37dstoglwz') {
    print("----是--izuf68g6a94fj37dstoglwz");
  } else {
    HttpConfig.hostname = _hostname;
    HttpConfig.hostport = '8083';
    print("---不是==izuf68g6a94fj37dstoglwz");
  }
//
//
  print("-----env---$envVars");
  var parser = ArgParser()..addOption('port', abbr: 'p');
  var result = parser.parse(args);

  // For Google Cloud Run, we respect the PORT environment variable
  var portStr = result['port'] ?? Platform.environment['PORT'] ??HttpConfig.hostport ;
  var port = int.tryParse(portStr);

  if (port == null) {
    stdout.writeln('Could not parse port value "$portStr" into a number.');
    // 64: command line usage error
    exitCode = 64;
    return;
  }

  var handler = const shelf.Pipeline()
      .addMiddleware(shelf.logRequests())
      .addHandler(_echoRequest);

  var server = await io.serve(handler, HttpConfig.hostname, port);
  print('Serving at http://${server.address.host}:${server.port}');
}

shelf.Response _echoRequest(shelf.Request request) {
  return shelf.Response.ok('${TestJkControl.request(request)}',
      encoding: utf8,
      headers: {'Content-Type': 'application/json;charset=UTF-8'});
}
