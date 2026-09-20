import 'package:flutter/material.dart';
import 'dart:math';

// ─── MOVES ───────────────────────────────────────────────────────────────────

class Move {
  final String name;
  final String emoji;
  final int minDmg;
  final int maxDmg;
  final int healMin;
  final int healMax;
  final int hamonCharge;
  final double accuracy;
  final Color color;
  final String flavor;

  const Move({
    required this.name,
    required this.emoji,
    this.minDmg = 0,
    this.maxDmg = 0,
    this.healMin = 0,
    this.healMax = 0,
    this.hamonCharge = 15,
    this.accuracy = 1.0,
    required this.color,
    required this.flavor,
  });

  bool get isHeal => healMin > 0 && minDmg == 0;
  bool get isDrain => healMin > 0 && minDmg > 0;
}

// ── Jonathan moves ──────────────────────────────────────────────────────────
const jojoMoves = [
  Move(
    name: 'Sunlight Overdrive',
    emoji: '☀️',
    minDmg: 20, maxDmg: 32,
    hamonCharge: 25,
    color: Color(0xFFFFD700),
    flavor: '¡El calor del sol fluye por los puños de Jonathan!',
  ),
  Move(
    name: 'Zoom Punch',
    emoji: '👊',
    minDmg: 14, maxDmg: 24,
    hamonCharge: 15,
    color: Color(0xFFFF8C00),
    flavor: '¡El brazo de Jonathan se extiende a velocidad increíble!',
  ),
  Move(
    name: 'Scarlet Overdrive',
    emoji: '🔥',
    minDmg: 28, maxDmg: 44,
    hamonCharge: 35,
    accuracy: 0.70,
    color: Color(0xFFFF4500),
    flavor: '¡Hamon de fuego ardiente envuelve el puño!',
  ),
  Move(
    name: 'Sendo Breath',
    emoji: '💚',
    healMin: 18, healMax: 28,
    hamonCharge: 20,
    color: Color(0xFF00C853),
    flavor: 'Jonathan respira y concentra el Hamon curativo...',
  ),
];

// ── Zeppeli moves ───────────────────────────────────────────────────────────
const zeppeliMoves = [
  Move(
    name: 'Ripple Cutter',
    emoji: '🌊',
    minDmg: 16, maxDmg: 28,
    hamonCharge: 20,
    color: Color(0xFF00BCD4),
    flavor: '¡Zeppeli lanza una ola de Hamon cortante!',
  ),
  Move(
    name: 'Tornado Overdrive',
    emoji: '🌪️',
    minDmg: 26, maxDmg: 40,
    hamonCharge: 30,
    accuracy: 0.75,
    color: Color(0xFF7C4DFF),
    flavor: '¡Zeppeli gira con fuerza devastadora de Hamon!',
  ),
  Move(
    name: 'Wine Ripple',
    emoji: '🍷',
    healMin: 22, healMax: 34,
    hamonCharge: 35,
    color: Color(0xFFE91E63),
    flavor: '¡Zeppeli bebe vino y canaliza Hamon curativo con maestría!',
  ),
  Move(
    name: 'Sendo Wave',
    emoji: '💫',
    minDmg: 12, maxDmg: 22,
    hamonCharge: 40,
    color: Color(0xFF00E5FF),
    flavor: '¡Zeppeli emite una onda Hamon a larga distancia!',
  ),
];

// ── Dio normal moves ─────────────────────────────────────────────────────────
const dioNormalMoves = [
  Move(
    name: 'Vaporization Freeze',
    emoji: '🧊',
    minDmg: 18, maxDmg: 30,
    color: Color(0xFF00BCD4),
    flavor: '¡Dio congela el brazo del héroe!',
  ),
  Move(
    name: 'Stingy Eyes',
    emoji: '👁️',
    minDmg: 24, maxDmg: 38,
    color: Color(0xFF9C27B0),
    flavor: '¡Disparos de presión ocular de Dio!',
  ),
  Move(
    name: 'Zombie Horde',
    emoji: '🧟',
    minDmg: 14, maxDmg: 24,
    color: Color(0xFF4CAF50),
    flavor: '¡Dio invoca su horda de zombies!',
  ),
  Move(
    name: 'Vampiric Regen',
    emoji: '🩸',
    healMin: 20, healMax: 30,
    color: Color(0xFFF44336),
    flavor: '¡Dio se regenera absorbiendo sangre!',
  ),
];

// ── Dio vampire moves (más fuertes) ─────────────────────────────────────────
const dioVampireMoves = [
  Move(
    name: 'Space Ripper Stingy',
    emoji: '💀',
    minDmg: 35, maxDmg: 52,
    color: Color(0xFF6A0DAD),
    flavor: '¡WRYYY! ¡Ataque imparable del vampiro inmortal!',
  ),
  Move(
    name: 'Life Drain',
    emoji: '🔴',
    minDmg: 22, maxDmg: 34,
    healMin: 14, healMax: 20,
    color: Color(0xFFB71C1C),
    flavor: '¡Dio drena la vida directamente!',
  ),
  Move(
    name: 'Vaporization Storm',
    emoji: '❄️',
    minDmg: 28, maxDmg: 44,
    hamonCharge: 0,
    color: Color(0xFF00ACC1),
    flavor: '¡Tormenta de congelación vampírica!',
  ),
];

