import 'harness/app.dart';
import 'package:mpharma/model/icd_model.dart';

Future main() async {
  final harness = Harness()..install();

  final body = {
    'categoryCode': 'A00',
    'diagnosisCode': 9,
    'fullCode': 'A009',
    'abbrDesc': 'Cholera, unspecified',
    'fullDesc': 'Cholera, unspecified',
    'categoryTitle': 'Cholera',
  };

  final putBody = {
    'categoryCode': 'A50',
    'diagnosisCode': 50,
    'fullCode': 'A050',
    'abbrDesc': 'Health, unspecified',
    'fullDesc': 'Health, unspecified',
    'categoryTitle': 'Tuberclosis',
  };

  test("GET /example returns 200 {'key': 'value'}", () async {
    expectResponse(await harness.agent.get("/example"), 200,
        body: {"key": "value"});
  });

  test("GET /icd returns 200 OK", () async {
    final postResponse = await harness.agent.post("/icd", body: body);
    expectResponse(postResponse, 200);

    final response = await harness.agent.get("/icd");
    expectResponse(response, 200,
        body: allOf([
          hasLength(greaterThan(0)),
          everyElement({
            "id": greaterThan(0),
            "categoryCode": isString,
            "diagnosisCode": isNumber,
            "fullCode": isString,
            "abbrDesc": isString,
            "fullDesc": isString,
            "categoryTitle": isString,
            "createdAt": isString
          })
        ]));
  });

  test("After POST to /icd, GET /icd/:id returns icd", () async {
    final postResponse = await harness.agent.post("/icd", body: body);
    expectResponse(postResponse, 200);

    final icdId = postResponse.body.as<Map>()["id"];
    final getResponse = await harness.agent.get("/icd/$icdId");
    expectResponse(getResponse, 200);
  });

  test("After POST to /icd, PUT /icd/:id returns updated icd", () async {
    // do POST
    final postResponse = await harness.agent.post("/icd", body: body);
    expectResponse(postResponse, 200);

    final icdId = postResponse.body.as<Map>()["id"];

    // do PUT
    final putResponse = await harness.agent.put("/icd/$icdId", body: putBody);
    expectResponse(putResponse, 200);

    final getResponse = await harness.agent.get("/icd/$icdId");

    putBody['id'] = icdId;
    expect(
        getResponse,
        hasResponse(200,
            body: partial({
              "id": icdId,
              "categoryCode": putBody['categoryCode'],
            })));
  });

  test("After POST to /icd, DELETE /icd/:id returns 'state': true", () async {
    final postResponse = await harness.agent.post("/icd", body: body);
    expectResponse(postResponse, 200);

    final icdId = postResponse.body.as<Map>()["id"];

    final delResponse = await harness.agent.delete("/icd/$icdId");

    putBody['id'] = icdId;
    expect(
        delResponse,
        hasResponse(200,
            body: partial({
              "state": true,
            })));
  });

  // TODO: Test for pagination not implemented. Why not try that as an exercise?
}
