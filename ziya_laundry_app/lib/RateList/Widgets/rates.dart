
import 'package:flutter/material.dart';
import 'package:ziya_laundry_app/Cart/View/cart_screen.dart';
import 'package:ziya_laundry_app/RateList/View/rate_screen.dart';
import 'package:ziya_laundry_app/home/View/home_screen.dart';

import '../ViewModel/category_mode.dart';

final List<FabricCategory> categories = [
  ////ratelist 1/////
  FabricCategory(
    textcolor: HomePage.primaryBlue,
    title: 'Cotton & Light Fabrics',
    image: 'assets/thread-material.png',
    color: RatePage.lightBlue,
    items: [
      FabricItem(
          fabricType: 'Cotton',
          name: 'T-Shirt(Basic Cotton)',
          price: '\$55',
          unit: 'per piece'),
      FabricItem(
          fabricType: 'Cotton',
          name: 'Shirt(Cotton)',
          price: '\$70-\$100',
          unit: 'per piece'),
      FabricItem(
          fabricType: 'Cotton',
          name: 'Kurta(Cotton)',
          price: '\$60-\$95',
          unit: 'per piece'),
      FabricItem(
          fabricType: 'Cotton',
          name: 'Kurti(Cotton)',
          price: '\$80-\$139',
          unit: 'per piece'),
      FabricItem(
          fabricType: 'Cotton',
          name: 'Dress(Cotton/Light)',
          price: '\$199-\$219',
          unit: 'per piece'),
      FabricItem(
          fabricType: 'Cotton',
          name: 'Kids Cotton Frock',
          price: '\$74-\$149',
          unit: 'per piece'),
      FabricItem(
          fabricType: 'Cotton',
          name: 'Bed Sheets(Cotton)',
          price: '\$120-\$150',
          unit: 'per Kg'),
      FabricItem(
          fabricType: 'Cotton',
          name: 'Bath Towels(Cotton)',
          price: '\$140-\$180',
          unit: 'per Kg'),
      FabricItem(
          fabricType: 'Cotton',
          name: 'Pillow Covers(Cotton)',
          price: '\$120-\$150',
          unit: 'per Kg'),
    ],
  ),
  ///ratelist2///
  FabricCategory(
      title: 'Synthetic & Polyester',
      image: 'assets/tape.png',
      color: CartPage.lightLavender,
      items: [
        FabricItem(
            fabricType: 'Denim & Synthetic',
            name: 'Jeans / Denim',
            price: '\$80-\$120',
            unit: 'per piece'),
        FabricItem(
            fabricType: 'Synthetic & Polyester',
            name: 'Trousers(Synthetic)',
            price: '\$80-\$120',
            unit: 'per piece'),
        FabricItem(
            fabricType: 'Polyester',
            name: 'Sports Wear/Track Suit',
            price: '\$22-\$169',
            unit: 'per piece'),
        FabricItem(
            fabricType: 'Polyester',
            name: 'Curtains(Polyester)',
            price: '\$130-\$180',
            unit: 'per Kg'),
        FabricItem(
            fabricType: 'Polyester',
            name: 'Dress(Synthetic)',
            price: '\$149-\$230',
            unit: 'per piece'),
      ],
      textcolor: Colors.deepPurple),
////ratelist3///
  FabricCategory(
    title: 'Silk & Delicate Fabrics',
    image: 'assets/silk.png',
    color: RatePage.softLavender,
    items: [
      FabricItem(
        name: 'Saree(Silk/Designer)',
        price: '\$299-\$859',
        unit: 'per piece',
        fabricType: 'Silk',
      ),
      FabricItem(
        name: 'Saree(Light Silk)',
        price: '\$179-\$230',
        unit: 'per piece',
        fabricType: 'Silk/Designer',
      ),
      FabricItem(
        name: 'Blouse(Silk)',
        price: '\$99-\$230',
        unit: 'per piece',
        fabricType: 'Silk/Designer',
      ),
      FabricItem(
        name: 'Lahenga/Ghagra',
        price: '\$359-\$1150',
        unit: 'per Kg',
        fabricType: 'Silk/Delicate',
      ),
      FabricItem(
        name: 'Gown(Designer)',
        price: '\$299-\$460',
        unit: 'per piece',
        fabricType: 'Silk/Delicate',
      ),
      FabricItem(
        name: 'Dress(Heavy/Designer)',
        price: '\$299-\$449',
        unit: 'per piece',
        fabricType: 'Silk/Delicate',
      ),
    ],
    textcolor: RatePage.deepViolet,
  ),
  ////ratelist4///
  FabricCategory(
      title: 'Wool & Heavy Fabrics',
      image: 'assets/cotton-wool.png',
      color: CartPage.softPink,
      items: [
        FabricItem(
            name: 'Blazer/Coat',
            price: '\$180-\$320',
            unit: 'per piece',
            fabricType: 'Wool/Heavy'),
        FabricItem(
            name: 'Jacket(Winter)',
            price: '\$180-\$320',
            unit: 'per piece',
            fabricType: 'Wool/Heavy'),
        FabricItem(
            name: 'Suit (2pcs)',
            price: '\$225-\$350',
            unit: 'per set',
            fabricType: 'Wool/Formal'),
        FabricItem(
            name: 'Suit (3pcs)',
            price: '\$275-\$450',
            unit: 'per set',
            fabricType: 'Wool/Formal'),
        FabricItem(
            name: 'Blankets/Quilts(Wool)',
            price: '\$160-\$220',
            unit: 'per Kg',
            fabricType: 'Wool/Heavy'),
        FabricItem(
            name: 'Comforters(Heavy)',
            price: '\$160-\$220',
            unit: 'per Kg',
            fabricType: 'Wool/Fabrics'),
      ],
      textcolor: RatePage.deepViolet
  ),
  ////ratelist5////
  FabricCategory(
    title: 'Special Materials & Accessories',
    image: 'assets/shoes.png',
    color: RatePage.lightSkyBlue,
    items: [
      FabricItem(
          name: 'Leather Shoes',
          price: '\$100-\$250',
          unit: 'per piece',
          fabricType: 'Leather'),
      FabricItem(
          name: 'Sports Shoes',
          price: '\$100-\$250',
          unit: 'per piece',
          fabricType: 'Mesh/Synthetic'),
      FabricItem(
          name: 'Tie (Silk/Polyester)',
          price: '\$80',
          unit: 'per piece',
          fabricType: 'Silk/Polyester'),
      FabricItem(
          name: 'Dhoti/Lungi',
          price: '\$70-\$119',
          unit: 'per Kg',
          fabricType: 'Cotton/Silk'),
      FabricItem(
          name: 'Suitcase Cleaning',
          price: '\$300-\$700',
          unit: 'per piece',
          fabricType: 'Leather/Delicate'),
      FabricItem(
          name: 'Suitcase Service',
          price: '\$200-\$700',
          unit: 'per piece',
          fabricType: 'Leather/Delicate'),
    ],
    textcolor: RatePage.tealBlue,
  ),
/////ratelist6/////
  FabricCategory(
      title: 'Kids Clothes(>6 years)',
      image: 'assets/baby.png',
      color: RatePage.softPeriwinkle,
      items: [
        FabricItem(
            name: 'Kids Dress',
            price: '\$59-\$149',
            unit: 'per piece',
            fabricType: ''
        ),
        FabricItem(
            name: 'Kids Shirt/T-Shirt',
            price: '\$30-\$69',
            unit: 'per piece',
            fabricType: ''
        ),
        FabricItem(
            name: 'Kids Jeans/Trousers',
            price: '\$32-\$65',
            unit: 'per piece',
            fabricType: ''
        ),
        FabricItem(
            name: 'Kids Kurta Set',
            price: '\$99-\$199',
            unit: 'per Kg',
            fabricType: ''
        ),
        FabricItem(
            name: 'Kids Jacket',
            price: '\$59-\$149',
            unit: 'per piece',
            fabricType: ''
        ),
      ],
      textcolor: RatePage.vividBlue),
  ///ratelist7///
  FabricCategory(
      title: 'Baby Clothes(Special Care)',
      image: 'assets/file.png',
      color: RatePage.peachLight,
      items: [
        FabricItem(
            name: 'Baby Garments',
            price: 'As per Kg',
            unit: 'all types',
            fabricType: ''
        ),
        FabricItem(
            name: 'Baby Blankets',
            price: 'As per Kg',
            unit: 'soft fabrics',
            fabricType: ''
        ),
      ],
      textcolor: RatePage.burntOrange
  )
];