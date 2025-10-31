import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mcp_toolkit/mcp_toolkit.dart';
import 'package:mobile_app/ui_root/ui_root.dart';

Future<void> main() async => runZonedGuarded(() {
  WidgetsFlutterBinding.ensureInitialized();
  MCPToolkitBinding.instance
    ..initialize() // Initializes the Toolkit
    ..initializeFlutterToolkit(); // Adds Flutter related methods to the MCP server
  // Assuming DBPApp is their actual root widget
  unawaited(bootstrapMain(builder: DBPApp.new));
}, MCPToolkitBinding.instance.handleZoneError);
