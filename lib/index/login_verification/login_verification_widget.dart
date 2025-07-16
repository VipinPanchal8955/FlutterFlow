import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_verification_model.dart';
export 'login_verification_model.dart';

class LoginVerificationWidget extends StatefulWidget {
  const LoginVerificationWidget({super.key});

  static String routeName = 'Login_Verification';
  static String routePath = '/loginVerification';

  @override
  State<LoginVerificationWidget> createState() =>
      _LoginVerificationWidgetState();
}

class _LoginVerificationWidgetState extends State<LoginVerificationWidget>
    with TickerProviderStateMixin {
  late LoginVerificationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginVerificationModel());

    _model.pinCodeFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 1800.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 8,
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 140.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16.0),
                              bottomRight: Radius.circular(16.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                32.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Anvatrix',
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    font: GoogleFonts.notoSerif(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 50.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 16.0, 0.0, 16.0),
                              child: Text(
                                'Enter your PIN below',
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Anwatrix_Font',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 16.0),
                              child: Text(
                                'We’ve sent an OTP to your mobile. Enter it below to login.',
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.notoSerif(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Form(
                                  key: _model.formKey,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 400.0,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: PinCodeTextField(
                                        autoDisposeControllers: false,
                                        appContext: context,
                                        length: 6,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font: GoogleFonts.notoSerif(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontStyle,
                                            ),
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        enableActiveFill: false,
                                        autoFocus: true,
                                        focusNode: _model.pinCodeFocusNode,
                                        enablePinAutofill: true,
                                        errorTextSpace: 16.0,
                                        showCursor: true,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        obscureText: false,
                                        hintCharacter: '-',
                                        keyboardType: TextInputType.number,
                                        pinTheme: PinTheme(
                                          fieldHeight: 50.0,
                                          fieldWidth: 44.0,
                                          borderWidth: 2.0,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(12.0),
                                            bottomRight: Radius.circular(12.0),
                                            topLeft: Radius.circular(12.0),
                                            topRight: Radius.circular(12.0),
                                          ),
                                          shape: PinCodeFieldShape.box,
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          inactiveColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          selectedColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                        ),
                                        controller: _model.pinCodeController,
                                        onChanged: (_) {},
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        validator: _model
                                            .pinCodeControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: FFButtonWidget(
                                    onPressed: (_model.pinCodeController!.text ==
                                                '')
                                        ? null
                                        : () async {
                                            _model.loginVerificationForm = true;
                                            if (_model.formKey.currentState ==
                                                    null ||
                                                !_model.formKey.currentState!
                                                    .validate()) {
                                              safeSetState(() =>
                                                  _model.loginVerificationForm =
                                                      false);
                                              return;
                                            }
                                            GoRouter.of(context)
                                                .prepareAuthEvent();
                                            final smsCodeVal =
                                                _model.pinCodeController!.text;
                                            if (smsCodeVal.isEmpty) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                      'Enter SMS verification code.'),
                                                ),
                                              );
                                              return;
                                            }
                                            final phoneVerifiedUser =
                                                await authManager.verifySmsCode(
                                              context: context,
                                              smsCode: smsCodeVal,
                                            );
                                            if (phoneVerifiedUser == null) {
                                              return;
                                            }

                                            context.pushNamedAuth(
                                              LodingPageWidget.routeName,
                                              context.mounted,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType
                                                          .leftToRight,
                                                  duration: Duration(
                                                      milliseconds: 1000),
                                                ),
                                              },
                                            );

                                            safeSetState(() {});
                                          },
                                    text: 'Submit Code',
                                    icon: Icon(
                                      Icons.arrow_right_alt_rounded,
                                      size: 24.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: 370.0,
                                      height: 44.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      iconColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.notoSerif(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                      disabledColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      disabledTextColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      hoverColor:
                                          FlutterFlowTheme.of(context).success,
                                      hoverBorderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      hoverTextColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      hoverElevation: 3.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      width: 100.0,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: Image.asset(
                            'assets/images/Professional_Logo_for_Anvatrix_(2).png',
                          ).image,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation']!),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
