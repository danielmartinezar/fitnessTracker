import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:tutorial/home_page/actividad.dart';
import 'package:tutorial/home_page/actividades_controller.dart';
import 'package:tutorial/current_activity/current_activity_widget.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';
import 'package:tutorial/activity_detail/activity_detail_widget.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
    Get.put(ActividadesController()); // 2. Inicializa el controlador
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final actividadesController =
        Get.find<ActividadesController>(); // Obtiene el controlador

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1F4F8),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _mostrarAlerta(context);
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        elevation: 10,
        child: Icon(
          Icons.add,
          color: Color(0xFF254A7A),
          size: 28,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFFF1F4F8),
        automaticallyImplyLeading: false,
        title: Text(
          'Activity',
          textAlign: TextAlign.start,
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Welcome back,',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                      child: Text(
                        'John!',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF254A7A),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: actividadesController.actividades.length,
                  itemBuilder: (BuildContext context, int index) {
                    final actividad = actividadesController.actividades[index];
                    return _buildActividadCard(context, actividad);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Elige una opción'),
          content: Text('¿Quieres trotar o andar en bicicleta?'),
          actions: <Widget>[
            TextButton(
              child: Text('Trotar'),
              onPressed: () {
                // Redirigir a la página de trotar
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => CurrentActivityWidget(
                          //tipo: "Trotar",
                          )),
                );
              },
            ),
            TextButton(
              child: Text('Bicicleta'),
              onPressed: () {
                // Redirigir a la página de bicicleta
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => CurrentActivityWidget(
                          //tipo: "Bicicleta",
                          )),
                );
              },
            )
          ],
        );
      },
    );
  }

  Widget _buildActividadCard(BuildContext context, Actividad actividad) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
        child: InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ActivityDetailWidget(actividad: actividad),
              ),
            );
          },
          child: Container(
            width: 315,
            height: 124,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black,
              ),
            ),
            alignment: AlignmentDirectional(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Text(
                    '${actividad.tipo}',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.8, 0),
                  child: Text(
                    '${actividad.fecha}',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.4, 0),
                  child: Text(
                    '${actividad.km}km',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.9, 0.05),
                  child: Icon(
                    actividad.tipo == 'Running'
                        ? Icons.directions_run
                        : actividad.tipo == 'Bicycle'
                            ? Icons.directions_bike
                            : Icons.directions_walk,
                    color: Color(0xFF254A7A),
                    size: 28,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.4, 0),
                  child: Text(
                    '${actividad.cronometro}',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
