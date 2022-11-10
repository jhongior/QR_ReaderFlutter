import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/widgets/scan_list.dart';

import '../providers/scan_list_provider.dart';

class DireccionesPage extends StatelessWidget {
  const DireccionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScanList(tipo: 'http');
  }
}
