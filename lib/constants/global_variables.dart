import 'package:flutter/material.dart';

String uri = 'http://192.168.228.192:5000';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 135, 206, 250),
      Color.fromARGB(255, 255, 255, 255),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromARGB(255, 135, 206, 250);
  static const backgroundColor = Color.fromARGB(255, 255, 255, 255);
  static const Color greyBackgroundCOlor = Color.fromARGB(255, 255, 255, 255);
  static var selectedNavBarColor = Color.fromARGB(255, 135, 206, 250);
  static const unselectedNavBarColor = Colors.black87;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://nettoyage-casablanca.net/images/femme-menage-casablanca.webp',
    'https://www.plus-que-pro.fr/image/partial/m/e/n/b0096329f825fe2329b4a5bf7b1eb7e8_menuiseries-w-800.jpg',
    'https://lebonartisan.cdn.prismic.io/lebonartisan/a4a3dca42ffc908dd98a8fbbaeebe2f10ddff961_article-installation-electrique.jpg',
    'https://de.cdn-website.com/6d597b8acab0404c96eb6a0ce9fc715c/dms3rep/multi/cc29ef4d-91b0-48b1-95b3-c0461463f71c-1600.jpg',
    'https://mk-plomberie.com/wp-content/uploads/2020/09/mk-plomberie-intervention-lyon-toilette.jpg',
    'https://ad962edbae8ba7b03b7f-d10007df79b5b7a4e475a291e50a08cf.ssl.cf3.rackcdn.com/2214/etude-de-marche-entreprise-de-nettoyage.jpg',
    'https://www.blog-des-travaux.fr/wp-content/uploads/prestations-atelier-menuiserie.jpg',
    'https://www.mes-demarches.info/wp-content/uploads/sites/7/2019/11/27-mise-en-service-du-compteur-electrique-les-demarches-1024x681.jpg',
    'https://img.freepik.com/photos-premium/service-reparation-restauration-locaux-portrait-peintre-batiment-rouleau-peinture-peignant-mur-bleu_230115-2173.jpg',
    'https://st3.depositphotos.com/2714617/19117/i/450/depositphotos_191173332-stock-photo-plumber-at-work-in-a.jpg',
    'https://www.servicesalapersonne.gouv.fr/files_sap/styles/image_contenus/public/files/images-activites/entretien-de-la-maison-small-copy-dglimages-getty_images.jpg?itok=v-vwCXe3',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Ménage',
      'image': 'assets/icons/Bill Icon.svg',
    },
    {
      'title': 'Menuiserie',
      'image': 'assets/icons/Game Icon.svg',
    },
    {
      'title': 'Electricité',
      'image': 'assets/icons/Flash Icon.svg',
    },
    {
      'title': 'Peinture',
      'image': 'assets/icons/Gift Icon.svg',
    },
    {
      'title': 'Plomberie',
      'image': 'assets/icons/Discover.svg',
    },
  ];
}
