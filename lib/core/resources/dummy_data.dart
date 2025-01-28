import 'package:pure_minds/config/localization/l10n/l10n.dart';
import 'package:pure_minds/core/resources/assets.dart';
import 'package:pure_minds/features/categories/data/category_model.dart';
import 'package:pure_minds/features/home/data/carousal_model.dart';
import 'package:pure_minds/features/onboarding/data/onboarding_model.dart';
import 'package:pure_minds/features/product/data/product_model.dart';

class DummyData {
  static final onBoardings = [
    OnboardingModel(
        image: Assets.assetsPngOnboarding1,
        title: L10n.tr().onboadring1,
        description: L10n.tr().lorumIpsum),
    OnboardingModel(
        image: Assets.assetsPngOnboarding1,
        title: L10n.tr().onboadring2,
        description: L10n.tr().lorumIpsum),
    OnboardingModel(
        image: Assets.assetsPngOnboarding2,
        title: L10n.tr().onboadring3,
        description: L10n.tr().lorumIpsum),
  ];

  static final homeCarousals = [
    CarousalModel(image: Assets.assetsPngCarousal1, title: L10n.tr().recommendedRecipeToday),
    CarousalModel(image: Assets.assetsPngCarousal2, title: L10n.tr().freshFruitsDelivery),
  ];

  static final categories = [
    CategoryModel(id: 0, image: Assets.assetsSvgFruits, title: L10n.tr().fruits, itemsCount: 87),
    CategoryModel(
        id: 1, image: Assets.assetsSvgVegetables, title: L10n.tr().vegetables, itemsCount: 110),
    CategoryModel(
        id: 2, image: Assets.assetsSvgMashroom, title: L10n.tr().mushrooms, itemsCount: 60),
    CategoryModel(id: 3, image: Assets.assetsSvgDiary, title: L10n.tr().dairy, itemsCount: 40),
    CategoryModel(id: 4, image: Assets.assetsSvgOats, title: L10n.tr().oats, itemsCount: 30),
    CategoryModel(id: 5, image: Assets.assetsSvgBread, title: L10n.tr().bread, itemsCount: 53),
    CategoryModel(id: 6, image: Assets.assetsSvgRice, title: L10n.tr().rice, itemsCount: 70),
    CategoryModel(id: 6, image: Assets.assetsSvgEgg, title: L10n.tr().egg, itemsCount: 70),
  ];
  static final reviews = [
    'review 1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat',
    'review 2 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat',
    'review 2 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat',
  ];

  static get products => [
    ProductModel(
        id: 0,
        name: L10n.tr().avocado,
        description: L10n.tr().lorumIpsum,
        price: 6.7,
        image: Assets.assetsPngAvocado,
        rate: 4.5,
        reviewCount: 125,
        reviews: reviews),
    ProductModel(
        id: 1,
        name: L10n.tr().banana,
        description: L10n.tr().lorumIpsum,
        price: 2.5,
        image: Assets.assetsPngBanana,
        rate: 4.5,
        reviewCount: 125,
        reviews: reviews),
    ProductModel(
        id: 2,
        name: L10n.tr().brocoli,
        description: L10n.tr().lorumIpsum,
        price: 3.5,
        image: Assets.assetsPngBrocoli,
        rate: 4.1,
        reviewCount: 87,
        reviews: reviews),
    ProductModel(
        id: 4,
        name: L10n.tr().blueberry,
        description: L10n.tr().lorumIpsum,
        price: 7.8,
        image: Assets.assetsPngBlueberry,
        rate: 3.5,
        reviewCount: 54,
        reviews: reviews),
    ProductModel(
        id: 5,
        name: L10n.tr().orange,
        description: L10n.tr().lorumIpsum,
        price: 9.1,
        image: Assets.assetsPngOrange,
        rate: 2.0,
        reviewCount: 23,
        reviews: reviews),
    ProductModel(
        id: 6,
        name: L10n.tr().tomato,
        description: L10n.tr().lorumIpsum,
        price: 6.7,
        image: Assets.assetsPngTomatoes,
        rate: 4.5,
        reviewCount: 125,
        reviews: reviews),
    ProductModel(
        id: 7,
        name: L10n.tr().apple,
        description: L10n.tr().lorumIpsum,
        price: 8.5,
        image: Assets.assetsPngApple,
        rate: 4.5,
        reviewCount: 170,
        reviews: reviews),
    ProductModel(
        id: 8,
        name: L10n.tr().pineapple,
        description: L10n.tr().lorumIpsum,
        price: 12.5,
        image: Assets.assetsPngPineapple,
        rate: 0.5,
        reviewCount: 45,
        reviews: reviews),
  ];
}
