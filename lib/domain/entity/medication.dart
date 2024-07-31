import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'medication.freezed.dart';
part 'medication.g.dart';

@freezed
class Medication with _$Medication {
  factory Medication({
    required String id,
    required String name,
    required String colorHex,
    required String dosage,
    required String time,
    required String imageUrl,
  }) = _Medication;

  factory Medication.fromJson(Map<String, dynamic> json) => _$MedicationFromJson(json);
}

extension MedicationExtension on Medication {
  Color get color => Color(int.parse(colorHex.replaceFirst('#', '0xff')));
  DateTime get dateTime => DateTime.parse(time);
}

// 더미 데이터
List<Medication> dummyMedications = [
  // 첫 번째 주: 약 4개씩
  Medication(
    id: '1',
    name: '약1',
    colorHex: '#FF0000',
    dosage: '첫 번째 약입니다.',
    time: DateTime.now().toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '2',
    name: '약2',
    colorHex: '#0000FF',
    dosage: '두 번째 약입니다.',
    time: DateTime.now().toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '3',
    name: '약3',
    colorHex: '#22B73F',
    dosage: '세 번째 약입니다.',
    time: DateTime.now().toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '4',
    name: '약4',
    colorHex: '#FFA500',
    dosage: '네 번째 약입니다.',
    time: DateTime.now().toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '5',
    name: '약5',
    colorHex: '#FF0000',
    dosage: '다섯 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 1)).toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '6',
    name: '약6',
    colorHex: '#0000FF',
    dosage: '여섯 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 1)).toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '7',
    name: '약7',
    colorHex: '#22B73F',
    dosage: '일곱 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 1)).toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '8',
    name: '약8',
    colorHex: '#FFA500',
    dosage: '여덟 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 1)).toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '9',
    name: '약9',
    colorHex: '#FF0000',
    dosage: '아홉 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 2)).toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '10',
    name: '약10',
    colorHex: '#0000FF',
    dosage: '열 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 2)).toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '11',
    name: '약11',
    colorHex: '#22B73F',
    dosage: '열한 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 2)).toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '12',
    name: '약12',
    colorHex: '#FFA500',
    dosage: '열두 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 2)).toIso8601String(),
    imageUrl: '',
  ),

  // 두 번째 주: 약 5개씩
  Medication(
    id: '13',
    name: '약13',
    colorHex: '#8A2BE2',
    dosage: '열세 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 7)).toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '14',
    name: '약14',
    colorHex: '#FF4500',
    dosage: '열네 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 7)).toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '15',
    name: '약15',
    colorHex: '#4B0082',
    dosage: '열다섯 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 7)).toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '16',
    name: '약16',
    colorHex: '#00FFFF',
    dosage: '열여섯 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 7)).toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '17',
    name: '약17',
    colorHex: '#FF00FF',
    dosage: '열일곱 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 7)).toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '18',
    name: '약18',
    colorHex: '#FFFF00',
    dosage: '열여덟 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 8)).toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '19',
    name: '약19',
    colorHex: '#00FF00',
    dosage: '열아홉 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 8)).toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '20',
    name: '약20',
    colorHex: '#800080',
    dosage: '스무 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 8)).toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '21',
    name: '약21',
    colorHex: '#800000',
    dosage: '스물한 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 8)).toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '22',
    name: '약22',
    colorHex: '#808000',
    dosage: '스물두 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 9)).toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '23',
    name: '약23',
    colorHex: '#008080',
    dosage: '스물세 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 9)).toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '24',
    name: '약24',
    colorHex: '#000080',
    dosage: '스물네 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 9)).toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '25',
    name: '약25',
    colorHex: '#008000',
    dosage: '스물다섯 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 9)).toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '26',
    name: '약26',
    colorHex: '#800080',
    dosage: '스물여섯 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 10)).toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '27',
    name: '약27',
    colorHex: '#808080',
    dosage: '스물일곱 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 10)).toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '28',
    name: '약28',
    colorHex: '#C0C0C0',
    dosage: '스물여덟 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 10)).toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '29',
    name: '약29',
    colorHex: '#FFD700',
    dosage: '스물아홉 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 10)).toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '30',
    name: '약30',
    colorHex: '#DC143C',
    dosage: '서른 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 11)).toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '31',
    name: '약31',
    colorHex: '#ADFF2F',
    dosage: '서른한 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 11)).toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '32',
    name: '약32',
    colorHex: '#FF1493',
    dosage: '서른두 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 11)).toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '33',
    name: '약33',
    colorHex: '#1E90FF',
    dosage: '서른세 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 11)).toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '34',
    name: '약34',
    colorHex: '#FF00FF',
    dosage: '서른네 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 12)).toIso8601String(),
    imageUrl: '',
  ),
  Medication(
    id: '35',
    name: '약35',
    colorHex: '#FFFF00',
    dosage: '서른다섯 번째 약입니다.',
    time: DateTime.now().add(Duration(days: 12)).toIso8601String(),
    imageUrl: '',
  ),
];

