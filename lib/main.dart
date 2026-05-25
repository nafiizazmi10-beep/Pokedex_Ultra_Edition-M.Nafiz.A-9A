
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void main() {
  runApp(const PokemonApp());
}

class PokemonApp extends StatelessWidget {
  const PokemonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokédex Neo',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: const PokemonListPage(),
    );
  }
}

// ================= MODEL =================

class Pokemon {
  final int id;
  final String name;
  final List<String> types;
  final Map<String, int> stats;
  final String description;
  final String image;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.stats,
    required this.description,
    required this.image,
  });
}

final List<Pokemon> pokemonList = [

  Pokemon(
    id: 1,
    name: 'Bulbasaur',
    types: ['Grass', 'Poison'],
    stats: {
      'HP': 45,
      'ATK': 49,
    },
    description:
        'Bulbasaur mengandalkan keseimbangan offense-defense.',
    image: 'assets/images/bulbasaur.png',
  ),

  Pokemon(
    id: 6,
    name: 'Charizard',
    types: ['Fire', 'Flying'],
    stats: {
      'HP': 78,
      'ATK': 84,
    },
    description:
        'Attacker cepat dengan damage tinggi.',
    image: 'assets/images/charizard.png',
  ),

  Pokemon(
    id: 9,
    name: 'Blastoise',
    types: ['Water'],
    stats: {
      'HP': 79,
      'ATK': 83,
    },
    description:
        'Tank kuat dengan defense tinggi.',
    image: 'assets/images/blastoise.png',
  ),

  Pokemon(
    id: 25,
    name: 'Pikachu',
    types: ['Electric'],
    stats: {
      'HP': 35,
      'ATK': 55,
    },
    description:
        'Fast electric Pokémon.',
    image: 'assets/images/pikachu.png',
  ),

  Pokemon(
    id: 94,
    name: 'Gengar',
    types: ['Ghost', 'Poison'],
    stats: {
      'HP': 60,
      'ATK': 65,
    },
    description:
        'Ghost Pokémon dengan special attack tinggi.',
    image: 'assets/images/gengar.png',
  ),

  Pokemon(
    id: 149,
    name: 'Dragonite',
    types: ['Dragon', 'Flying'],
    stats: {
      'HP': 91,
      'ATK': 134,
    },
    description:
        'Pseudo legendary dengan stat besar.',
    image: 'assets/images/dragonite.png',
  ),

  Pokemon(
    id: 143,
    name: 'Snorlax',
    types: ['Normal'],
    stats: {
      'HP': 160,
      'ATK': 110,
    },
    description:
        'Tank dengan HP sangat besar.',
    image: 'assets/images/snorlax.png',
  ),

  Pokemon(
    id: 133,
    name: 'Eevee',
    types: ['Normal'],
    stats: {
      'HP': 55,
      'ATK': 55,
    },
    description:
        'Pokémon fleksibel dengan banyak evolusi.',
    image: 'assets/images/eevee.png',
  ),

  Pokemon(
    id: 134,
    name: 'Vaporeon',
    types: ['Water'],
    stats: {
      'HP': 130,
      'ATK': 65,
    },
    description:
        'Tank spesial dengan sustain tinggi.',
    image: 'assets/images/vaporeon.png',
  ),

  Pokemon(
    id: 135,
    name: 'Jolteon',
    types: ['Electric'],
    stats: {
      'HP': 65,
      'ATK': 65,
    },
    description:
        'Salah satu Pokémon tercepat.',
    image: 'assets/images/jolteon.png',
  ),

  Pokemon(
    id: 136,
    name: 'Flareon',
    types: ['Fire'],
    stats: {
      'HP': 65,
      'ATK': 130,
    },
    description:
        'Physical attacker dengan damage tinggi.',
    image: 'assets/images/flareon.png',
  ),

  Pokemon(
    id: 448,
    name: 'Lucario',
    types: ['Fighting', 'Steel'],
    stats: {
      'HP': 70,
      'ATK': 110,
    },
    description:
        'Mixed sweeper dengan aura power.',
    image: 'assets/images/lucario.png',
  ),

  Pokemon(
    id: 658,
    name: 'Greninja',
    types: ['Water', 'Dark'],
    stats: {
      'HP': 72,
      'ATK': 95,
    },
    description:
        'Ninja Pokémon super cepat.',
    image: 'assets/images/greninja.png',
  ),

  Pokemon(
    id: 68,
    name: 'Machamp',
    types: ['Fighting'],
    stats: {
      'HP': 90,
      'ATK': 130,
    },
    description:
        'Petarung kuat dengan 4 tangan.',
    image: 'assets/images/machamp.png',
  ),

  Pokemon(
    id: 65,
    name: 'Alakazam',
    types: ['Psychic'],
    stats: {
      'HP': 55,
      'ATK': 50,
    },
    description:
        'Glass cannon dengan IQ tinggi.',
    image: 'assets/images/alakazam.png',
  ),

  Pokemon(
    id: 130,
    name: 'Gyarados',
    types: ['Water', 'Flying'],
    stats: {
      'HP': 95,
      'ATK': 125,
    },
    description:
        'Agresif dan sangat kuat.',
    image: 'assets/images/gyarados.png',
  ),

  Pokemon(
    id: 248,
    name: 'Tyranitar',
    types: ['Rock', 'Dark'],
    stats: {
      'HP': 100,
      'ATK': 134,
    },
    description:
        'Tank + attacker dengan sandstorm.',
    image: 'assets/images/tyranitar.png',
  ),
];

