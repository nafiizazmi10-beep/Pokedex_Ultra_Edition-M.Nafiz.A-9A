import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void main() => runApp(const PokemonApp());

class PokemonApp extends StatelessWidget {
  const PokemonApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex Ultra',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.transparent,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _ctrl.forward();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const PokemonListPage()));
    });
  }
  @override
  void dispose() { _ctrl.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(colors: [Color(0xFF1a1a2e), Color(0xFF0a0a1a)]),
      ),
      child: Center(
        child: FadeTransition(
          opacity: _ctrl,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/pokeball.png', height: 120,
                  errorBuilder: (_,__,___) => const Icon(Icons.catching_pokemon, size: 120, color: Colors.white)),
              const Text('POKÉDEX', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 4, color: Colors.white)),
              const SizedBox(height: 8),
              const Text('Ultra Edition', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}

class Pokemon {
  final int id;
  final String name;
  final List<String> types;
  final Map<String, int> stats;
  final String ability;
  final List<String> weaknesses;
  final String evolution;
  final String description;
  final String role;
  final List<String> partners;
  final String imageAsset;

  Pokemon({required this.id, required this.name, required this.types, required this.stats,
    required this.ability, required this.weaknesses, required this.evolution,
    required this.description, required this.role, required this.partners, required this.imageAsset});

  static final List<Pokemon> all = _generate();
}

