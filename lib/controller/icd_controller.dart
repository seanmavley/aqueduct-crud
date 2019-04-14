import 'package:aqueduct/aqueduct.dart';
import 'package:mpharma/mpharma.dart';
import 'package:mpharma/model/icd_model.dart';

class ICDController extends ResourceController {
  ICDController(this.context);

  final ManagedContext context;

  /*
    GET
    example.com/icd

    Returns 100 rows in DB, unless pagination is used via the 
    `limit` and `offset` query params.

    To fetch 1000 rows, specific via
    example.com/icd?limit=1000

    Tweak the `pageby` to specify how the increments data
    will be fetched

  */
  @Operation.get()
  Future<Response> getAll({@Bind.query('limit') int limit, @Bind.query('offset') int pageby}) async {

    limit ??= 100;
    pageby ??= 0;

    if (pageby != null) { pageby = pageby * 10; }
    
    final icdQuery = Query<ICD>(context);

    icdQuery
      ..pageBy((p) => p.createdAt, QuerySortOrder.descending)
      ..fetchLimit = limit
      ..offset = pageby;
      
    final icds = await icdQuery.fetch();

    return Response.ok(icds);
  }

  /*
    GET
    example.com/icd/1

    Gets detail item by ID in the database,
    *NOT* the ICD ID
  */

  @Operation.get('id')
  Future<Response> getById(@Bind.path('id') int id) async {
    final query = Query<ICD>(context)..where((icd) => icd.id).equalTo(id);

    final icd = await query.fetchOne();

    if (icd == null) {
      return Response.notFound(body: 'Not found');
    }

    return Response.ok(icd);
  }


  /*
    POST
    example.com/icd
  */

  @Operation.post()
  Future<Response> createICD(@Bind.body() ICD body) async {
    final query = Query<ICD>(context)..values = body;
    final insertICD = await query.insert();

    return Response.ok(insertICD);
  }

  /*
    PUT
    example.com/icd/1
  */

  @Operation.put('id')
  Future<Response> updateById(
      @Bind.path('id') int id, @Bind.body() ICD body) async {
    final query = Query<ICD>(context)
      ..where((icd) => icd.id).equalTo(id)
      ..values = body;

    final icd = await query.updateOne();

    if (icd == null) {
      return Response.notFound(body: 'Not found');
    }

    return Response.ok(icd);
  }

  /*
    DELETE
    example.com/icd/1
  */
  
  @Operation.delete('id')
  Future<Response> deleteById(@Bind.path('id') int id) async {
    final query = Query<ICD>(context)..where((icd) => icd.id).equalTo(id);

    final icd = await query.delete();
    return Response.ok({'state': true, 'msg': 'Delete successfull'});
  }
}
