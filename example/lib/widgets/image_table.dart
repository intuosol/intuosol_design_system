import 'package:flutter/material.dart';
import 'package:intuosol_design_system/intuosol_design_system.dart';

class LogoTable extends StatelessWidget {
  const LogoTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Table(
        border: TableBorder.all(
          color: Theme.of(context).colorScheme.outline,
          borderRadius: BorderRadius.circular(12.0),
        ),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: const {0: FixedColumnWidth(150.0)},
        children: [
          TableRow(
            children: [
              TableCell(child: _buildTitle(context, 'Logo')),
              TableCell(child: IntuoSolLogos.logo(context: context)),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: _buildTitle(context, 'Square Logo')),
              TableCell(child: IntuoSolLogos.squareLogo(context: context)),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: _buildTitle(context, 'App Icon')),
              TableCell(child: IntuoSolLogos.appIcon(context: context)),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: _buildTitle(context, 'By IntuoSol Text')),
              TableCell(child: IntuoSolLogos.byIntuoSolText(context: context)),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: _buildTitle(context, 'IntuoSol Text')),
              TableCell(child: IntuoSolLogos.intuosolText(context: context)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
        textAlign: TextAlign.right,
      ),
    );
  }
}