List<Pokemon> _generate() => [
  Pokemon(id:1,name:'Bulbasaur',types:['Grass','Poison'],stats:{'HP':45,'Atk':49,'Def':49,'Sp.Atk':65,'Sp.Def':65,'Speed':45},ability:'Overgrow',weaknesses:['Fire','Ice','Flying','Psychic'],evolution:'Ivysaur (Lv.16)',description:'Bulbasaur mengandalkan keseimbangan offense-defense. Tanaman di punggungnya menyimpan energi matahari.',role:'Support / Tank awal. Cocok untuk sustain (Leech Seed + Sleep Powder)',partners:['Pikachu','Growlithe','Geodude'],imageAsset:'assets/images/bulbasaur.png'),
  Pokemon(id:6,name:'Charizard',types:['Fire','Flying'],stats:{'HP':78,'Atk':84,'Def':78,'Sp.Atk':109,'Sp.Def':85,'Speed':100},ability:'Blaze',weaknesses:['Rock (x4)','Water','Electric'],evolution:'Final',description:'Charizard adalah attacker cepat dengan damage tinggi. Sangat berbahaya tapi punya kelemahan besar terhadap Rock-type.',role:'Special Attacker / Sweeper. Cocok untuk ngeburst musuh cepat',partners:['Blastoise','Jolteon','Excadrill'],imageAsset:'assets/images/charizard.png'),
  Pokemon(id:9,name:'Blastoise',types:['Water'],stats:{'HP':79,'Atk':83,'Def':100,'Sp.Atk':85,'Sp.Def':105,'Speed':78},ability:'Torrent',weaknesses:['Electric','Grass'],evolution:'Final',description:'Blastoise adalah tank kuat dengan defense tinggi. Cocok untuk bertahan lama dan memberikan tekanan stabil.',role:'Tank / Defensive Support. Bisa jadi wall di tim',partners:['Venusaur','Raichu','Dragonite'],imageAsset:'assets/images/blastoise.png'),
  Pokemon(id:25,name:'Pikachu',types:['Electric'],stats:{'HP':35,'Atk':55,'Def':40,'Sp.Atk':50,'Sp.Def':50,'Speed':90},ability:'Static',weaknesses:['Ground'],evolution:'Raichu (Thunder Stone)',description:'Pikachu adalah Pokémon cepat dengan serangan listrik yang efektif melawan Water dan Flying. Tapi cukup rapuh.',role:'Fast Attacker / Utility. Bisa jadi support dengan status (paralyze)',partners:['Charizard','Bulbasaur','Gyarados'],imageAsset:'assets/images/pikachu.png'),
  Pokemon(id:94,name:'Gengar',types:['Ghost','Poison'],stats:{'HP':60,'Atk':65,'Def':60,'Sp.Atk':130,'Sp.Def':75,'Speed':110},ability:'Cursed Body',weaknesses:['Ghost','Dark','Psychic'],evolution:'Final',description:'Gengar adalah glass cannon dengan Special Attack tinggi dan kecepatan luar biasa. Cocok untuk menghabisi lawan dengan cepat.',role:'Special Sweeper. Hit & run playstyle',partners:['Snorlax','Tyranitar','Alakazam'],imageAsset:'assets/images/gengar.png'),
  Pokemon(id:149,name:'Dragonite',types:['Dragon','Flying'],stats:{'HP':91,'Atk':134,'Def':95,'Sp.Atk':100,'Sp.Def':100,'Speed':80},ability:'Inner Focus',weaknesses:['Ice (x4)','Rock','Dragon','Fairy'],evolution:'Final',description:'Dragonite adalah pseudo-legendary dengan stat tinggi di hampir semua aspek. Walau terlihat ramah, dia sangat kuat di battle.',role:'Physical Sweeper / All-rounder',partners:['Heatran','Magnezone','Blastoise'],imageAsset:'assets/images/dragonite.png'),
  Pokemon(id:143,name:'Snorlax',types:['Normal'],stats:{'HP':160,'Atk':110,'Def':65,'Sp.Atk':65,'Sp.Def':110,'Speed':30},ability:'Thick Fat',weaknesses:['Fighting'],evolution:'Final',description:'Snorlax adalah tank dengan HP besar. Sulit dikalahkan dan bisa jadi tembok tim.',role:'Tank / Wall',partners:['Gengar','Togekiss','Excadrill'],imageAsset:'assets/images/snorlax.png'),
  Pokemon(id:133,name:'Eevee',types:['Normal'],stats:{'HP':55,'Atk':55,'Def':50,'Sp.Atk':45,'Sp.Def':65,'Speed':55},ability:'Adaptability',weaknesses:['Fighting'],evolution:'Banyak (Vaporeon, Jolteon, Flareon, dll)',description:'Eevee unik karena punya banyak evolusi (Eeveelutions). Fleksibel sesuai kebutuhan tim.',role:'Flexible / Support',partners:['Tergantung evolusinya'],imageAsset:'assets/images/eevee.png'),
  Pokemon(id:134,name:'Vaporeon',types:['Water'],stats:{'HP':130,'Atk':65,'Def':60,'Sp.Atk':110,'Sp.Def':95,'Speed':65},ability:'Water Absorb',weaknesses:['Electric','Grass'],evolution:'Final',description:'Tank spesial dengan HP besar dan sustain tinggi.',role:'Special Tank / Support',partners:['Jolteon','Flareon','Ferrothorn'],imageAsset:'assets/images/vaporeon.png'),
  Pokemon(id:135,name:'Jolteon',types:['Electric'],stats:{'HP':65,'Atk':65,'Def':60,'Sp.Atk':110,'Sp.Def':95,'Speed':130},ability:'Volt Absorb',weaknesses:['Ground'],evolution:'Final',description:'Salah satu Pokémon tercepat. Cocok untuk strike cepat.',role:'Fast Special Sweeper',partners:['Vaporeon','Charizard','Scizor'],imageAsset:'assets/images/jolteon.png'),
  Pokemon(id:136,name:'Flareon',types:['Fire'],stats:{'HP':65,'Atk':130,'Def':60,'Sp.Atk':95,'Sp.Def':110,'Speed':65},ability:'Flash Fire',weaknesses:['Water','Ground','Rock'],evolution:'Final',description:'Damage fisik tinggi tapi agak lambat.',role:'Physical Attacker',partners:['Jolteon','Vaporeon','Tyranitar'],imageAsset:'assets/images/flareon.png'),
  Pokemon(id:448,name:'Lucario',types:['Fighting','Steel'],stats:{'HP':70,'Atk':110,'Def':70,'Sp.Atk':115,'Sp.Def':70,'Speed':90},ability:'Steadfast',weaknesses:['Fire','Fighting','Ground'],evolution:'Final',description:'Fighter dengan aura power, bisa mixed attacker.',role:'Mixed Sweeper',partners:['Gengar','Garchomp','Rotom-Wash'],imageAsset:'assets/images/lucario.png'),
  Pokemon(id:658,name:'Greninja',types:['Water','Dark'],stats:{'HP':72,'Atk':95,'Def':67,'Sp.Atk':103,'Sp.Def':71,'Speed':122},ability:'Protean',weaknesses:['Electric','Grass','Fighting','Bug','Fairy'],evolution:'Final',description:'Ninja Pokémon super cepat dengan ability unik (Protean).',role:'Speed Sweeper',partners:['Talonflame','Aegislash','Garchomp'],imageAsset:'assets/images/greninja.png'),
  Pokemon(id:68,name:'Machamp',types:['Fighting'],stats:{'HP':90,'Atk':130,'Def':80,'Sp.Atk':65,'Sp.Def':85,'Speed':55},ability:'Guts',weaknesses:['Flying','Psychic','Fairy'],evolution:'Final',description:'Petarung kuat dengan 4 tangan.',role:'Physical Attacker',partners:['Alakazam','Gengar','Snorlax'],imageAsset:'assets/images/machamp.png'),
  Pokemon(id:65,name:'Alakazam',types:['Psychic'],stats:{'HP':55,'Atk':50,'Def':45,'Sp.Atk':135,'Sp.Def':95,'Speed':120},ability:'Synchronize',weaknesses:['Bug','Ghost','Dark'],evolution:'Final',description:'Glass cannon dengan kecerdasan tinggi.',role:'Special Sweeper',partners:['Machamp','Gengar','Scizor'],imageAsset:'assets/images/alakazam.png'),
  Pokemon(id:130,name:'Gyarados',types:['Water','Flying'],stats:{'HP':95,'Atk':125,'Def':79,'Sp.Atk':60,'Sp.Def':100,'Speed':81},ability:'Intimidate',weaknesses:['Electric (x4)','Rock'],evolution:'Final',description:'Agresif dan kuat secara fisik.',role:'Physical Sweeper',partners:['Jolteon','Garchomp','Ferrothorn'],imageAsset:'assets/images/gyarados.png'),
  Pokemon(id:248,name:'Tyranitar',types:['Rock','Dark'],stats:{'HP':100,'Atk':134,'Def':110,'Sp.Atk':95,'Sp.Def':100,'Speed':61},ability:'Sand Stream',weaknesses:['Fighting (x4)','Ground','Bug','Steel','Water','Grass','Fairy'],evolution:'Final',description:'Tank + attacker kuat, summon sandstorm.',role:'Tank / Sweeper',partners:['Excadrill','Garchomp','Rotom-Wash'],imageAsset:'assets/images/tyranitar.png'),
];

