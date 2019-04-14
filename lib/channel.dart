import 'controller/icd_controller.dart';
import 'dart:io';
import 'mpharma.dart';

class MpharmaChannel extends ApplicationChannel {
  ManagedContext context;

  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

                   // this Class is at the bottom
    final config = DatabaseConfig(options.configurationFilePath);

    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();

    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
      config.database.username,
      config.database.password,
      config.database.host,
      config.database.port,
      config.database.databaseName,
    );

    context = ManagedContext(dataModel, persistentStore);
  }

  @override
  Controller get entryPoint {
    final router = Router();

    router.route("/example").linkFunction((request) async {
      return Response.ok({"key": "value"});
    });

    router.route('/icd/[:id]').link(() => ICDController(context));

    return router;
  }
}

class DatabaseConfig extends Configuration {
  DatabaseConfig(String path) : super.fromFile(File(path));

  DatabaseConfiguration database;

  @optionalConfiguration
  int identifier;
}