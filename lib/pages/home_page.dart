import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:qr_reader/pages/direcciones_page.dart';
import 'package:qr_reader/providers/db_provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_providers.dart';
import 'package:qr_reader/widgets/custom_navigatorbar.dart';
import 'package:qr_reader/pages/mapas_page.dart';
import 'package:qr_reader/widgets/scan_bottom.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                final scanListProvider =
                    Provider.of<ScanListProvider>(context, listen: false);
                scanListProvider.borrarTodos();
              },
              icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: ScanBottom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    /*var rng = Random();
    for (var i = 0; i < 10; i++) {
      print(rng.nextInt(100));
    }*/

    //final tempScan = new ScanModel(
    // valor: 'http://google.com', id: rng.nextInt(100), tipo: 'hola');

    //DBProvider.db.deleteAllScan().then((print));
    //DBProvider.db.getScanById(38).then((scan) => print(scan!.valor));
    //DBProvider.db.nuevoScan(tempScan);
    //DBProvider.db.database;

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScansTipo('geo');
        return const MapasPage();
      case 1:
        scanListProvider.cargarScansTipo('http');
        return const DireccionesPage();
      default:
        return const MapasPage();
    }
  }
}