// ================= LIST PAGE =================
class PokemonListPage extends StatefulWidget {
  const PokemonListPage({super.key});
  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  String _search = '';
  String _typeFilter = 'All';
  List<String> get _types => ['All', ...Pokemon.all.expand((p) => p.types).toSet().toList()];
  List<Pokemon> get _filtered => Pokemon.all.where((p) => p.name.toLowerCase().contains(_search.toLowerCase()) && (_typeFilter == 'All' || p.types.contains(_typeFilter))).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(colors: [Color(0xFF1a1a2e), Color(0xFF0a0a1a)], center: Alignment.topLeft, radius: 1.5),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('POKÉDEX', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: ClipRect(
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(color: Colors.white.withOpacity(0.05)),
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(children: [
                Container(
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(30)),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    onChanged: (v) => setState(() => _search = v),
                    decoration: const InputDecoration(
                      hintText: 'Cari Pokémon...', hintStyle: TextStyle(color: Colors.white54),
                      prefixIcon: Icon(Icons.search, color: Colors.white70), border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _types.length,
                    itemBuilder: (c, i) {
                      final t = _types[i];
                      final selected = _typeFilter == t;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: FilterChip(
                          label: Text(t), selected: selected,
                          onSelected: (_) => setState(() => _typeFilter = t),
                          backgroundColor: Colors.white.withOpacity(0.1),
                          selectedColor: Colors.red.shade400,
                          labelStyle: TextStyle(color: selected ? Colors.white : Colors.white70),
                        ),
                      );
                    },
                  ),
                ),
              ]),
            ),
            Expanded(
              child: _filtered.isEmpty
                ? const Center(child: Text('Tidak ditemukan', style: TextStyle(color: Colors.white70)))
                : GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.7, crossAxisSpacing: 16, mainAxisSpacing: 16),
                    itemCount: _filtered.length,
                    itemBuilder: (_, i) => _PokemonCard(pokemon: _filtered[i]),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const _PokemonCard({required this.pokemon});
  Color _typeColor(String t) {
    switch(t.toLowerCase()) {
      case 'grass': return Colors.green; case 'poison': return Colors.purple; case 'fire': return Colors.orange;
      case 'flying': return Colors.lightBlue; case 'water': return Colors.blue; case 'electric': return Colors.amber;
      case 'ghost': return Colors.deepPurple; case 'dragon': return Colors.indigo; case 'normal': return Colors.brown;
      case 'fighting': return Colors.redAccent; case 'steel': return Colors.blueGrey; case 'psychic': return Colors.pink;
      case 'dark': return Colors.grey; case 'rock': return Colors.grey.shade700;
      default: return Colors.grey;
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PokemonDetailPage(pokemon: pokemon))),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.white.withOpacity(0.15), Colors.white.withOpacity(0.05)]),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white.withOpacity(0.2)),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 12, offset: const Offset(0,6))],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(pokemon.imageAsset, fit: BoxFit.contain),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(pokemon.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                      const SizedBox(height: 4),
                      Wrap( spacing: 4, children: pokemon.types.map((t) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(color: _typeColor(t).withOpacity(0.7), borderRadius: BorderRadius.circular(12)),
                        child: Text(t, style: const TextStyle(fontSize: 10, color: Colors.white)),
                      )).toList()),
                    ],
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

