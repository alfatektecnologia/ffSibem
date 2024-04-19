import 'dart:convert';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start FlutterFlow + MySQL ApiFlow API Group Code

class FlutterFlowMySQLApiFlowAPIGroup {
  static String baseUrl =
      'https://gw.apiflow.online/api/89722068f470481c97d5d516583a97c6';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
  };
  static ListBensCall listBensCall = ListBensCall();
  static CreateNewBensCall createNewBensCall = CreateNewBensCall();
  static GetBensByIDCall getBensByIDCall = GetBensByIDCall();
  static UpdateBensCall updateBensCall = UpdateBensCall();
  static DeleteBensCall deleteBensCall = DeleteBensCall();
  static ListIgrejasCall listIgrejasCall = ListIgrejasCall();
  static CreateNewIgrejasCall createNewIgrejasCall = CreateNewIgrejasCall();
  static GetIgrejasByIDCall getIgrejasByIDCall = GetIgrejasByIDCall();
  static UpdateIgrejasCall updateIgrejasCall = UpdateIgrejasCall();
  static DeleteIgrejasCall deleteIgrejasCall = DeleteIgrejasCall();
  static ListInventarioCall listInventarioCall = ListInventarioCall();
  static CreateNewInventarioCall createNewInventarioCall =
      CreateNewInventarioCall();
  static GetInventarioByIDCall getInventarioByIDCall = GetInventarioByIDCall();
  static UpdateInventarioCall updateInventarioCall = UpdateInventarioCall();
  static DeleteInventarioCall deleteInventarioCall = DeleteInventarioCall();
  static ListInventarioDetalheCall listInventarioDetalheCall =
      ListInventarioDetalheCall();
  static CreateNewInventarioDetalheCall createNewInventarioDetalheCall =
      CreateNewInventarioDetalheCall();
  static GetInventarioDetalheByIDCall getInventarioDetalheByIDCall =
      GetInventarioDetalheByIDCall();
  static UpdateInventarioDetalheCall updateInventarioDetalheCall =
      UpdateInventarioDetalheCall();
  static DeleteInventarioDetalheCall deleteInventarioDetalheCall =
      DeleteInventarioDetalheCall();
  static ListSetoresCall listSetoresCall = ListSetoresCall();
  static CreateNewSetoresCall createNewSetoresCall = CreateNewSetoresCall();
  static GetSetoresByIDCall getSetoresByIDCall = GetSetoresByIDCall();
  static UpdateSetoresCall updateSetoresCall = UpdateSetoresCall();
  static DeleteSetoresCall deleteSetoresCall = DeleteSetoresCall();
  static ListVersiculosCall listVersiculosCall = ListVersiculosCall();
  static CreateNewVersiculosCall createNewVersiculosCall =
      CreateNewVersiculosCall();
  static GetVersiculosByIDCall getVersiculosByIDCall = GetVersiculosByIDCall();
  static UpdateVersiculosCall updateVersiculosCall = UpdateVersiculosCall();
  static DeleteVersiculosCall deleteVersiculosCall = DeleteVersiculosCall();
}

class ListBensCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    String? orderby = '',
    int? offset,
    int? limit,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'List Bens',
      apiUrl: '${FlutterFlowMySQLApiFlowAPIGroup.baseUrl}/table/bens',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
      },
      params: {
        'filter': filter,
        'orderby': orderby,
        'offset': offset,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateNewBensCall {
  Future<ApiCallResponse> call() async {
    const ffApiRequestBody = '''
{
  "id_bem": "220281004387",
  "id_igreja": 225353,
  "descricao": "1 - BANCO DE MADEIRA  /  GENUFLEXÓRIO - BANCO 2,40X0",
  "dependencia": "SALAO DE CULTO",
  "status": "Ativo"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create new Bens',
      apiUrl: '${FlutterFlowMySQLApiFlowAPIGroup.baseUrl}/table/bens',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetBensByIDCall {
  Future<ApiCallResponse> call({
    String? idBem = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Bens by ID',
      apiUrl: '${FlutterFlowMySQLApiFlowAPIGroup.baseUrl}/table/bens/$idBem',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateBensCall {
  Future<ApiCallResponse> call({
    String? idBem = '',
  }) async {
    const ffApiRequestBody = '''
{
  "id_bem": "220281004387",
  "id_igreja": 225353,
  "descricao": "1 - BANCO DE MADEIRA  /  GENUFLEXÓRIO - BANCO 2,40X0",
  "dependencia": "SALAO DE CULTO",
  "status": "Ativo"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Bens',
      apiUrl: '${FlutterFlowMySQLApiFlowAPIGroup.baseUrl}/table/bens/$idBem',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization':
            'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteBensCall {
  Future<ApiCallResponse> call({
    String? idBem = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Bens',
      apiUrl: '${FlutterFlowMySQLApiFlowAPIGroup.baseUrl}/table/bens/$idBem',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization':
            'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ListIgrejasCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    String? orderby = '',
    int? offset,
    int? limit,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'List Igrejas',
      apiUrl: '${FlutterFlowMySQLApiFlowAPIGroup.baseUrl}/table/igrejas',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
      },
      params: {
        'filter': filter,
        'orderby': orderby,
        'offset': offset,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateNewIgrejasCall {
  Future<ApiCallResponse> call() async {
    const ffApiRequestBody = '''
{
  "igreja": "string",
  "endereco": "string",
  "id_setor": 123,
  "situacao": 123
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create new Igrejas',
      apiUrl: '${FlutterFlowMySQLApiFlowAPIGroup.baseUrl}/table/igrejas',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetIgrejasByIDCall {
  Future<ApiCallResponse> call({
    int? idIgreja,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Igrejas by ID',
      apiUrl:
          '${FlutterFlowMySQLApiFlowAPIGroup.baseUrl}/table/igrejas/$idIgreja',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateIgrejasCall {
  Future<ApiCallResponse> call({
    int? idIgreja,
  }) async {
    const ffApiRequestBody = '''
{
  "igreja": "string",
  "endereco": "string",
  "id_setor": 123,
  "situacao": 123
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Igrejas',
      apiUrl:
          '${FlutterFlowMySQLApiFlowAPIGroup.baseUrl}/table/igrejas/$idIgreja',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization':
            'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteIgrejasCall {
  Future<ApiCallResponse> call({
    int? idIgreja,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Igrejas',
      apiUrl:
          '${FlutterFlowMySQLApiFlowAPIGroup.baseUrl}/table/igrejas/$idIgreja',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization':
            'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ListInventarioCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    String? orderby = '',
    int? offset,
    int? limit,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'List Inventario',
      apiUrl: '${FlutterFlowMySQLApiFlowAPIGroup.baseUrl}/table/inventario',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
      },
      params: {
        'filter': filter,
        'orderby': orderby,
        'offset': offset,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateNewInventarioCall {
  Future<ApiCallResponse> call() async {
    const ffApiRequestBody = '''
{
  "id_inventario": "12",
  "id_igreja": "224784",
  "data": "11/27/2021 10:24:11 AM",
  "responsaveis": "",
  "inventariantes": "RODRIGO\\r\\nMARCOS\\r\\nJACKSON",
  "inicio": "11/27/2021 10:24:46 AM",
  "termino": "11/27/2021 11:05:46 AM",
  "tempo": "00:41:00",
  "status": "Finalizado",
  "bens": 108
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create new Inventario',
      apiUrl: '${FlutterFlowMySQLApiFlowAPIGroup.baseUrl}/table/inventario',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetInventarioByIDCall {
  Future<ApiCallResponse> call({
    String? idInventario = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Inventario by ID',
      apiUrl:
          '${FlutterFlowMySQLApiFlowAPIGroup.baseUrl}/table/inventario/$idInventario',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateInventarioCall {
  Future<ApiCallResponse> call({
    String? idInventario = '',
  }) async {
    const ffApiRequestBody = '''
{
  "id_inventario": "12",
  "id_igreja": "224784",
  "data": "11/27/2021 10:24:11 AM",
  "responsaveis": "",
  "inventariantes": "RODRIGO\\r\\nMARCOS\\r\\nJACKSON",
  "inicio": "11/27/2021 10:24:46 AM",
  "termino": "11/27/2021 11:05:46 AM",
  "tempo": "00:41:00",
  "status": "Finalizado",
  "bens": 108
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Inventario',
      apiUrl:
          '${FlutterFlowMySQLApiFlowAPIGroup.baseUrl}/table/inventario/$idInventario',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization':
            'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteInventarioCall {
  Future<ApiCallResponse> call({
    String? idInventario = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Inventario',
      apiUrl:
          '${FlutterFlowMySQLApiFlowAPIGroup.baseUrl}/table/inventario/$idInventario',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization':
            'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ListInventarioDetalheCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    String? orderby = '',
    int? offset,
    int? limit,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'List Inventario_detalhe',
      apiUrl:
          '${FlutterFlowMySQLApiFlowAPIGroup.baseUrl}/table/inventario_detalhe',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
      },
      params: {
        'filter': filter,
        'orderby': orderby,
        'offset': offset,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateNewInventarioDetalheCall {
  Future<ApiCallResponse> call() async {
    const ffApiRequestBody = '''
{
  "id_inventario": 2203172,
  "id_bem": "220317000178",
  "situacao": "BIPADO",
  "acao": "PENDENTE",
  "cad_desc": "ITEM LOCALIZADO DESCONHECIDO",
  "cad_dep": "",
  "observacao": "",
  "cont": 1
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create new Inventario_detalhe',
      apiUrl:
          '${FlutterFlowMySQLApiFlowAPIGroup.baseUrl}/table/inventario_detalhe',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetInventarioDetalheByIDCall {
  Future<ApiCallResponse> call({
    int? idDetalhe,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Inventario_detalhe by ID',
      apiUrl:
          '${FlutterFlowMySQLApiFlowAPIGroup.baseUrl}/table/inventario_detalhe/$idDetalhe',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateInventarioDetalheCall {
  Future<ApiCallResponse> call({
    int? idDetalhe,
  }) async {
    const ffApiRequestBody = '''
{
  "id_inventario": 2203172,
  "id_bem": "220317000178",
  "situacao": "BIPADO",
  "acao": "PENDENTE",
  "cad_desc": "ITEM LOCALIZADO DESCONHECIDO",
  "cad_dep": "",
  "observacao": "",
  "cont": 1
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Inventario_detalhe',
      apiUrl:
          '${FlutterFlowMySQLApiFlowAPIGroup.baseUrl}/table/inventario_detalhe/$idDetalhe',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization':
            'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteInventarioDetalheCall {
  Future<ApiCallResponse> call({
    int? idDetalhe,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Inventario_detalhe',
      apiUrl:
          '${FlutterFlowMySQLApiFlowAPIGroup.baseUrl}/table/inventario_detalhe/$idDetalhe',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization':
            'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ListSetoresCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    String? orderby = '',
    int? offset,
    int? limit,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'List Setores',
      apiUrl: '${FlutterFlowMySQLApiFlowAPIGroup.baseUrl}/table/setores',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
      },
      params: {
        'filter': filter,
        'orderby': orderby,
        'offset': offset,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateNewSetoresCall {
  Future<ApiCallResponse> call() async {
    const ffApiRequestBody = '''
{
  "id_setor": "string",
  "setor": "string"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create new Setores',
      apiUrl: '${FlutterFlowMySQLApiFlowAPIGroup.baseUrl}/table/setores',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetSetoresByIDCall {
  Future<ApiCallResponse> call({
    String? idSetor = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Setores by ID',
      apiUrl:
          '${FlutterFlowMySQLApiFlowAPIGroup.baseUrl}/table/setores/$idSetor',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateSetoresCall {
  Future<ApiCallResponse> call({
    String? idSetor = '',
  }) async {
    const ffApiRequestBody = '''
{
  "id_setor": "string",
  "setor": "string"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Setores',
      apiUrl:
          '${FlutterFlowMySQLApiFlowAPIGroup.baseUrl}/table/setores/$idSetor',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization':
            'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteSetoresCall {
  Future<ApiCallResponse> call({
    String? idSetor = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Setores',
      apiUrl:
          '${FlutterFlowMySQLApiFlowAPIGroup.baseUrl}/table/setores/$idSetor',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization':
            'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ListVersiculosCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    String? orderby = '',
    int? offset,
    int? limit,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'List Versiculos',
      apiUrl: '${FlutterFlowMySQLApiFlowAPIGroup.baseUrl}/table/versiculos',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
      },
      params: {
        'filter': filter,
        'orderby': orderby,
        'offset': offset,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateNewVersiculosCall {
  Future<ApiCallResponse> call() async {
    const ffApiRequestBody = '''
{
  "fonte": "2Coríntios 12:10 ARC",
  "texto": "Pelo que sinto prazer nas fraquezas, nas injúrias, nas necessidades, nas perseguições, nas angústias, por amor de Cristo. Porque, quando estou fraco, então, sou forte."
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create new Versiculos',
      apiUrl: '${FlutterFlowMySQLApiFlowAPIGroup.baseUrl}/table/versiculos',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetVersiculosByIDCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Versiculos by ID',
      apiUrl:
          '${FlutterFlowMySQLApiFlowAPIGroup.baseUrl}/table/versiculos/$id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateVersiculosCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    const ffApiRequestBody = '''
{
  "fonte": "2Coríntios 12:10 ARC",
  "texto": "Pelo que sinto prazer nas fraquezas, nas injúrias, nas necessidades, nas perseguições, nas angústias, por amor de Cristo. Porque, quando estou fraco, então, sou forte."
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Versiculos',
      apiUrl:
          '${FlutterFlowMySQLApiFlowAPIGroup.baseUrl}/table/versiculos/$id',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization':
            'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteVersiculosCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Versiculos',
      apiUrl:
          '${FlutterFlowMySQLApiFlowAPIGroup.baseUrl}/table/versiculos/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization':
            'Bearer MGFiODA1N2EyYWEzYTc0NTAyNjkxZTQwYjFmN2U2NGI6NGYzZWFhYzlmMjEyYWQ2NjM2MGEyOThhNzU0N2NmYjA=',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End FlutterFlow + MySQL ApiFlow API Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
