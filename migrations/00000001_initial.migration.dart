import 'dart:async';
import 'package:aqueduct/aqueduct.dart';

class Migration1 extends Migration {
  @override
  Future upgrade() async {
    database.createTable(SchemaTable(
      "_Icd",
      [
        SchemaColumn("id", ManagedPropertyType.bigInteger,
            isPrimaryKey: true,
            autoincrement: true,
            isIndexed: false,
            isNullable: false,
            isUnique: false),
        SchemaColumn("categoryCode", ManagedPropertyType.string,
            isPrimaryKey: false,
            autoincrement: false,
            isIndexed: false,
            isNullable: false,
            isUnique: false),
        SchemaColumn("diagnosisCode", ManagedPropertyType.string,
            isPrimaryKey: false,
            autoincrement: false,
            isIndexed: false,
            isNullable: false,
            isUnique: false),
        SchemaColumn("fullCode", ManagedPropertyType.string,
            isPrimaryKey: false,
            autoincrement: false,
            isIndexed: false,
            isNullable: false,
            isUnique: false),
        SchemaColumn("abbrDesc", ManagedPropertyType.string,
            isPrimaryKey: false,
            autoincrement: false,
            isIndexed: false,
            isNullable: false,
            isUnique: false),
        SchemaColumn("fullDesc", ManagedPropertyType.string,
            isPrimaryKey: false,
            autoincrement: false,
            isIndexed: false,
            isNullable: false,
            isUnique: false),
        SchemaColumn("categoryTitle", ManagedPropertyType.string,
            isPrimaryKey: false,
            autoincrement: false,
            isIndexed: false,
            isNullable: false,
            isUnique: false),
        SchemaColumn("createdAt", ManagedPropertyType.datetime,
            isPrimaryKey: false,
            autoincrement: false,
            isIndexed: false, // TODO: make this true if no errors
            isNullable: true,
            isUnique: false)
      ],
    ));
  }

  @override
  Future downgrade() async {}

