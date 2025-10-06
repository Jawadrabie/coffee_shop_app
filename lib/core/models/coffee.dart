class Coffee {
  final String id;
  final String title;
  final String subtitle;
  final String imagePath;
  final double price;
  final double rating;

  const Coffee({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.price,
    required this.rating,
  });
}

const mockCoffees = <Coffee>[
  Coffee(
    id: '1',
    title: 'Cappuccino',
    subtitle: 'with Oat Milk',
    imagePath: 'assets/images/2.png',
    price: 4.20,
    rating: 4.8,
  ),
  Coffee(
    id: '2',
    title: 'Latte',
    subtitle: 'with Caramel',
    imagePath: 'assets/images/3.png',
    price: 3.90,
    rating: 4.6,
  ),
  Coffee(
    id: '3',
    title: 'Espresso',
    subtitle: 'Strong Shot',
    imagePath: 'assets/images/4.png',
    price: 2.50,
    rating: 4.7,
  ),
  Coffee(
    id: '4',
    title: 'Mocha',
    subtitle: 'Chocolate',
    imagePath: 'assets/images/5.png',
    price: 4.50,
    rating: 4.5,
  ),
];
