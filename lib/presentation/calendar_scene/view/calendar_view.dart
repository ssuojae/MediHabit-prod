import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:medihabit/domain/entity/medication.dart';
import '../../utils/ui_utils.dart';

final class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  _CalendarViewState createState() => _CalendarViewState();
}

final class _CalendarViewState extends State<CalendarView> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildCalendarSection(),
          _buildPillListSection(),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text('약 복용 스케쥴러', style: TextStyle(color: Colors.black)),
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  Widget _buildCalendarSection() {
    return CalendarSection(
      calendarFormat: _calendarFormat,
      focusedDay: _focusedDay,
      selectedDay: _selectedDay,
      onDaySelected: _onDaySelected,
      onFormatChanged: _onFormatChanged,
      onPageChanged: _onPageChanged,
      medications: dummyMedications,
    );
  }

  Widget _buildPillListSection() {
    return Expanded(
      child: PillListSection(
        selectedDay: _selectedDay,
        medications: _getMedicationsForDay(_selectedDay ?? DateTime.now()),
      ),
    );
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  }

  void _onFormatChanged(CalendarFormat format) {
    setState(() {
      _calendarFormat = format;
    });
  }

  void _onPageChanged(DateTime focusedDay) {
    _focusedDay = focusedDay;
  }

  List<Medication> _getMedicationsForDay(DateTime day) {
    return dummyMedications.where((medication) => isSameDay(medication.dateTime, day)).toList();
  }
}

class CalendarSection extends StatelessWidget {
  final CalendarFormat calendarFormat;
  final DateTime focusedDay;
  final DateTime? selectedDay;
  final Function(DateTime, DateTime) onDaySelected;
  final Function(CalendarFormat) onFormatChanged;
  final Function(DateTime) onPageChanged;
  final List<Medication> medications;

  const CalendarSection({
    required this.calendarFormat,
    required this.focusedDay,
    required this.selectedDay,
    required this.onDaySelected,
    required this.onFormatChanged,
    required this.onPageChanged,
    required this.medications,
  });

  @override
  Widget build(BuildContext context) {
    return _buildTableCalendar();
  }

  TableCalendar _buildTableCalendar() {
    return TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: focusedDay,
      calendarFormat: calendarFormat,
      selectedDayPredicate: (day) => isSameDay(selectedDay, day),
      onDaySelected: (selectedDay, focusedDay) {
        onDaySelected(selectedDay, focusedDay);
      },
      onFormatChanged: (format) {
        onFormatChanged(format);
      },
      onPageChanged: (focusedDay) {
        onPageChanged(focusedDay);
      },
      daysOfWeekHeight: AppSizes.calendarDaysOfWeekHeight,
      calendarStyle: _buildCalendarStyle(),
      headerStyle: _buildHeaderStyle(),
      calendarBuilders: _buildCalendarBuilders(),
    );
  }

  CalendarStyle _buildCalendarStyle() {
    return const CalendarStyle(
      isTodayHighlighted: true,
      todayDecoration: BoxDecoration(),
      selectedTextStyle: TextStyle(color: AppColors.calendarTodayTextColor),
      selectedDecoration: BoxDecoration(
        color: AppColors.calendarSelectedBackground,
        shape: BoxShape.circle,
      ),
    );
  }

  HeaderStyle _buildHeaderStyle() {
    return const HeaderStyle(
      formatButtonVisible: false,
      leftChevronVisible: false,
      rightChevronVisible: false,
    );
  }

  CalendarBuilders _buildCalendarBuilders() {
    return CalendarBuilders(
      todayBuilder: (context, date, _) => CustomDayWidget(date: date, isToday: true, medications: medications),
      selectedBuilder: (context, date, _) => CustomDayWidget(date: date, isSelected: true, medications: medications),
      defaultBuilder: (context, date, _) => CustomDayWidget(date: date, isFuture: date.isAfter(DateTime.now()), medications: medications),
      outsideBuilder: (context, date, _) => CustomDayWidget(date: date, isOutside: true, isFuture: date.isAfter(DateTime.now()), medications: medications),
    );
  }
}

class PillListSection extends StatelessWidget {
  final DateTime? selectedDay;
  final List<Medication> medications;

  const PillListSection({this.selectedDay, required this.medications});

  @override
  Widget build(BuildContext context) {
    return _buildPillList();
  }

  Widget _buildPillList() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: medications.isEmpty ? 1 : medications.length,
      itemBuilder: (context, index) {
        if (medications.isEmpty) {
          return _buildNoMedicationTile();
        } else {
          return _buildMedicationTile(medications[index]);
        }
      },
    );
  }

  Widget _buildNoMedicationTile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.calendarListViewHorizontalInset, vertical: AppSizes.calendarListViewVerticalInset),
      child: Container(
        color: Colors.white,
        child: const ListTile(
          title: Text('해당 날짜에 등록된 약이 없습니다!(추후 이미지로 대체하기)'),
        ),
      ),
    );
  }

  Widget _buildMedicationTile(Medication medication) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.calendarListViewHorizontalInset, vertical: AppSizes.calendarListViewVerticalInset),
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            Container(
              width: AppSizes.calendarColorThemeThickness,
              height: AppSizes.calendarListTileHeight - AppSizes.calendarListTileVerticalPadding * 2,
              decoration: BoxDecoration(
                color: medication.color,
                borderRadius: BorderRadius.circular(AppSizes.calendarColorThemeRadius),
              ),
              margin: const EdgeInsets.symmetric(vertical: AppSizes.calendarListTileVerticalPadding),
            ),
            Expanded(
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: AppSizes.calendarListViewTileHorizontalInset),
                title: Text(medication.name),
                subtitle: Text(medication.dosage),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
      height: MediaQuery.of(context).size.width * AppSizes.calendarDayCircleSize,
      decoration: BoxDecoration(
        color: color.withOpacity(isTransparent ? 0.3 : 1.0),
        shape: BoxShape.circle,
      ),
    );
  }
}