// ─── CHARACTER DATA ───────────────────────────────────────────────────────────

class Fighter {
  final String id;
  final String name;
  final String role;
  final String description;
  final int maxHp;
  final String idleImage;
  final String attackImage;
  final Color borderColor;
  final Color glowColor;
  final List<Move> moves;
  final String superName;
  final String superEmoji;
  final int superMinDmg;
  final int superMaxDmg;

  const Fighter({
    required this.id,
    required this.name,
    required this.role,
    required this.description,
    required this.maxHp,
    required this.idleImage,
    required this.attackImage,
    required this.borderColor,
    required this.glowColor,
    required this.moves,
    required this.superName,
    required this.superEmoji,
    required this.superMinDmg,
    required this.superMaxDmg,
  });
}

const jonathan = Fighter(
  id: 'jonathan',
  name: 'JONATHAN JOESTAR',
  role: 'Caballero del Hamon',
  description: 'Jonathan domina el Hamon a través del espíritu de un caballero. Sus ataques son poderosos y directos.',
  maxHp: 120,
  idleImage: 'assets/images/jonathan_idle.png',
  attackImage: 'assets/images/jonathan_attack.png',
  borderColor: Color(0xFFD4AF37),
  glowColor: Color(0xFFD4AF37),
  moves: jojoMoves,
  superName: 'SUNLIGHT YELLOW OVERDRIVE',
  superEmoji: '⚡',
  superMinDmg: 48,
  superMaxDmg: 68,
);

const zeppeli = Fighter(
  id: 'zeppeli',
  name: 'WILL A. ZEPPELI',
  role: 'Maestro del Hamon',
  description: 'Zeppeli es el maestro del Hamon con décadas de experiencia. Su Wine Ripple cura más y sus ondas alcanzan larga distancia.',
  maxHp: 105,
  idleImage: 'assets/images/zeppeli_idle.png',
  attackImage: 'assets/images/zeppeli_attack.png',
  borderColor: Color(0xFF00BCD4),
  glowColor: Color(0xFF00BCD4),
  moves: zeppeliMoves,
  superName: 'SENDO OVERDRIVE FINAL',
  superEmoji: '🌊',
  superMinDmg: 44,
  superMaxDmg: 72,
);

// ─── GAME PHASES ─────────────────────────────────────────────────────────────

enum BattleState { choosing, animating, dioTurn, finished }
enum GamePhase   { intro, charSelect, battle, result }

// ─── GAME SCREEN ─────────────────────────────────────────────────────────────

class JuegoScreen extends StatefulWidget {
  const JuegoScreen({super.key});

  @override
  State<JuegoScreen> createState() => _JuegoScreenState();
}

class _JuegoScreenState extends State<JuegoScreen> with TickerProviderStateMixin {
  static const int dioMaxHp = 170;
  static const int maxHamon = 100;

  GamePhase phase = GamePhase.intro;
  Fighter? selectedFighter;
  String _battleBg = 'assets/images/battle_bg.jpg';

  static const _battleBgs = [
    'assets/images/battle_bg.jpg',
    'assets/images/battle_bg2.png',
  ];

  int playerHp = 120;
  int dioHp    = dioMaxHp;
  int hamon    = 0;

  bool _vampireMode      = false;
  bool _vampireAnnounced = false;
  bool _superAvailable   = false;
  bool _playerAttacking  = false;
  bool _dioAttacking     = false;
  bool _lastStandUsed    = false;
  bool _lastStandAnnounced = false;

  BattleState state = BattleState.choosing;
  String battleLog  = '';
  bool playerWon    = false;

  late AnimationController _playerShake;
  late AnimationController _dioShake;
  late AnimationController _playerMove;
  late AnimationController _dioFlash;
  late AnimationController _playerFlash;
  late Animation<double> _playerShakeAnim;
  late Animation<double> _dioShakeAnim;
  late Animation<double> _playerMoveAnim;

  late AnimationController _hpBarPlayer;
  late AnimationController _hpBarDio;
  late AnimationController _hamonBar;

  final _rng = Random();

