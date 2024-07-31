import 'package:flutter/material.dart';
import 'package:medihabit/domain/entity/medication.dart';
import '../../utils/ui_utils.dart';
final class CustomDayWidget extends StatelessWidget {
  final DateTime date;
  final bool isToday;
  final bool isSelected;
  final bool isOutside;
  final bool isFuture;
  final List<Medication> medications;

  const CustomDayWidget({
    required this.date,
    required this.medications,
    this.isToday = false,
    this.isSelected = false,
    this.isOutside = false,
    this.isFuture = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildDateContainer(context),
        SizedBox(height: MediaQuery.of(context).size.width * AppSizes.calendarDaySpacing),
        _buildMedicationRow(context, 1),
        if (_getMedicationRowWidgets(context, 2).isNotEmpty)
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * AppSizes.calendarDaySpacing),
            child: _buildMedicationRow(context, 2),
          ),
      ],
    );
  }

  Widget _buildDateContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * AppSizes.calendarDayContainerSize,
      height: MediaQuery.of(context).size.width * AppSizes.calendarDayContainerSize,
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        '${date.day}',
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * AppSizes.calendarDayFontSize,
          color: _getTextColor(),
        ),
      ),
    );
  }

  Widget _buildMedicationRow(BuildContext context, int rowNumber) {
    final row = _getMedicationRowWidgets(context, rowNumber);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: row,
    );
  }

  List<Widget> _getMedicationRowWidgets(BuildContext context, int rowNumber) {
    final medicationsForDay = _getMedicationsForDay(date).take(6).toList();
    final row = <Widget>[];

    for (int i = (rowNumber - 1) * 3; i < rowNumber * 3 && i < medicationsForDay.length; i++) {
      row.add(_CircleWidget(color: medicationsForDay[i].color, isTransparent: isFuture || isOutside));
      if (i % 3 != 2) row.add(SizedBox(width: MediaQuery.of(context).size.width * AppSizes.calendarDaySpacing));
    }

    _addEmptySpaces(row, context);
    return row;
  }

  void _addEmptySpaces(List<Widget> row, BuildContext context) {
    while (row.length < 5) {
      if (row.length % 2 == 0) {
        row.insert(0, SizedBox(width: MediaQuery.of(context).size.width * AppSizes.calendarDaySpacing));
      } else {
        row.add(SizedBox(width: MediaQuery.of(context).size.width * AppSizes.calendarDaySpacing));
      }
    }
  }

  Color _getBackgroundColor() {
    if (isToday) return AppColors.calendarTodayBackground;
    if (isSelected) return AppColors.calendarSelectedBackground;
    return Colors.transparent;
  }

  Color _getTextColor() {
    if (isToday || isSelected) return AppColors.calendarTodayTextColor;
    if (isOutside) return AppColors.calendarOutsideTextColor;
    return AppColors.calendarTextColor;
  }

  List<Medication> _getMedicationsForDay(DateTime day) {
    return medications.where((medication) => isSameDay(medication.dateTime, day)).toList();
  }
}

final class _CircleWidget extends StatelessWidget {
  final Color color;
  final bool isTransparent;

  const _CircleWidget({
    required this.color,
    required this.isTransparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * AppSizes.calendarDayCircleSize,
      height: MediaQuery.of(context).size.width * AppSizes.calendarDayCircleSize, // 0.0125
      decoration: BoxDecoration(
        color: color.withOpacity(isTransparent ? 0.3 : 1.0),
        shape: BoxShape.circle,
      ),
    );
  }
}
