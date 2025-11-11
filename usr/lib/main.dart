import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Electrónica Industrial',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const PresentationScreen(),
    );
  }
}

class PresentationScreen extends StatefulWidget {
  const PresentationScreen({super.key});

  @override
  State<PresentationScreen> createState() => _PresentationScreenState();
}

class _PresentationScreenState extends State<PresentationScreen> {
  int _currentSlide = 0;
  final PageController _pageController = PageController();

  final List<SlideData> _slides = [
    SlideData(
      title: 'ELECTRÓNICA INDUSTRIAL',
      subtitle: 'Fundamentos y Aplicaciones',
      content: [
        '📚 Introducción a la Electrónica Industrial',
        '⚡ Componentes y Sistemas',
        '🔧 Aplicaciones Prácticas',
        '🏭 Automatización Industrial',
      ],
      icon: Icons.electrical_services,
      color: Colors.blue,
    ),
    SlideData(
      title: '¿Qué es la Electrónica Industrial?',
      subtitle: 'Definición y Alcance',
      content: [
        '• Rama de la electrónica aplicada a procesos industriales',
        '• Control y automatización de maquinaria',
        '• Conversión y distribución de energía',
        '• Sistemas de control y monitoreo',
        '• Integración de sensores y actuadores',
      ],
      icon: Icons.factory,
      color: Colors.indigo,
    ),
    SlideData(
      title: 'Componentes Principales',
      subtitle: 'Dispositivos de Potencia',
      content: [
        '🔹 Diodos de Potencia',
        '🔹 Tiristores (SCR, TRIAC)',
        '🔹 Transistores (BJT, MOSFET, IGBT)',
        '🔹 Rectificadores',
        '🔹 Inversores y Convertidores',
        '🔹 Relés y Contactores',
      ],
      icon: Icons.memory,
      color: Colors.purple,
    ),
    SlideData(
      title: 'Controladores Lógicos Programables',
      subtitle: 'PLC - Corazón de la Automatización',
      content: [
        '✓ Control automatizado de procesos',
        '✓ Programación mediante lógica ladder',
        '✓ Entradas y salidas digitales/analógicas',
        '✓ Comunicación industrial (Modbus, Profibus)',
        '✓ Alta fiabilidad y robustez',
      ],
      icon: Icons.developer_board,
      color: Colors.teal,
    ),
    SlideData(
      title: 'Sensores Industriales',
      subtitle: 'Adquisición de Datos',
      content: [
        '📊 Sensores de temperatura (RTD, termopares)',
        '📊 Sensores de presión',
        '📊 Sensores de proximidad (inductivos, capacitivos)',
        '📊 Encoders y resolvers',
        '📊 Sensores de flujo y nivel',
      ],
      icon: Icons.sensors,
      color: Colors.orange,
    ),
    SlideData(
      title: 'Variadores de Velocidad',
      subtitle: 'Control de Motores',
      content: [
        '• Control preciso de velocidad de motores',
        '• Ahorro energético significativo',
        '• Arranque suave y protección',
        '• Inversión de giro programable',
        '• Comunicación con sistemas SCADA',
      ],
      icon: Icons.speed,
      color: Colors.green,
    ),
    SlideData(
      title: 'Sistemas SCADA',
      subtitle: 'Supervisión y Control',
      content: [
        '🖥️ Supervisory Control and Data Acquisition',
        '🖥️ Monitoreo en tiempo real',
        '🖥️ Interfaz gráfica intuitiva (HMI)',
        '🖥️ Registro histórico de datos',
        '🖥️ Alarmas y notificaciones',
      ],
      icon: Icons.monitor,
      color: Colors.cyan,
    ),
    SlideData(
      title: 'Aplicaciones Industriales',
      subtitle: 'Sectores y Usos',
      content: [
        '🏭 Manufactura y producción',
        '🏭 Industria automotriz',
        '🏭 Procesamiento de alimentos',
        '🏭 Petroquímica y refinación',
        '🏭 Tratamiento de aguas',
        '🏭 Energías renovables',
      ],
      icon: Icons.business,
      color: Colors.deepOrange,
    ),
    SlideData(
      title: 'Seguridad Industrial',
      subtitle: 'Protección de Personas y Equipos',
      content: [
        '⚠️ Sistemas de paro de emergencia',
        '⚠️ Protecciones contra sobrecorriente',
        '⚠️ Aislamiento galvánico',
        '⚠️ Certificaciones (CE, UL, IEC)',
        '⚠️ Mantenimiento preventivo',
      ],
      icon: Icons.security,
      color: Colors.red,
    ),
    SlideData(
      title: 'Industria 4.0',
      subtitle: 'El Futuro de la Electrónica Industrial',
      content: [
        '🚀 Internet de las Cosas (IoT)',
        '🚀 Inteligencia Artificial y Machine Learning',
        '🚀 Big Data y Analytics',
        '🚀 Robótica avanzada',
        '🚀 Gemelos digitales',
        '🚀 Mantenimiento predictivo',
      ],
      icon: Icons.rocket_launch,
      color: Colors.deepPurple,
    ),
    SlideData(
      title: '¡Gracias por su Atención!',
      subtitle: 'Preguntas y Comentarios',
      content: [
        '💡 La electrónica industrial es fundamental',
        '💡 Evolución constante de tecnologías',
        '💡 Oportunidades profesionales amplias',
        '',
        '¿Preguntas?',
      ],
      icon: Icons.question_answer,
      color: Colors.blueGrey,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextSlide() {
    if (_currentSlide < _slides.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousSlide() {
    if (_currentSlide > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: KeyboardListener(
        focusNode: FocusNode()..requestFocus(),
        autofocus: true,
        onKeyEvent: (event) {
          if (event is KeyDownEvent) {
            if (event.logicalKey == LogicalKeyboardKey.arrowRight ||
                event.logicalKey == LogicalKeyboardKey.space) {
              _nextSlide();
            } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
              _previousSlide();
            }
          }
        },
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentSlide = index;
                });
              },
              itemCount: _slides.length,
              itemBuilder: (context, index) {
                return SlideWidget(slide: _slides[index]);
              },
            ),
            // Navigation controls
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: _currentSlide > 0 ? _previousSlide : null,
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    iconSize: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${_currentSlide + 1} / ${_slides.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: _currentSlide < _slides.length - 1
                        ? _nextSlide
                        : null,
                    icon: const Icon(Icons.arrow_forward_ios),
                    color: Colors.white,
                    iconSize: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SlideWidget extends StatelessWidget {
  final SlideData slide;

  const SlideWidget({super.key, required this.slide});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            slide.color.withOpacity(0.8),
            slide.color.withOpacity(0.4),
            Colors.grey[900]!,
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon
              Icon(
                slide.icon,
                size: 80,
                color: Colors.white.withOpacity(0.9),
              ),
              const SizedBox(height: 30),
              // Title
              Text(
                slide.title,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              // Subtitle
              Text(
                slide.subtitle,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w300,
                  color: Colors.white.withOpacity(0.8),
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 40),
              // Content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: slide.content.map((item) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            height: 1.5,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SlideData {
  final String title;
  final String subtitle;
  final List<String> content;
  final IconData icon;
  final Color color;

  SlideData({
    required this.title,
    required this.subtitle,
    required this.content,
    required this.icon,
    required this.color,
  });
}