  @override
  void initState() {
    super.initState();
    _playerShake = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _dioShake    = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _playerFlash = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _dioFlash    = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _playerMove  = AnimationController(vsync: this, duration: const Duration(milliseconds: 350));
    _hpBarPlayer = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _hpBarDio    = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _hamonBar    = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));

    _playerShakeAnim = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -12.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -12.0, end: 12.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 12.0, end: 0.0),   weight: 1),
    ]).animate(_playerShake);

    _dioShakeAnim = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -12.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -12.0, end: 12.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 12.0, end: 0.0),   weight: 1),
    ]).animate(_dioShake);

    _playerMoveAnim = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 45.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 45.0, end: 0.0), weight: 1),
    ]).animate(CurvedAnimation(parent: _playerMove, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _playerShake.dispose(); _dioShake.dispose();
    _playerFlash.dispose(); _dioFlash.dispose();
    _playerMove.dispose();
    _hpBarPlayer.dispose(); _hpBarDio.dispose();
    _hamonBar.dispose();
    super.dispose();
  }

  int _roll(int min, int max) => min + _rng.nextInt(max - min + 1);

  void _chargeHamon(int amount) {
    hamon = (hamon + amount).clamp(0, maxHamon);
    _hamonBar.animateTo(hamon / maxHamon);
    if (hamon >= maxHamon) setState(() => _superAvailable = true);
  }

  void _selectFighter(Fighter f) {
    final bg = _battleBgs[_rng.nextInt(_battleBgs.length)];
    setState(() {
      selectedFighter = f;
      _battleBg = bg;
      phase = GamePhase.battle;
      playerHp = f.maxHp;
      dioHp = dioMaxHp;
      hamon = 0;
      _vampireMode = false; _vampireAnnounced = false;
      _superAvailable = false; _playerAttacking = false; _dioAttacking = false;
      _lastStandUsed = false; _lastStandAnnounced = false;
      state = BattleState.choosing;
      battleLog = '¡Dio Brando aparece!\n"¡Tu destino es morir, ${f.name.split(' ').first}!"';
    });
    _hpBarPlayer.value = 1.0;
    _hpBarDio.value    = 1.0;
    _hamonBar.value    = 0.0;
  }

  void _restart() => setState(() => phase = GamePhase.charSelect);

  Future<void> _useMove(int index, {bool isSuperAttack = false}) async {
    if (state != BattleState.choosing || selectedFighter == null) return;
    final fighter = selectedFighter!;
    setState(() { state = BattleState.animating; _playerAttacking = true; });
    _playerMove.forward(from: 0);

    if (isSuperAttack) {
      final isCrit = _rng.nextDouble() < 0.30; // 30% en super
      final baseDmg = _roll(fighter.superMinDmg, fighter.superMaxDmg);
      final dmg = isCrit ? (baseDmg * 1.8).round() : baseDmg;
      setState(() {
        dioHp = (dioHp - dmg).clamp(0, dioMaxHp);
        _hpBarDio.animateTo(dioHp / dioMaxHp);
        hamon = 0; _superAvailable = false;
        battleLog = isCrit
            ? '${fighter.superEmoji} ¡${fighter.superName}!\n💥 ¡GOLPE CRÍTICO DEVASTADOR!\n¡$dmg de daño! (×1.8)'
            : '${fighter.superEmoji} ¡${fighter.superName}!\n¡El poder del Hamon destruye a Dio!\n¡$dmg de daño!';
      });
      _hamonBar.animateTo(0);
      _dioFlash.forward(from: 0);
      _dioShake.forward(from: 0);
    } else {
      final move = fighter.moves[index];
      if (move.isHeal) {
        final heal = _roll(move.healMin, move.healMax);
        setState(() {
          playerHp = (playerHp + heal).clamp(0, fighter.maxHp);
          _hpBarPlayer.animateTo(playerHp / fighter.maxHp);
          battleLog = '${move.emoji} ${move.name}\n${move.flavor}\n¡${fighter.name.split(' ').first} recuperó $heal HP!';
        });
        _playerFlash.forward(from: 0);
      } else if (move.isDrain) {
        final hit = _rng.nextDouble() <= move.accuracy;
        if (!hit) {
          setState(() => battleLog = '${move.emoji} ${move.name}\n¡El ataque falló!');
        } else {
          final dmg = _roll(move.minDmg, move.maxDmg);
          final heal = _roll(move.healMin, move.healMax);
          setState(() {
            dioHp    = (dioHp - dmg).clamp(0, dioMaxHp);
            playerHp = (playerHp + heal).clamp(0, fighter.maxHp);
            _hpBarDio.animateTo(dioHp / dioMaxHp);
            _hpBarPlayer.animateTo(playerHp / fighter.maxHp);
            battleLog = '${move.emoji} ${move.name}\n${move.flavor}\n¡$dmg daño · recuperó $heal HP!';
          });
          _dioFlash.forward(from: 0);
          _dioShake.forward(from: 0);
        }
      } else {
        final hit = _rng.nextDouble() <= move.accuracy;
        if (!hit) {
          setState(() => battleLog = '${move.emoji} ${move.name}\n¡El ataque falló!');
        } else {
          final isCrit = _rng.nextDouble() < 0.22; // 22% de probabilidad
          final baseDmg = _roll(move.minDmg, move.maxDmg);
          final dmg = isCrit ? (baseDmg * 1.8).round() : baseDmg;
          setState(() {
            dioHp = (dioHp - dmg).clamp(0, dioMaxHp);
            _hpBarDio.animateTo(dioHp / dioMaxHp);
            battleLog = isCrit
                ? '${move.emoji} ${move.name}\n💥 ¡GOLPE CRÍTICO!\n¡$dmg de daño! (×1.8)'
                : '${move.emoji} ${move.name}\n${move.flavor}\n¡$dmg de daño!';
          });
          _dioFlash.forward(from: 0);
          _dioShake.forward(from: 0);
        }
      }
      _chargeHamon(move.hamonCharge);
    }

    await Future.delayed(const Duration(milliseconds: 700));
    setState(() => _playerAttacking = false);
    await Future.delayed(const Duration(milliseconds: 150));

    if (dioHp <= 0) {
      setState(() {
        state = BattleState.finished; playerWon = true; phase = GamePhase.result;
        battleLog = '🏆 ¡VICTORIA!\n"¡El Hamon ha triunfado sobre la oscuridad!"\n— ${fighter.name}';
      });
      return;
    }

    if (dioHp <= 80 && !_vampireMode) {
      setState(() {
        _vampireMode = true; _vampireAnnounced = true;
        battleLog = '🔴 ¡DIO ACTIVA SU MODO VAMPIRO!\n"¡Soy inmortal! ¡WRYYY!"';
      });
      await Future.delayed(const Duration(milliseconds: 1300));
      setState(() => _vampireAnnounced = false);
    }

    setState(() {
      state = BattleState.dioTurn;
      battleLog = _vampireMode ? '⚡ Dio (MODO VAMPIRO) está eligiendo...' : 'Dio está planeando su ataque...';
    });
    await Future.delayed(const Duration(milliseconds: 700));

    Move dMove;
    if (_vampireMode) {
      final pool = [...dioNormalMoves.take(2), ...dioVampireMoves];
      dMove = pool[_rng.nextInt(pool.length)];
    } else {
      List<Move> pool = [...dioNormalMoves.take(3)];
      if (dioHp < 80) pool.add(dioNormalMoves[3]);
      dMove = pool[_rng.nextInt(pool.length)];
    }

    setState(() => _dioAttacking = true);
    final vampMult = _vampireMode ? 1.5 : 1.0;

    if (dMove.isHeal) {
      final heal = _roll(dMove.healMin, dMove.healMax);
      setState(() {
        dioHp = (dioHp + heal).clamp(0, dioMaxHp);
        _hpBarDio.animateTo(dioHp / dioMaxHp);
        battleLog = '${dMove.emoji} Dio usó ${dMove.name}\n${dMove.flavor}\n¡Dio recuperó $heal HP!';
      });
    } else if (dMove.isDrain) {
      final dmg  = (_roll(dMove.minDmg, dMove.maxDmg) * vampMult).round();
      final heal = _roll(dMove.healMin, dMove.healMax);
      setState(() {
        playerHp = (playerHp - dmg).clamp(0, fighter.maxHp);
        dioHp    = (dioHp + heal).clamp(0, dioMaxHp);
        _hpBarPlayer.animateTo(playerHp / fighter.maxHp);
        _hpBarDio.animateTo(dioHp / dioMaxHp);
        battleLog = '${dMove.emoji} Dio usó ${dMove.name}\n${dMove.flavor}\n¡$dmg daño · Dio recuperó $heal HP! 🔴';
      });
      _playerFlash.forward(from: 0);
      _playerShake.forward(from: 0);
      _chargeHamon(8);
    } else {
      final dmg = (_roll(dMove.minDmg, dMove.maxDmg) * vampMult).round();
      setState(() {
        playerHp = (playerHp - dmg).clamp(0, fighter.maxHp);
        _hpBarPlayer.animateTo(playerHp / fighter.maxHp);
        battleLog = '${dMove.emoji} Dio usó ${dMove.name}\n${dMove.flavor}\n¡${fighter.name.split(' ').first} recibió $dmg de daño!${_vampireMode ? " 🔴" : ""}';
      });
      _playerFlash.forward(from: 0);
      _playerShake.forward(from: 0);
      _chargeHamon(8);
    }

    await Future.delayed(const Duration(milliseconds: 700));
    setState(() => _dioAttacking = false);

    // ── LAST STAND ──────────────────────────────────────────────────────────
    if (playerHp <= 0 && !_lastStandUsed) {
      setState(() {
        _lastStandUsed = true;
        _lastStandAnnounced = true;
        playerHp = 1;
        _hpBarPlayer.animateTo(1 / fighter.maxHp);
        battleLog = '💛 ¡ÚLTIMA VOLUNTAD!\n"¡El espíritu de un caballero no muere!"\n¡${fighter.name.split(' ').first} sobrevive con 1 HP!';
      });
      await Future.delayed(const Duration(milliseconds: 1300));
      setState(() => _lastStandAnnounced = false);
      setState(() => state = BattleState.choosing);
      return;
    }

    if (playerHp <= 0) {
      setState(() {
        state = BattleState.finished; playerWon = false; phase = GamePhase.result;
        battleLog = '💀 ¡Derrotado!\n"¡KONO DIO DA!"\n— Dio Brando';
      });
      return;
    }

    setState(() => state = BattleState.choosing);
  }

  Color _hpColor(int hp, int max) {
    final p = hp / max;
    if (p > 0.5) return const Color(0xFF4CAF50);
    if (p > 0.25) return const Color(0xFFFFB300);
    return const Color(0xFFF44336);
  }

  // ─── BUILD ───────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    switch (phase) {
      case GamePhase.intro:      return _buildIntro();
      case GamePhase.charSelect: return _buildCharSelect();
      case GamePhase.battle:
      case GamePhase.result:     return _buildBattle();
    }
  }

  // ── INTRO ──────────────────────────────────────────────────────────────────

  Widget _buildIntro() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/battle_bg.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Color(0xAA000000), BlendMode.srcOver),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            children: [
              const Text('JOJO\'S BIZARRE ADVENTURE',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFFD4AF37), fontSize: 15,
                      fontWeight: FontWeight.bold, letterSpacing: 2)),
              const SizedBox(height: 4),
              const Text('PHANTOM BLOOD',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white54, fontSize: 11, letterSpacing: 3)),
              const SizedBox(height: 24),

              Container(
                width: 155, height: 185,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFF6A0DAD), width: 3),
                  boxShadow: [BoxShadow(color: const Color(0xFF6A0DAD).withAlpha(160), blurRadius: 28, spreadRadius: 4)],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(11),
                  child: Image.asset('assets/images/dio_sprite.png',
                      fit: BoxFit.cover, alignment: Alignment.topCenter,
                      errorBuilder: (_, __, ___) => Container(color: Colors.grey[800],
                          child: const Icon(Icons.person, color: Colors.white30, size: 60))),
                ),
              ),
              const SizedBox(height: 18),

              const Text('DIO BRANDO',
                  style: TextStyle(color: Color(0xFFCC99FF), fontSize: 26,
                      fontWeight: FontWeight.bold, letterSpacing: 3)),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red[900]!.withAlpha(180),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.red.withAlpha(120)),
                ),
                child: const Text('⚠ VAMPIRO INMORTAL · 200 HP',
                    style: TextStyle(color: Colors.redAccent, fontSize: 11, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 18),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF0D0D1A).withAlpha(200),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white12),
                ),
                child: const Text(
                  'Dio Brando usó la Máscara de Piedra para convertirse en un vampiro inmortal. Asesinó a George Joestar y amenaza con destruir la humanidad.\n\n'
                  '¡Solo el poder del Hamon puede detenerlo!\n\n'
                  '"¡Elige a tu héroe y derrota a Dio para salvar el mundo!"',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.7),
                ),
              ),
              const SizedBox(height: 26),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => setState(() => phase = GamePhase.charSelect),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD4AF37),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 8,
                    shadowColor: const Color(0xFFD4AF37).withAlpha(120),
                  ),
                  child: const Text('⚔️  ¡ELEGIR HÉROE!',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1)),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  // ── CHAR SELECT ────────────────────────────────────────────────────────────

  Widget _buildCharSelect() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/battle_bg.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Color(0xBB000000), BlendMode.srcOver),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text('ELIGE TU PERSONAJE',
                style: TextStyle(color: Color(0xFFD4AF37), fontSize: 18,
                    fontWeight: FontWeight.bold, letterSpacing: 2)),
            const SizedBox(height: 6),
            const Text('Cada uno tiene habilidades únicas',
                style: TextStyle(color: Colors.white38, fontSize: 12)),
            const SizedBox(height: 24),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(child: _FighterCard(fighter: jonathan, onSelect: _selectFighter)),
                    const SizedBox(width: 14),
                    Expanded(child: _FighterCard(fighter: zeppeli, onSelect: _selectFighter)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            TextButton.icon(
              onPressed: () => setState(() => phase = GamePhase.intro),
              icon: const Icon(Icons.arrow_back, size: 16),
              label: const Text('Volver', style: TextStyle(fontSize: 13)),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  // ── BATTLE ─────────────────────────────────────────────────────────────────

  Widget _buildBattle() {
    final fighter = selectedFighter!;
    return Column(
      children: [
        // ARENA
        Expanded(
          flex: 5,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final h = constraints.maxHeight;
              final dioH = (h * 0.50).clamp(90.0, 160.0);
              final dioW = dioH * 0.85;
              final playerH = (h * 0.44).clamp(80.0, 140.0);
              final playerW = playerH * 0.82;
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(_battleBg),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      _vampireMode ? Colors.red.withAlpha(110) : Colors.black.withAlpha(65),
                      BlendMode.srcOver,
                    ),
                  ),
                ),
                child: Stack(
                  children: [
                    // degradado inferior
                    Positioned(
                      bottom: 0, left: 0, right: 0,
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter, end: Alignment.topCenter,
                            colors: [Colors.black.withAlpha(160), Colors.transparent],
                          ),
                        ),
                      ),
                    ),

                    // DIO HP — arriba a la IZQUIERDA (opuesto al sprite)
                    Positioned(
                      top: 8, left: 8,
                      child: _InfoBox(
                        name: _vampireMode ? 'DIO 🔴' : 'DIO BRANDO',
                        hp: dioHp, maxHp: dioMaxHp,
                        hpAnim: _hpBarDio,
                        hpColor: _vampireMode ? Colors.red : _hpColor(dioHp, dioMaxHp),
                        isEnemy: true,
                        nameColor: _vampireMode ? Colors.red[300]! : const Color(0xFFCC99FF),
                      ),
                    ),

                    // PLAYER HP — abajo a la DERECHA (opuesto al sprite)
                    Positioned(
                      bottom: 8, right: 8,
                      child: _InfoBox(
                        name: fighter.name.split(' ').first,
                        hp: playerHp, maxHp: fighter.maxHp,
                        hpAnim: _hpBarPlayer,
                        hpColor: _hpColor(playerHp, fighter.maxHp),
                        isEnemy: false,
                        nameColor: fighter.borderColor,
                        hamon: hamon,
                        hamonAnim: _hamonBar,
                      ),
                    ),

                    // DIO sprite — arriba a la DERECHA
                    Positioned(
                      top: 8, right: 8,
                      child: AnimatedBuilder(
                        animation: _dioShakeAnim,
                        builder: (_, child) => Transform.translate(
                          offset: Offset(_dioShakeAnim.value, 0), child: child),
                        child: AnimatedBuilder(
                          animation: _dioFlash,
                          builder: (_, child) => ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              Colors.red.withAlpha((_dioFlash.value * 180).round()), BlendMode.srcATop),
                            child: child,
                          ),
                          child: _BattleSprite(
                            imagePath: _dioAttacking
                                ? 'assets/images/dio_attack.png'
                                : (_vampireMode
                                    ? 'assets/images/dio_vampire.png'
                                    : 'assets/images/dio_sprite.png'),
                            width: dioW, height: dioH,
                            borderColor: _vampireMode ? Colors.red : const Color(0xFF6A0DAD),
                            glowColor: _vampireMode ? Colors.red : const Color(0xFF6A0DAD),
                            isAttacking: _dioAttacking, flipX: true,
                          ),
                        ),
                      ),
                    ),

                    // PLAYER sprite — abajo a la IZQUIERDA
                    Positioned(
                      bottom: 8, left: 8,
                      child: AnimatedBuilder(
                        animation: Listenable.merge([_playerShakeAnim, _playerMoveAnim]),
                        builder: (_, child) => Transform.translate(
                          offset: Offset(_playerShakeAnim.value + _playerMoveAnim.value, 0), child: child),
                        child: AnimatedBuilder(
                          animation: _playerFlash,
                          builder: (_, child) => ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              Colors.yellow.withAlpha((_playerFlash.value * 160).round()), BlendMode.srcATop),
                            child: child,
                          ),
                          child: _BattleSprite(
                            imagePath: _playerAttacking ? fighter.attackImage : fighter.idleImage,
                            width: playerW, height: playerH,
                            borderColor: fighter.borderColor,
                            glowColor: _playerAttacking ? const Color(0xFF00E676) : fighter.glowColor,
                            isAttacking: _playerAttacking, flipX: false,
                          ),
                        ),
                      ),
                    ),

                    if (_vampireAnnounced)
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.red[900],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.red, width: 2),
                          ),
                          child: const Text('🔴 ¡MODO VAMPIRO ACTIVADO!',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                      ),

                    if (_lastStandAnnounced)
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A1A00),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFFD4AF37), width: 2),
                          ),
                          child: const Text('💛 ¡ÚLTIMA VOLUNTAD!',
                              style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),

        // BATTLE LOG — altura fija pequeña
        Container(
          width: double.infinity,
          height: 58,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          color: const Color(0xFF12122A),
          child: Text(
            battleLog,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 11, height: 1.4, fontFamily: 'monospace'),
          ),
        ),

        // MOVES / RESULT
        Expanded(
          flex: 4,
          child: Container(
            color: const Color(0xFF0D0D1A),
            child: phase == GamePhase.result ? _buildResult() : _buildMoves(fighter),
          ),
        ),
      ],
    );
  }

  // ── MOVES ──────────────────────────────────────────────────────────────────

  Widget _buildMoves(Fighter fighter) {
    final disabled = state != BattleState.choosing;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('¿Qué hará ${fighter.name.split(' ').first}?',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              Row(children: [
                const Text('✨ ', style: TextStyle(fontSize: 11, color: Color(0xFF00C853))),
                Text('$hamon/$maxHamon',
                    style: const TextStyle(fontSize: 11, color: Color(0xFF00C853), fontWeight: FontWeight.bold)),
              ]),
            ],
          ),
          const SizedBox(height: 6),

          if (_superAvailable)
            GestureDetector(
              onTap: disabled ? null : () => _useMove(0, isSuperAttack: true),
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.symmetric(vertical: 9),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Color(0xFFFFD700), Color(0xFFFF8C00)]),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: Colors.yellow.withAlpha(100), blurRadius: 12, spreadRadius: 2)],
                ),
                child: Center(
                  child: Text('${fighter.superEmoji} ${fighter.superName} ${fighter.superEmoji}',
                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12)),
                ),
              ),
            ),

          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 2.6,
              crossAxisSpacing: 8, mainAxisSpacing: 8,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(fighter.moves.length, (i) {
                final m = fighter.moves[i];
                return GestureDetector(
                  onTap: disabled ? null : () => _useMove(i),
                  child: AnimatedOpacity(
                    opacity: disabled ? 0.5 : 1.0,
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      decoration: BoxDecoration(
                        color: m.color.withAlpha(25),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: m.color, width: 1.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(m.emoji, style: const TextStyle(fontSize: 18)),
                          const SizedBox(width: 6),
                          Flexible(
                            child: Text(m.name,
                                style: TextStyle(color: m.color, fontWeight: FontWeight.bold, fontSize: 11),
                                textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  // ── RESULT ─────────────────────────────────────────────────────────────────

  Widget _buildResult() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(playerWon ? '🏆' : '💀', style: const TextStyle(fontSize: 44)),
            const SizedBox(height: 6),
            Text(
              playerWon ? '¡VICTORIA!' : 'DERROTA',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,
                  color: playerWon ? const Color(0xFFD4AF37) : Colors.red),
            ),
            const SizedBox(height: 6),
            Text(
              playerWon
                  ? '"¡El Hamon ha salvado al mundo!"'
                  : '"¡KONO DIO DA!"',
              style: TextStyle(color: Colors.grey[400], fontSize: 12),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 14),
            ElevatedButton.icon(
              onPressed: _restart,
              icon: const Icon(Icons.refresh, size: 18),
              label: const Text('Pelear de nuevo', style: TextStyle(fontSize: 14)),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 8),
            TextButton.icon(
              onPressed: () => setState(() => phase = GamePhase.intro),
              icon: const Icon(Icons.home_outlined, size: 16),
              label: const Text('Inicio', style: TextStyle(fontSize: 13)),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── FIGHTER CARD ─────────────────────────────────────────────────────────────

class _FighterCard extends StatelessWidget {
  final Fighter fighter;
  final void Function(Fighter) onSelect;

  const _FighterCard({required this.fighter, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelect(fighter),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0D0D1A).withAlpha(200),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: fighter.borderColor, width: 2),
          boxShadow: [BoxShadow(color: fighter.glowColor.withAlpha(80), blurRadius: 16, spreadRadius: 2)],
        ),
        child: Column(
          children: [
            // Imagen
            Expanded(
              flex: 5,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  fighter.idleImage,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  errorBuilder: (_, __, ___) => Container(
                    color: Colors.grey[800],
                    child: const Icon(Icons.person, color: Colors.white30, size: 60),
                  ),
                ),
              ),
            ),
            // Info
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      fighter.name.split(' ').first,
                      style: TextStyle(color: fighter.borderColor, fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    Text(
                      fighter.role,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white54, fontSize: 10),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: fighter.borderColor.withAlpha(30),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: fighter.borderColor.withAlpha(80)),
                      ),
                      child: Text('❤️ ${fighter.maxHp} HP',
                          style: TextStyle(color: fighter.borderColor, fontSize: 11, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      decoration: BoxDecoration(
                        color: fighter.borderColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text('¡ELEGIR!',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── TOP HP BARS ─────────────────────────────────────────────────────────────

class _TopHpBars extends StatelessWidget {
  final String playerName;
  final int playerHp, playerMaxHp;
  final AnimationController playerHpAnim;
  final Color playerHpColor, playerNameColor;
  final int hamon;
  final AnimationController hamonAnim;
  final int dioHp, dioMaxHp;
  final AnimationController dioHpAnim;
  final Color dioHpColor;
  final bool vampireMode;

  const _TopHpBars({
    required this.playerName,
    required this.playerHp, required this.playerMaxHp,
    required this.playerHpAnim, required this.playerHpColor,
    required this.playerNameColor,
    required this.hamon, required this.hamonAnim,
    required this.dioHp, required this.dioMaxHp,
    required this.dioHpAnim, required this.dioHpColor,
    required this.vampireMode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF0D0D1A).withAlpha(210),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        children: [
          // ── Jonathan / Zeppeli ──
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(playerName,
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: playerNameColor)),
                const SizedBox(height: 4),
                AnimatedBuilder(
                  animation: playerHpAnim,
                  builder: (_, __) => ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: playerHpAnim.value,
                      backgroundColor: Colors.grey[800],
                      color: playerHpColor,
                      minHeight: 9,
                    ),
                  ),
                ),
                const SizedBox(height: 3),
                Row(children: [
                  const Text('✨ ', style: TextStyle(fontSize: 9)),
                  Expanded(
                    child: AnimatedBuilder(
                      animation: hamonAnim,
                      builder: (_, __) => ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child: LinearProgressIndicator(
                          value: hamonAnim.value,
                          backgroundColor: Colors.grey[800],
                          color: const Color(0xFF00E676),
                          minHeight: 5,
                        ),
                      ),
                    ),
                  ),
                ]),
                Text('$playerHp/$playerMaxHp',
                    style: TextStyle(fontSize: 9, color: Colors.grey[500])),
              ],
            ),
          ),

          // VS
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text('VS',
                style: TextStyle(
                  fontSize: 13, fontWeight: FontWeight.bold,
                  color: vampireMode ? Colors.red[400] : Colors.white38,
                )),
          ),

          // ── Dio ──
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(vampireMode ? 'DIO 🔴' : 'DIO',
                    style: TextStyle(
                        fontSize: 11, fontWeight: FontWeight.bold,
                        color: vampireMode ? Colors.red[300]! : const Color(0xFFCC99FF))),
                const SizedBox(height: 4),
                AnimatedBuilder(
                  animation: dioHpAnim,
                  builder: (_, __) => ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: dioHpAnim.value,
                      backgroundColor: Colors.grey[800],
                      color: dioHpColor,
                      minHeight: 9,
                    ),
                  ),
                ),
                const SizedBox(height: 3),
                // Espacio vacío para alinear con la barra de hamon del player
                const SizedBox(height: 8),
                Text('$dioHp/$dioMaxHp',
                    style: TextStyle(fontSize: 9, color: Colors.grey[500])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── BATTLE SPRITE ────────────────────────────────────────────────────────────

class _BattleSprite extends StatelessWidget {
  final String imagePath;
  final double width, height;
  final Color borderColor, glowColor;
  final bool isAttacking, flipX;

  const _BattleSprite({
    required this.imagePath, required this.width, required this.height,
    required this.borderColor, required this.glowColor,
    required this.isAttacking, required this.flipX,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isAttacking ? 1.12 : 1.0,
      duration: const Duration(milliseconds: 200),
      child: Transform.scale(
        scaleX: flipX ? -1.0 : 1.0,
        child: Container(
          width: width, height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor, width: 2),
            boxShadow: [BoxShadow(
              color: glowColor.withAlpha(isAttacking ? 120 : 50),
              blurRadius: isAttacking ? 14 : 6,
              spreadRadius: isAttacking ? 2 : 0,
            )],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(imagePath, fit: BoxFit.cover, alignment: Alignment.topCenter,
                errorBuilder: (_, __, ___) => Container(color: Colors.grey[800],
                    child: const Icon(Icons.person, color: Colors.white30, size: 40))),
          ),
        ),
      ),
    );
  }
}

// ─── INFO BOX ─────────────────────────────────────────────────────────────────

class _InfoBox extends StatelessWidget {
  final String name;
  final int hp, maxHp;
  final AnimationController hpAnim;
  final Color hpColor, nameColor;
  final bool isEnemy;
  final int? hamon;
  final AnimationController? hamonAnim;

  const _InfoBox({
    required this.name, required this.hp, required this.maxHp,
    required this.hpAnim, required this.hpColor, required this.nameColor,
    required this.isEnemy, this.hamon, this.hamonAnim,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF0D0D1A).withAlpha(210),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: Text(name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: nameColor))),
              if (!isEnemy)
                Text('$hp/$maxHp', style: TextStyle(fontSize: 10, color: Colors.grey[400])),
            ],
          ),
          const SizedBox(height: 5),
          Row(children: [
            const Text('HP ', style: TextStyle(fontSize: 10, color: Colors.greenAccent, fontWeight: FontWeight.bold)),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: AnimatedBuilder(
                  animation: hpAnim,
                  builder: (_, __) => LinearProgressIndicator(
                    value: hpAnim.value,
                    backgroundColor: Colors.grey[800],
                    color: hpColor, minHeight: 7,
                  ),
                ),
              ),
            ),
          ]),
          if (!isEnemy && hamonAnim != null) ...[
            const SizedBox(height: 4),
            Row(children: [
              const Text('✨ ', style: TextStyle(fontSize: 10)),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: AnimatedBuilder(
                    animation: hamonAnim!,
                    builder: (_, __) => LinearProgressIndicator(
                      value: hamonAnim!.value,
                      backgroundColor: Colors.grey[800],
                      color: const Color(0xFF00E676), minHeight: 7,
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ],
      ),
    );
  }
}