// ================= HOME =================

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({super.key});

  @override
  State<PokemonListPage> createState() =>
      _PokemonListPageState();
}

class _PokemonListPageState
    extends State<PokemonListPage> {

  String search = '';

  List<Pokemon> get filtered =>
      pokemonList.where((p) {
        return p.name
            .toLowerCase()
            .contains(search.toLowerCase());
      }).toList();

  @override
  Widget build(BuildContext context) {

    final width =
        MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0F172A),
            Color(0xFF020617),
          ],
        ),
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,

        appBar: AppBar(
          title: const Text(
            "POKÉDEX NEO",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),

          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),

        body: Stack(
          children: [

            Positioned(
              top: -120,
              left: -80,
              child: Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      Colors.purple.withOpacity(0.2),
                ),
              ),
            ),

            Positioned(
              bottom: -140,
              right: -100,
              child: Container(
                width: 320,
                height: 320,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      Colors.blue.withOpacity(0.18),
                ),
              ),
            ),

            Column(
              children: [

                Padding(
                  padding:
                      const EdgeInsets.all(18),

                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 18,
                    ),

                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(30),

                      gradient: LinearGradient(
                        colors: [
                          Colors.white
                              .withOpacity(0.14),

                          Colors.white
                              .withOpacity(0.06),
                        ],
                      ),

                      border: Border.all(
                        color: Colors.white
                            .withOpacity(0.12),
                      ),
                    ),

                    child: TextField(
                      style: const TextStyle(
                        color: Colors.white,
                      ),

                      onChanged: (v) {
                        setState(() {
                          search = v;
                        });
                      },

                      decoration:
                          const InputDecoration(
                        icon: Icon(
                          Icons.search_rounded,
                          color: Colors.white70,
                        ),

                        hintText:
                            "Search Pokémon...",

                        hintStyle: TextStyle(
                          color: Colors.white54,
                        ),

                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: GridView.builder(
                    padding:
                        const EdgeInsets.all(18),

                    itemCount: filtered.length,

                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(

                      crossAxisCount:
                          width > 1200
                              ? 5
                              : width > 800
                                  ? 4
                                  : width > 600
                                      ? 3
                                      : 2,

                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18,
                      childAspectRatio: 0.72,
                    ),

                    itemBuilder: (_, index) {

                      return PokemonCard(
                        pokemon: filtered[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ================= CARD =================

class PokemonCard extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonCard({
    super.key,
    required this.pokemon,
  });

  @override
  State<PokemonCard> createState() =>
      _PokemonCardState();
}

class _PokemonCardState
    extends State<PokemonCard> {

  double rotateX = 0;
  double rotateY = 0;
  double scale = 1;

  Color typeColor(String type) {

    switch (type.toLowerCase()) {

      case 'fire':
        return const Color(0xFFFF6B4A);

      case 'water':
        return const Color(0xFF4A90FF);

      case 'grass':
        return const Color(0xFF46D36B);

      case 'electric':
        return const Color(0xFFFFD84A);

      case 'ghost':
        return Colors.deepPurpleAccent;

      case 'dragon':
        return Colors.indigoAccent;

      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {

    final color =
        typeColor(widget.pokemon.types.first);

    return GestureDetector(

      onTapDown: (_) {
        setState(() {
          scale = 0.96;
        });
      },

      onTapUp: (_) {

        setState(() {
          scale = 1;
        });

        Navigator.push(
          context,

          MaterialPageRoute(
            builder: (_) =>
                PokemonDetailPage(
              pokemon: widget.pokemon,
            ),
          ),
        );
      },

      onTapCancel: () {
        setState(() {
          scale = 1;
        });
      },

      child: MouseRegion(

        onHover: (event) {

          final x = event.localPosition.dx;
          final y = event.localPosition.dy;

          setState(() {
            rotateY = (x - 100) / 1000;
            rotateX = -(y - 140) / 1000;
          });
        },

        onExit: (_) {
          setState(() {
            rotateX = 0;
            rotateY = 0;
          });
        },

        child: AnimatedContainer(
          duration:
              const Duration(milliseconds: 180),

          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(rotateX)
            ..rotateY(rotateY)
            ..scale(scale),

          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(30),

            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,

              colors: [
                color.withOpacity(0.45),
                Colors.black.withOpacity(0.8),
              ],
            ),

            border: Border.all(
              color:
                  Colors.white.withOpacity(0.12),
            ),

            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.5),
                blurRadius: 25,
                offset: const Offset(0, 12),
              ),
            ],
          ),

          child: ClipRRect(
            borderRadius:
                BorderRadius.circular(30),

            child: BackdropFilter(
              filter: ui.ImageFilter.blur(
                sigmaX: 12,
                sigmaY: 12,
              ),

              child: Stack(
                children: [

                  Positioned(
                    top: -40,
                    right: -40,

                    child: Container(
                      width: 140,
                      height: 140,

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        color: Colors.white
                            .withOpacity(0.05),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: -25,
                    left: -25,

                    child: Icon(
                      Icons.catching_pokemon,
                      size: 120,

                      color: Colors.white
                          .withOpacity(0.04),
                    ),
                  ),

                  Padding(
                    padding:
                        const EdgeInsets.all(18),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        Align(
                          alignment:
                              Alignment.topRight,

                          child: Text(
                            "#${widget.pokemon.id}",

                            style: TextStyle(
                              color: Colors.white
                                  .withOpacity(0.5),

                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),

                        const Spacer(),

                        Center(
                          child: Hero(
                            tag: widget.pokemon.id,

                            child: Container(
                              decoration:
                                  BoxDecoration(
                                shape: BoxShape.circle,

                                boxShadow: [
                                  BoxShadow(
                                    color: color
                                        .withOpacity(
                                            0.8),

                                    blurRadius: 35,
                                  ),
                                ],
                              ),

                              child: Image.asset(
                                widget.pokemon.image,

                                height: 120,
                              ),
                            ),
                          ),
                        ),

                        const Spacer(),

                        Text(
                          widget.pokemon.name,

                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight:
                                FontWeight.w900,

                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Wrap(
                          spacing: 8,

                          children: widget
                              .pokemon.types
                              .map(
                                (t) => Container(
                                  padding:
                                      const EdgeInsets
                                          .symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),

                                  decoration:
                                      BoxDecoration(
                                    color: typeColor(t)
                                        .withOpacity(
                                            0.85),

                                    borderRadius:
                                        BorderRadius
                                            .circular(
                                                20),
                                  ),

                                  child: Text(
                                    t,

                                    style:
                                        const TextStyle(
                                      color:
                                          Colors.white,

                                      fontSize: 11,

                                      fontWeight:
                                          FontWeight
                                              .bold,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),

                        const SizedBox(height: 14),

                        Row(
                          children: [

                            Expanded(
                              child: statBox(
                                "HP",
                                widget.pokemon
                                    .stats['HP']
                                    .toString(),
                              ),
                            ),

                            const SizedBox(width: 10),

                            Expanded(
                              child: statBox(
                                "ATK",
                                widget.pokemon
                                    .stats['ATK']
                                    .toString(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget statBox(
    String title,
    String value,
  ) {

    return Container(
      padding:
          const EdgeInsets.symmetric(vertical: 10),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),

        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        children: [

          Text(
            value,

            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

          Text(
            title,

            style: const TextStyle(
              fontSize: 11,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}

// ================= DETAIL =================

class PokemonDetailPage extends StatelessWidget {

  final Pokemon pokemon;

  const PokemonDetailPage({
    super.key,
    required this.pokemon,
  });

  Color typeColor(String type) {

    switch (type.toLowerCase()) {

      case 'fire':
        return const Color(0xFFFF6B4A);

      case 'water':
        return const Color(0xFF4A90FF);

      case 'grass':
        return const Color(0xFF46D36B);

      case 'electric':
        return const Color(0xFFFFD84A);

      case 'ghost':
        return Colors.deepPurpleAccent;

      case 'dragon':
        return Colors.indigoAccent;

      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {

    final color =
        typeColor(pokemon.types.first);

    return Scaffold(
      backgroundColor: const Color(0xFF020617),

      body: CustomScrollView(
        slivers: [

          SliverAppBar(
            expandedHeight: 320,
            pinned: true,

            backgroundColor: Colors.transparent,

            flexibleSpace: FlexibleSpaceBar(

              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,

                    colors: [
                      color.withOpacity(0.7),
                      const Color(0xFF020617),
                    ],
                  ),
                ),

                child: Center(
                  child: Hero(
                    tag: pokemon.id,

                    child: Image.asset(
                      pokemon.image,
                      height: 220,
                    ),
                  ),
                ),
              ),

              title: Text(
                pokemon.name,

                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Wrap(
                    spacing: 10,

                    children: pokemon.types
                        .map(
                          (t) => Container(
                            padding:
                                const EdgeInsets
                                    .symmetric(
                              horizontal: 14,
                              vertical: 7,
                            ),

                            decoration:
                                BoxDecoration(
                              color:
                                  typeColor(t),

                              borderRadius:
                                  BorderRadius
                                      .circular(
                                          20),
                            ),

                            child: Text(
                              t,
                            ),
                          ),
                        )
                        .toList(),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Description",

                    style: TextStyle(
                      fontSize: 24,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    pokemon.description,

                    style: const TextStyle(
                      color: Colors.white70,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    "Base Stats",

                    style: TextStyle(
                      fontSize: 24,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  ...pokemon.stats.entries.map(
                    (e) {

                      return Padding(
                        padding:
                            const EdgeInsets.only(
                                bottom: 16),

                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                          children: [

                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,

                              children: [

                                Text(e.key),

                                Text(
                                  e.value.toString(),
                                ),
                              ],
                            ),

                            const SizedBox(
                                height: 8),

                            ClipRRect(
                              borderRadius:
                                  BorderRadius
                                      .circular(
                                          20),

                              child:
                                  LinearProgressIndicator(
                                value:
                                    e.value / 150,

                                minHeight: 10,

                                backgroundColor:
                                    Colors.white12,

                                color: color,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