  @override
  Future seed() async {
    final List<Map> reads = [
      {
        'categoryCode': 'A00',
        'diagnosisCode': 9,
        'fullCode': 'A009',
        'abbrDesc': 'Cholera, unspecified',
        'fullDesc': 'Cholera, unspecified',
        'categoryTitle': 'Cholera'
      },
      {
        "categoryCode": "A00",
        "diagnosisCode": 1,
        "fullCode": "A001",
        "abbrDesc": "Cholera due to Vibrio cholerae 01, biovar eltor",
        "fullDesc": "Cholera due to Vibrio cholerae 01, biovar eltor",
        "categoryTitle": "Cholera"
      },
      {
        "categoryCode": "A00",
        "diagnosisCode": 9,
        "fullCode": "A009",
        "abbrDesc": "Cholera, unspecified",
        "fullDesc": "Cholera, unspecified",
        "categoryTitle": "Cholera"
      },
      {
        "categoryCode": "A010",
        "diagnosisCode": 0,
        "fullCode": "A0100",
        "abbrDesc": "Typhoid fever, unspecified",
        "fullDesc": "Typhoid fever, unspecified",
        "categoryTitle": "Typhoid fever"
      },
      {
        "categoryCode": "A010",
        "diagnosisCode": 1,
        "fullCode": "A0101",
        "abbrDesc": "Typhoid meningitis",
        "fullDesc": "Typhoid meningitis",
        "categoryTitle": "Typhoid fever"
      },
      {
        "categoryCode": "A010",
        "diagnosisCode": 2,
        "fullCode": "A0102",
        "abbrDesc": "Typhoid fever with heart involvement",
        "fullDesc": "Typhoid fever with heart involvement",
        "categoryTitle": "Typhoid fever"
      },
      {
        "categoryCode": "A010",
        "diagnosisCode": 3,
        "fullCode": "A0103",
        "abbrDesc": "Typhoid pneumonia",
        "fullDesc": "Typhoid pneumonia",
        "categoryTitle": "Typhoid fever"
      },
      {
        "categoryCode": "A010",
        "diagnosisCode": 4,
        "fullCode": "A0104",
        "abbrDesc": "Typhoid arthritis",
        "fullDesc": "Typhoid arthritis",
        "categoryTitle": "Typhoid fever"
      },
      {
        "categoryCode": "A010",
        "diagnosisCode": 5,
        "fullCode": "A0105",
        "abbrDesc": "Typhoid osteomyelitis",
        "fullDesc": "Typhoid osteomyelitis",
        "categoryTitle": "Typhoid fever"
      },
      {
        "categoryCode": "A010",
        "diagnosisCode": 9,
        "fullCode": "A0109",
        "abbrDesc": "Typhoid fever with other complications",
        "fullDesc": "Typhoid fever with other complications",
        "categoryTitle": "Typhoid fever"
      },
      {
        "categoryCode": "A011",
        "diagnosisCode": "",
        "fullCode": "A011",
        "abbrDesc": "Paratyphoid fever A",
        "fullDesc": "Paratyphoid fever A",
        "categoryTitle": "Paratyphoid fever A"
      },
      {
        "categoryCode": "T48201",
        "diagnosisCode": "A",
        "fullCode": "T48201A",
        "abbrDesc":
            "Poisoning by unsp drugs acting on muscles, accidental, init",
        "fullDesc":
            "Poisoning by unspecified drugs acting on muscles, accidental (unintentional), initial encounter",
        "categoryTitle":
            "Poisoning by unspecified drugs acting on muscles, accidental (unintentional)"
      },
      {
        "categoryCode": "T48201",
        "diagnosisCode": "D",
        "fullCode": "T48201D",
        "abbrDesc":
            "Poisoning by unsp drugs acting on muscles, accidental, subs",
        "fullDesc":
            "Poisoning by unspecified drugs acting on muscles, accidental (unintentional), subsequent encounter",
        "categoryTitle":
            "Poisoning by unspecified drugs acting on muscles, accidental (unintentional)"
      },
      {
        "categoryCode": "T48201",
        "diagnosisCode": "S",
        "fullCode": "T48201S",
        "abbrDesc": "Poisoning by unsp drugs acting on muscles, acc, sequela",
        "fullDesc":
            "Poisoning by unspecified drugs acting on muscles, accidental (unintentional), sequela",
        "categoryTitle":
            "Poisoning by unspecified drugs acting on muscles, accidental (unintentional)"
      },
      {
        "categoryCode": "T48202",
        "diagnosisCode": "A",
        "fullCode": "T48202A",
        "abbrDesc":
            "Poisoning by unsp drugs acting on muscles, self-harm, init",
        "fullDesc":
            "Poisoning by unspecified drugs acting on muscles, intentional self-harm, initial encounter",
        "categoryTitle":
            "Poisoning by unspecified drugs acting on muscles, intentional self-harm"
      },
      {
        "categoryCode": "T48202",
        "diagnosisCode": "D",
        "fullCode": "T48202D",
        "abbrDesc":
            "Poisoning by unsp drugs acting on muscles, self-harm, subs",
        "fullDesc":
            "Poisoning by unspecified drugs acting on muscles, intentional self-harm, subsequent encounter",
        "categoryTitle":
            "Poisoning by unspecified drugs acting on muscles, intentional self-harm"
      },
      {
        "categoryCode": "T48202",
        "diagnosisCode": "S",
        "fullCode": "T48202S",
        "abbrDesc": "Poisn by unsp drugs acting on muscles, self-harm, sequela",
        "fullDesc":
            "Poisoning by unspecified drugs acting on muscles, intentional self-harm, sequela",
        "categoryTitle":
            "Poisoning by unspecified drugs acting on muscles, intentional self-harm"
      },
      {
        "categoryCode": "T48203",
        "diagnosisCode": "A",
        "fullCode": "T48203A",
        "abbrDesc": "Poisoning by unsp drugs acting on muscles, assault, init",
        "fullDesc":
            "Poisoning by unspecified drugs acting on muscles, assault, initial encounter",
        "categoryTitle":
            "Poisoning by unspecified drugs acting on muscles, assault"
      },
      {
        "categoryCode": "T48203",
        "diagnosisCode": "D",
        "fullCode": "T48203D",
        "abbrDesc": "Poisoning by unsp drugs acting on muscles, assault, subs",
        "fullDesc":
            "Poisoning by unspecified drugs acting on muscles, assault, subsequent encounter",
        "categoryTitle":
            "Poisoning by unspecified drugs acting on muscles, assault"
      },
      {
        "categoryCode": "T48203",
        "diagnosisCode": "S",
        "fullCode": "T48203S",
        "abbrDesc":
            "Poisoning by unsp drugs acting on muscles, assault, sequela",
        "fullDesc":
            "Poisoning by unspecified drugs acting on muscles, assault, sequela",
        "categoryTitle":
            "Poisoning by unspecified drugs acting on muscles, assault"
      },
      {
        "categoryCode": "T48204",
        "diagnosisCode": "A",
        "fullCode": "T48204A",
        "abbrDesc": "Poisoning by unsp drugs acting on muscles, undet, init",
        "fullDesc":
            "Poisoning by unspecified drugs acting on muscles, undetermined, initial encounter",
        "categoryTitle":
            "Poisoning by unspecified drugs acting on muscles, undetermined"
      },
      {
        "categoryCode": "T48204",
        "diagnosisCode": "D",
        "fullCode": "T48204D",
        "abbrDesc": "Poisoning by unsp drugs acting on muscles, undet, subs",
        "fullDesc":
            "Poisoning by unspecified drugs acting on muscles, undetermined, subsequent encounter",
        "categoryTitle":
            "Poisoning by unspecified drugs acting on muscles, undetermined"
      },
      {
        "categoryCode": "T48204",
        "diagnosisCode": "S",
        "fullCode": "T48204S",
        "abbrDesc": "Poisoning by unsp drugs acting on muscles, undet, sequela",
        "fullDesc":
            "Poisoning by unspecified drugs acting on muscles, undetermined, sequela",
        "categoryTitle":
            "Poisoning by unspecified drugs acting on muscles, undetermined"
      },
      {
        "categoryCode": "T48205",
        "diagnosisCode": "A",
        "fullCode": "T48205A",
        "abbrDesc":
            "Adverse effect of unsp drugs acting on muscles, init encntr",
        "fullDesc":
            "Adverse effect of unspecified drugs acting on muscles, initial encounter",
        "categoryTitle": "Adverse effect of unspecified drugs acting on muscles"
      },
      {
        "categoryCode": "T48205",
        "diagnosisCode": "D",
        "fullCode": "T48205D",
        "abbrDesc":
            "Adverse effect of unsp drugs acting on muscles, subs encntr",
        "fullDesc":
            "Adverse effect of unspecified drugs acting on muscles, subsequent encounter",
        "categoryTitle": "Adverse effect of unspecified drugs acting on muscles"
      }
    ];

    for (final read in reads) {
      await database.store.execute(
          'INSERT INTO _Icd (categoryCode, diagnosisCode, fullCode, abbrDesc, fullDesc, categoryTitle, createdAt) VALUES (@categoryCode, @diagnosisCode, @fullCode, @abbrDesc, @fullDesc, @categoryTitle, @createdAt)',
          substitutionValues: {
            'categoryCode': read['categoryCode'],
            'diagnosisCode': read['diagnosisCode'],
            'fullCode': read['fullCode'],
            'abbrDesc': read['abbrDesc'],
            'fullDesc': read['fullDesc'],
            'categoryTitle': read['categoryTitle'],
            'createdAt': DateTime.now()
          });
    }
  }
}
