import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/scan_list_provider.dart';

class ScanList extends StatelessWidget {
  final String tipo;
  const ScanList({Key? key, required this.tipo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    print('maps{$scans}');
    return ListView.builder(
        itemCount: scans.length,
        //para borrar al deslizar a los lados
        itemBuilder: (_, index) => Dismissible(
              //para manejar id unico por item
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (DismissDirection direction) {
                final scanListProvider =
                    Provider.of<ScanListProvider>(context, listen: false);
                scanListProvider.borrarScanId(scans[index].id!);
              },
              child: ListTile(
                leading: Icon(
                  this.tipo == 'http' ? Icons.directions : Icons.map,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(scans[index].valor),
                subtitle: Text(scans[index].id.toString()),
                trailing: const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                ),
                onTap: () => launchURL(context, scans[index]),
              ),
            ));
  }
}
