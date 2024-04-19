import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'autenticar_widget.dart' show AutenticarWidget;
import 'package:flutter/material.dart';

class AutenticarModel extends FlutterFlowModel<AutenticarWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  List<UsersRecord> simpleSearchResults = [];
  // State field(s) for TabBarAuth widget.
  TabController? tabBarAuthController;
  int get tabBarAuthCurrentIndex =>
      tabBarAuthController != null ? tabBarAuthController!.index : 0;

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode1;
  TextEditingController? emailAddressTextController1;
  String? Function(BuildContext, String?)? emailAddressTextController1Validator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode1;
  TextEditingController? passwordTextController1;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? passwordTextController1Validator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode2;
  TextEditingController? emailAddressTextController2;
  String? Function(BuildContext, String?)? emailAddressTextController2Validator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode2;
  TextEditingController? passwordTextController2;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)? passwordTextController2Validator;

  @override
  void initState(BuildContext context) {
    passwordVisibility1 = false;
    passwordVisibility2 = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarAuthController?.dispose();
    emailAddressFocusNode1?.dispose();
    emailAddressTextController1?.dispose();

    passwordFocusNode1?.dispose();
    passwordTextController1?.dispose();

    emailAddressFocusNode2?.dispose();
    emailAddressTextController2?.dispose();

    passwordFocusNode2?.dispose();
    passwordTextController2?.dispose();
  }
}
