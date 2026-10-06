import 'package:flutter/material.dart';
import 'package:jk_jewallary_project/admin_screen/add_category_screen.dart';
import 'package:jk_jewallary_project/admin_screen/add_product_screen.dart';
import 'package:jk_jewallary_project/admin_screen/add_user_screen.dart';
import 'package:jk_jewallary_project/admin_screen/admin_dashboard_screen.dart';
import 'package:jk_jewallary_project/admin_screen/admin_products_screen.dart';
import 'package:jk_jewallary_project/admin_screen/admin_profile_screen.dart';
import 'package:jk_jewallary_project/admin_screen/delete_product_screen.dart';
import 'package:jk_jewallary_project/admin_screen/edit_category_screen.dart';
import 'package:jk_jewallary_project/admin_screen/edit_product_screen.dart';
import 'package:jk_jewallary_project/admin_screen/edit_profile_screen.dart';
import 'package:jk_jewallary_project/admin_screen/manage_categories_screen.dart';
import 'package:jk_jewallary_project/admin_screen/manage_orders_screen.dart';
import 'package:jk_jewallary_project/admin_screen/manage_users_screen.dart';
import 'package:jk_jewallary_project/admin_screen/update_order_status_screen.dart';
import 'package:jk_jewallary_project/authentication/forgotPasswordScreen.dart';
import 'package:jk_jewallary_project/authentication/loginscreen.dart';
import 'package:jk_jewallary_project/authentication/otpscreen.dart';
import 'package:jk_jewallary_project/authentication/passwordscreen.dart';
import 'package:jk_jewallary_project/authentication/registerscreen.dart';
import 'package:jk_jewallary_project/screens/cartscreen.dart';
import 'package:jk_jewallary_project/screens/checkoutscreen.dart';
import 'package:jk_jewallary_project/screens/homescreen.dart';
import 'package:jk_jewallary_project/screens/jewelleryscreen.dart';
import 'package:jk_jewallary_project/screens/orderhistoryscreen.dart';
import 'package:jk_jewallary_project/screens/paymentscreen.dart';
import 'package:jk_jewallary_project/screens/productdetailsscreen.dart';
import 'package:jk_jewallary_project/screens/profilescreen.dart';
import 'package:jk_jewallary_project/screens/searchfilterscreen.dart';
import 'package:jk_jewallary_project/screens/tearmscreen.dart';
import 'package:jk_jewallary_project/screens/wishlistscreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JK Jewellery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3B2E9B)),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      routes: {
        '/login': (_) => const LoginScreen(),
        '/register': (_) => const RegisterScreen(),
        '/forgot-password': (_) => const ForgotPasswordScreen(),
        '/otp': (_) => const OtpScreen(),
        '/password': (_) => const PasswordScreen(),
        '/home': (_) => const HomeScreen(),
        '/jewellery': (_) => const JewelleryScreen(),
        '/filter': (_) => const SearchFilterScreen(),
        '/product-details': (_) => const ProductDetailsScreen(),
        '/cart': (_) => const CartScreen(),
        '/checkout': (_) => const CheckoutScreen(),
        '/payment': (_) => const PaymentScreen(),
        '/orders': (_) => const OrderHistoryScreen(),
        '/profile': (_) => const ProfileScreen(),
        '/wishlist': (_) => const WishlistScreen(),
        '/terms': (_) => const TermsScreen(),
        '/admin': (_) => const AdminDashboardScreen(),
        '/admin/products': (_) => const AdminProductsScreen(),
        '/admin/products/add': (_) => const AddProductScreen(),
        '/admin/products/edit': (_) => const EditProductScreen(),
        '/admin/products/delete': (_) => const DeleteProductScreen(),
        '/admin/categories': (_) => const ManageCategoriesScreen(),
        '/admin/categories/add': (_) => const AddCategoryScreen(),
        '/admin/categories/edit': (_) => const EditCategoryScreen(),
        '/admin/orders': (_) => const ManageOrdersScreen(),
        '/admin/orders/update': (_) => const UpdateOrderStatusScreen(),
        '/admin/users': (_) => const ManageUsersScreen(),
        '/admin/users/add': (_) => const AddUserScreen(),
        '/admin/profile': (_) => const AdminProfileScreen(),
        '/admin/profile/edit': (_) => const EditProfileScreen(),
      },
    );
  }
}
