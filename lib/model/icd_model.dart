import 'package:mpharma/mpharma.dart';

class ICD extends ManagedObject<_ICD> implements _ICD {

  @override
  void willInsert() {
    createdAt = DateTime.now().toUtc();
  }
}

class _ICD {
  @primaryKey
  int id;

  @Column()
  String categoryCode;

  @Column()
  int diagnosisCode;

  @Column()
  String fullCode;

  @Column()
  String abbrDesc;

  @Column()
  String fullDesc;

  @Column()
  String categoryTitle;

  @Column()
  DateTime createdAt;

}