// ================= DETAIL PAGE =================
class PokemonDetailPage extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonDetailPage({super.key, required this.pokemon});
  Color _typeColor(String t) {
    switch(t.toLowerCase()) {
      case 'grass': return Colors.green; case 'poison': return Colors.purple; case 'fire': return Colors.orange;
      case 'flying': return Colors.lightBlue; case 'water': return Colors.blue; case 'electric': return Colors.amber;
      case 'ghost': return Colors.deepPurple; case 'dragon': return Colors.indigo; case 'normal': return Colors.brown;
      case 'fighting': return Colors.redAccent; case 'steel': return Colors.blueGrey; case 'psychic': return Colors.pink;
      case 'dark': return Colors.grey; case 'rock': return Colors.grey.shade700;
      default: return Colors.grey;
    }
  }
  Color _statColor(String s) => s.contains('HP') ? Colors.green : (s.contains('Atk') ? Colors.red : (s.contains('Def') ? Colors.blue : Colors.purple));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0a0a1a),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black87, _typeColor(pokemon.types.first).withOpacity(0.6)],
                  ),
                ),
                child: Center(
                  child: Hero(tag: pokemon.id, child: Image.asset(pokemon.imageAsset, height: 180, fit: BoxFit.contain)),
                ),
              ),
              title: Text(pokemon.name, style: const TextStyle(fontWeight: FontWeight.bold, shadows: [Shadow(blurRadius: 10, color: Colors.black)])),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(spacing: 12, children: pokemon.types.map((t) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [_typeColor(t), _typeColor(t).withOpacity(0.7)]),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [BoxShadow(color: _typeColor(t).withOpacity(0.4), blurRadius: 8)],
                    ),
                    child: Text(t, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  )).toList()),
                  const SizedBox(height: 20),
                  _buildSection('Deskripsi', pokemon.description),
                  _buildSection('Role', pokemon.role),
                  _buildStats(),
                  _buildSection('Ability', pokemon.ability),
                  _buildSection('Weaknesses', pokemon.weaknesses.join(', ')),
                  _buildSection('Evolution', pokemon.evolution),
                  _buildSection('Recommended Partners', pokemon.partners.join(' • ')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildSection(String title, String content) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
      const SizedBox(height: 8),
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.white.withOpacity(0.1))),
        child: Text(content, style: const TextStyle(fontSize: 16, color: Colors.white70)),
      ),
    ]),
  );
  Widget _buildStats() => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Base Stats', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
      const SizedBox(height: 8),
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), borderRadius: BorderRadius.circular(20)),
        child: Column(children: pokemon.stats.entries.map((e) {
          double percent = (e.value / 255).clamp(0.0, 1.0);
          return Padding(padding: const EdgeInsets.symmetric(vertical: 6), child: Row(children: [
            SizedBox(width: 70, child: Text(e.key, style: const TextStyle(color: Colors.white70))),
            Expanded(child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(value: percent, backgroundColor: Colors.white24, color: _statColor(e.key), minHeight: 10),
            )),
            const SizedBox(width: 10),
            Text(e.value.toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ]));
        }).toList()),
      ),
    ]),
  );
}