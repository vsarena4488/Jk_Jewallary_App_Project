import os
import docx
from docx import Document
from docx.shared import Inches, Pt, RGBColor
from docx.enum.text import WD_ALIGN_PARAGRAPH
from docx.oxml import OxmlElement, parse_xml
from docx.oxml.ns import nsdecls, qn

PAGES = [
    {
        "category": "Application Root & Entry",
        "name": "MyApp (Root Entry & Route Map)",
        "file": "lib/main.dart",
        "type": "StatelessWidget",
        "description": "Root configuration of JK Jewellery application. Sets up MaterialApp, seed theme color (#3B2E9B), initial home (LoginScreen), and comprehensive named routes.",
        "tree": """MaterialApp
├── ThemeData (colorScheme: ColorScheme.fromSeed(seedColor: #3B2E9B), useMaterial3: true)
├── LoginScreen (home)
└── Routes Map (30 Named Routes)
    ├── '/login' ───────────────> LoginScreen
    ├── '/register' ────────────> RegisterScreen
    ├── '/forgot-password' ─────> ForgotPasswordScreen
    ├── '/otp' ─────────────────> OtpScreen
    ├── '/password' ────────────> PasswordScreen
    ├── '/home' ────────────────> HomeScreen
    ├── '/jewellery' ───────────> JewelleryScreen
    ├── '/filter' ──────────────> SearchFilterScreen
    ├── '/product-details' ─────> ProductDetailsScreen
    ├── '/cart' ────────────────> CartScreen
    ├── '/checkout' ────────────> CheckoutScreen
    ├── '/payment' ─────────────> PaymentScreen
    ├── '/orders' ──────────────> OrderHistoryScreen
    ├── '/profile' ─────────────> ProfileScreen
    ├── '/wishlist' ────────────> WishlistScreen
    ├── '/terms' ───────────────> TermsScreen
    ├── '/admin' ───────────────> AdminDashboardScreen
    ├── '/admin/products' ──────> AdminProductsScreen
    ├── '/admin/products/add' ──> AddProductScreen
    ├── '/admin/products/edit' ─> EditProductScreen
    ├── '/admin/products/delete'> DeleteProductScreen
    ├── '/admin/categories' ────> ManageCategoriesScreen
    ├── '/admin/categories/add' > AddCategoryScreen
    ├── '/admin/categories/edit'> EditCategoryScreen
    ├── '/admin/orders' ────────> ManageOrdersScreen
    ├── '/admin/orders/update' ─> UpdateOrderStatusScreen
    ├── '/admin/users' ─────────> ManageUsersScreen
    ├── '/admin/users/add' ─────> AddUserScreen
    ├── '/admin/profile' ───────> AdminProfileScreen
    └── '/admin/profile/edit' ──> EditProfileScreen"""
    },
    {
        "category": "Authentication Screens",
        "name": "LoginScreen",
        "file": "lib/authentication/loginscreen.dart",
        "type": "StatefulWidget",
        "description": "User & Admin login screen with email, password fields, link to forgot password, and navigation to admin or registration.",
        "tree": """Scaffold (backgroundColor: Colors.white)
└── SafeArea
    └── SingleChildScrollView (padding: horizontal 28)
        └── Column (crossAxisAlignment: stretch)
            ├── SizedBox (height: 100)
            ├── Center
            │   └── Text("LOGIN", fontSize: 42, color: #3B2E9B)
            ├── SizedBox (height: 100)
            ├── Text("EMAIL", fontSize: 15, fontWeight: bold)
            ├── SizedBox (height: 10)
            ├── TextField (_emailController, keyboardType: emailAddress)
            │   └── InputDecoration
            │       ├── hintText: "Enter The Email"
            │       ├── enabledBorder: OutlineInputBorder (radius: 10)
            │       └── focusedBorder: OutlineInputBorder (color: #3B2E9B)
            ├── SizedBox (height: 28)
            ├── Text("PASSWORD", fontSize: 15, fontWeight: bold)
            ├── SizedBox (height: 10)
            ├── TextField (_passwordController, obscureText: true)
            │   └── InputDecoration
            │       ├── hintText: "Enter The Password"
            │       ├── enabledBorder: OutlineInputBorder (radius: 10)
            │       └── focusedBorder: OutlineInputBorder (color: #3B2E9B)
            ├── SizedBox (height: 16)
            ├── Align (alignment: centerRight)
            │   └── GestureDetector (onTap -> /forgot-password)
            │       └── Text("FORGET PASSWORD ?")
            ├── SizedBox (height: 60)
            ├── SizedBox (height: 52)
            │   └── ElevatedButton (onPressed -> pushReplacementNamed '/admin')
            │       └── Text("LOGIN")
            ├── SizedBox (height: 24)
            ├── Row (mainAxisAlignment: center)
            │   ├── Text("Don't have an account? ")
            │   └── GestureDetector (onTap -> /register)
            │       └── Text("Register", color: #3B2E9B)
            └── SizedBox (height: 40)"""
    },
    {
        "category": "Authentication Screens",
        "name": "RegisterScreen",
        "file": "lib/authentication/registerscreen.dart",
        "type": "StatefulWidget",
        "description": "New account registration page with full name, email, phone, and dual password inputs.",
        "tree": """Scaffold (backgroundColor: Colors.white)
└── SafeArea
    └── SingleChildScrollView (padding: horizontal 28)
        └── Column (crossAxisAlignment: stretch)
            ├── SizedBox (height: 50)
            ├── Center
            │   └── Text("REGISTER", fontSize: 42, color: #3B2E9B)
            ├── SizedBox (height: 50)
            ├── Text("FULL NAME")
            ├── SizedBox (height: 10)
            ├── TextField (_fullNameController)
            │   └── InputDecoration (hintText: "Enter Your Name")
            ├── SizedBox (height: 22)
            ├── Text("EMAIL")
            ├── SizedBox (height: 10)
            ├── TextField (_emailController, keyboardType: emailAddress)
            │   └── InputDecoration (hintText: "Enter Your Phone Number")
            ├── SizedBox (height: 22)
            ├── Text("PHONE")
            ├── SizedBox (height: 10)
            ├── TextField (_phoneController, keyboardType: phone)
            │   └── InputDecoration (hintText: "Enter The Email")
            ├── SizedBox (height: 22)
            ├── Text("PASSWORD")
            ├── SizedBox (height: 10)
            ├── TextField (_passwordController, obscureText: true)
            │   └── InputDecoration (hintText: "Enter The Password")
            ├── SizedBox (height: 22)
            ├── Text("PASSWORD [Confirm]")
            ├── SizedBox (height: 10)
            ├── TextField (_confirmPasswordController, obscureText: true)
            │   └── InputDecoration (hintText: "Enter The Password")
            ├── SizedBox (height: 45)
            ├── SizedBox (height: 52)
            │   └── ElevatedButton (onPressed -> pushReplacementNamed '/home')
            │       └── Text("REGISTER")
            ├── SizedBox (height: 24)
            ├── Row (mainAxisAlignment: center)
            │   ├── Text("Already have an account? ")
            │   └── GestureDetector (onTap -> pushReplacementNamed '/login')
            │       └── Text("Login", color: #3B2E9B)
            └── SizedBox (height: 40)"""
    },
    {
        "category": "Authentication Screens",
        "name": "ForgotPasswordScreen",
        "file": "lib/authentication/forgotPasswordScreen.dart",
        "type": "StatefulWidget",
        "description": "Password reset initialization with email input and back navigation.",
        "tree": """Scaffold (backgroundColor: Colors.white)
└── SafeArea
    └── SingleChildScrollView (padding: horizontal 28)
        └── Column (crossAxisAlignment: stretch)
            ├── SizedBox (height: 20)
            ├── Align (alignment: centerLeft)
            │   └── GestureDetector (onTap -> Navigator.pop)
            │       └── Container (decoration: circle, color: #F5F5F5)
            │           └── Icon(Icons.arrow_back_ios_new, color: #3B2E9B)
            ├── SizedBox (height: 80)
            ├── Center
            │   └── Text("FORGET", fontSize: 42, color: #3B2E9B)
            ├── SizedBox (height: 120)
            ├── Text("EMAIL")
            ├── SizedBox (height: 10)
            ├── TextField (_emailController, keyboardType: emailAddress)
            │   └── InputDecoration (hintText: "Enter The Email")
            ├── SizedBox (height: 120)
            ├── SizedBox (height: 52)
            │   └── ElevatedButton (onPressed -> pushNamed '/otp')
            │       └── Text("OTP")
            └── SizedBox (height: 40)"""
    },
    {
        "category": "Authentication Screens",
        "name": "OtpScreen",
        "file": "lib/authentication/otpscreen.dart",
        "type": "StatefulWidget",
        "description": "OTP verification input screen.",
        "tree": """Scaffold (backgroundColor: Colors.white)
└── SafeArea
    └── SingleChildScrollView (padding: horizontal 28)
        └── Column (crossAxisAlignment: stretch)
            ├── SizedBox (height: 20)
            ├── Align (alignment: centerLeft)
            │   └── GestureDetector (onTap -> Navigator.pop)
            │       └── Container (circle background)
            │           └── Icon(Icons.arrow_back_ios_new, color: #3B2E9B)
            ├── SizedBox (height: 80)
            ├── Center
            │   └── Text("OTP", fontSize: 42, color: #3B2E9B)
            ├── SizedBox (height: 120)
            ├── Text("ENTER OTP")
            ├── SizedBox (height: 10)
            ├── TextField (_otpController, keyboardType: number)
            │   └── InputDecoration (hintText: "Enter The OTP")
            ├── SizedBox (height: 120)
            ├── SizedBox (height: 52)
            │   └── ElevatedButton (onPressed -> pushNamed '/password')
            │       └── Text("OTP")
            └── SizedBox (height: 40)"""
    },
    {
        "category": "Authentication Screens",
        "name": "PasswordScreen (Set New Password)",
        "file": "lib/authentication/passwordscreen.dart",
        "type": "StatefulWidget",
        "description": "Allows user to submit a new password and confirmation after OTP verification.",
        "tree": """Scaffold (backgroundColor: Colors.white)
└── SafeArea
    └── SingleChildScrollView (padding: horizontal 28)
        └── Column (crossAxisAlignment: stretch)
            ├── SizedBox (height: 20)
            ├── Align (alignment: centerLeft)
            │   └── GestureDetector (onTap -> Navigator.pop)
            │       └── Container (circle background)
            │           └── Icon(Icons.arrow_back_ios_new, color: #3B2E9B)
            ├── SizedBox (height: 60)
            ├── Center
            │   └── Text("PASSWORD", fontSize: 38, color: #3B2E9B)
            ├── SizedBox (height: 110)
            ├── Text("NEW PASSWORD")
            ├── SizedBox (height: 10)
            ├── TextField (_newPasswordController, obscureText: true)
            │   └── InputDecoration (contentPadding: 16)
            ├── SizedBox (height: 28)
            ├── Text("CONFORM PASSWORD")
            ├── SizedBox (height: 10)
            ├── TextField (_confirmPasswordController, obscureText: true)
            │   └── InputDecoration (contentPadding: 16)
            ├── SizedBox (height: 130)
            ├── SizedBox (height: 52)
            │   └── ElevatedButton (onPressed -> pushNamedAndRemoveUntil '/login')
            │       └── Text("CHANGE PASSWORD")
            └── SizedBox (height: 40)"""
    },
    {
        "category": "User Experience Screens",
        "name": "HomeScreen",
        "file": "lib/screens/homescreen.dart",
        "type": "StatelessWidget",
        "description": "Main consumer storefront landing screen. Top user bar, search input, circular category badges, horizontal New Arrivals list, and horizontal Popular Products carousel.",
        "tree": """Scaffold (backgroundColor: Colors.white)
├── SafeArea (body)
│   └── Column
│       └── Expanded
│           └── SingleChildScrollView (padding: horizontal 20)
│               └── Column (crossAxisAlignment: start)
│                   ├── SizedBox (height: 12)
│                   ├── Row (Top Bar)
│                   │   ├── Icon(Icons.menu, color: #1A1A1A)
│                   │   ├── SizedBox (width: 14)
│                   │   ├── Text("Hi, User", fontSize: 18, fontWeight: bold)
│                   │   ├── Spacer()
│                   │   └── Icon(Icons.notifications_none)
│                   ├── SizedBox (height: 20)
│                   ├── Container (Search Bar Container, decoration: #F5F5F5)
│                   │   └── TextField
│                   │       └── InputDecoration (border: none)
│                   │           ├── prefixIcon: Icon(Icons.search)
│                   │           ├── hintText: "Search jewellery..."
│                   │           └── suffixIcon: IconButton (onPressed -> SearchFilterScreen)
│                   │               └── Icon(Icons.tune)
│                   ├── SizedBox (height: 26)
│                   ├── Row (_sectionHeader: "Categories")
│                   │   ├── Text("Categories", fontSize: 17, fontWeight: bold)
│                   │   └── GestureDetector (onTap -> JewelleryScreen)
│                   │       └── Text("View All", color: #3B2E9B)
│                   ├── SizedBox (height: 16)
│                   ├── Row (Categories Badges: spaceBetween)
│                   │   ├── _CategoryItem ("Rings", Icons.circle_outlined)
│                   │   │   └── Column
│                   │   │       ├── Container (circle 64x64, border) -> Icon(Icons.circle_outlined)
│                   │   │       ├── SizedBox (height: 8)
│                   │   │       └── Text("Rings")
│                   │   ├── _CategoryItem ("Necklaces", Icons.abc)
│                   │   ├── _CategoryItem ("Earrings", Icons.hearing)
│                   │   └── _CategoryItem ("Bracelets", Icons.circle)
│                   ├── SizedBox (height: 28)
│                   ├── Row (_sectionHeader: "New Arrivals")
│                   │   ├── Text("New Arrivals")
│                   │   └── GestureDetector (onTap -> JewelleryScreen)
│                   │       └── Text("View All")
│                   ├── SizedBox (height: 16)
│                   ├── SizedBox (height: 220, New Arrivals Carousel)
│                   │   └── ListView (horizontal, bouncing)
│                   │       ├── _ProductCard (imagePath: s1, "Gold Necklace", "₹45,999")
│                   │       │   └── InkWell (onTap -> ProductDetailsScreen)
│                   │       │       └── Container (width: 160, border: grey.200)
│                   │       │           └── Column
│                   │       │               ├── Stack
│                   │       │               │   ├── ClipRRect -> Container(height: 130) -> Image.asset(s1)
│                   │       │               │   └── Positioned(top: 8, right: 8) -> Container(circle) -> Icon(favorite_border)
│                   │       │               └── Padding(10)
│                   │       │                   └── Column
│                   │       │                       ├── Text(name)
│                   │       │                       ├── SizedBox(height: 4)
│                   │       │                       └── Text(price, color: #3B2E9B)
│                   │       ├── SizedBox (width: 14)
│                   │       ├── _ProductCard (imagePath: s2[1], "Diamond Ring", "₹25,999")
│                   │       ├── SizedBox (width: 14)
│                   │       └── _ProductCard (imagePath: s2[2], "Emerald Pendant", "₹32,999")
│                   ├── SizedBox (height: 28)
│                   ├── Row (_sectionHeader: "Popular Products")
│                   ├── SizedBox (height: 16)
│                   ├── SizedBox (height: 220, Popular Products Carousel)
│                   │   └── ListView (horizontal, bouncing)
│                   │       ├── _ProductCard (imagePath: s2[3], "Gold Earrings", "₹22,999")
│                   │       ├── SizedBox (width: 14)
│                   │       ├── _ProductCard (imagePath: s2[1], "Silver Bracelet", "₹15,999")
│                   │       ├── SizedBox (width: 14)
│                   │       └── _ProductCard (imagePath: s2[2], "Rose Gold Ring", "₹18,999")
│                   └── SizedBox (height: 30)
└── UserBottomNav (currentIndex: 0) (bottomNavigationBar)"""
    },
    {
        "category": "User Experience Screens",
        "name": "JewelleryScreen (Catalog / All Jewellery)",
        "file": "lib/screens/jewelleryscreen.dart",
        "type": "StatelessWidget",
        "description": "Full catalog display with 2-column GridView of products, direct search bar, quick filter button, and cart shortcut.",
        "tree": """Scaffold (backgroundColor: Colors.white)
├── SafeArea (body)
│   └── Column
│       ├── Padding (horizontal: 16, vertical: 12, Top App Bar)
│       │   └── Row
│       │       ├── IconButton (Icons.arrow_back_ios_new, onPressed -> pop)
│       │       ├── Spacer()
│       │       ├── Text("All Jewellery", fontSize: 17, fontWeight: bold)
│       │       ├── Spacer()
│       │       └── IconButton (Icons.shopping_cart_outlined, onPressed -> CartScreen)
│       ├── Padding (horizontal: 16, Search + Filter Area)
│       │   └── Column
│       │       ├── Container (Search Bar Box)
│       │       │   └── TextField (decoration: prefixIcon search, border: none)
│       │       ├── SizedBox (height: 12)
│       │       └── Align (alignment: centerRight)
│       │           └── InkWell (onTap -> SearchFilterScreen)
│       │               └── Container (border: grey.300, radius: 8)
│       │                   └── Row
│       │                       ├── Icon(Icons.tune, size: 16)
│       │                       ├── SizedBox (width: 6)
│       │                       └── Text("Filter", fontSize: 13)
│       ├── SizedBox (height: 16)
│       └── Expanded (Products Grid)
│           └── GridView.builder (crossAxisCount: 2, childAspectRatio: 0.78)
│               └── _ProductCard
│                   └── InkWell (onTap -> ProductDetailsScreen)
│                       └── Container (border: grey.200, radius: 12)
│                           └── Column
│                               ├── Expanded
│                               │   └── Stack
│                               │       ├── ClipRRect -> Container -> Image.asset(image)
│                               │       └── Positioned (top: 8, right: 8) -> Container(circle) -> Icon(favorite_border)
│                               └── Padding (10)
│                                   └── Column
│                                       ├── Text(name, fontWeight: w600)
│                                       ├── SizedBox (height: 4)
│                                       └── Text(price, color: #3B2E9B)
└── UserBottomNav (currentIndex: 1) (bottomNavigationBar)"""
    },
    {
        "category": "User Experience Screens",
        "name": "SearchFilterScreen",
        "file": "lib/screens/searchfilterscreen.dart",
        "type": "StatefulWidget",
        "description": "Filter options dialog with category dropdown, radio options for product status (All, New, Old), and radio options for sorting.",
        "tree": """Scaffold (backgroundColor: Colors.white)
├── SafeArea (body)
│   └── Column
│       ├── Padding (Top App Bar)
│       │   └── Row
│       │       ├── IconButton (Icons.arrow_back_ios_new, onPressed -> pop)
│       │       ├── Spacer()
│       │       ├── Text("Search & Filter", fontSize: 17, fontWeight: bold)
│       │       ├── Spacer()
│       │       └── GestureDetector (onTap -> reset state)
│       │           └── Text("Reset", color: #3B2E9B)
│       └── Expanded
│           └── SingleChildScrollView (padding: horizontal 16)
│               └── Column (crossAxisAlignment: start)
│                   ├── SizedBox (height: 8)
│                   ├── Container (Search Bar Box)
│                   │   └── TextField (prefixIcon: search, hint: "Search jewellery...")
│                   ├── SizedBox (height: 26)
│                   ├── Text("Filter By", fontSize: 16, fontWeight: bold)
│                   ├── SizedBox (height: 20)
│                   ├── Text("Category", fontSize: 14, fontWeight: w600)
│                   ├── SizedBox (height: 10)
│                   ├── Container (Dropdown Container, border: grey.300)
│                   │   └── DropdownButtonHideUnderline
│                   │       └── DropdownButton<String> (_selectedCategory, items: _categories)
│                   ├── SizedBox (height: 26)
│                   ├── Text("Product Type", fontSize: 14, fontWeight: w600)
│                   ├── SizedBox (height: 6)
│                   ├── _RadioOption ("All Products")
│                   ├── _RadioOption ("New Products")
│                   ├── _RadioOption ("Old Products")
│                   ├── SizedBox (height: 22)
│                   ├── Text("Sort By", fontSize: 14, fontWeight: w600)
│                   ├── SizedBox (height: 6)
│                   ├── _RadioOption ("Newest First")
│                   ├── _RadioOption ("Oldest First")
│                   ├── _RadioOption ("Price: Low to High")
│                   ├── _RadioOption ("Price: High to Low")
│                   ├── SizedBox (height: 30)
│                   ├── SizedBox (height: 52, width: double.infinity)
│                   │   └── ElevatedButton (onPressed -> pop)
│                   │       └── Text("Apply Filter")
│                   └── SizedBox (height: 30)
└── UserBottomNav (currentIndex: 1) (bottomNavigationBar)"""
    },
    {
        "category": "User Experience Screens",
        "name": "ProductDetailsScreen",
        "file": "lib/screens/productdetailsscreen.dart",
        "type": "StatefulWidget",
        "description": "Item details showcase: high resolution asset preview, stock badge, quantity increment/decrement controls, Add to Cart, and Add to Wishlist.",
        "tree": """Scaffold (backgroundColor: Colors.white)
├── SafeArea (body)
│   └── Column
│       ├── Padding (Top App Bar)
│       │   └── Row
│       │       ├── IconButton (Icons.arrow_back_ios_new, onPressed -> pop)
│       │       ├── Spacer()
│       │       └── Icon(Icons.favorite_border, size: 24)
│       └── Expanded
│           └── SingleChildScrollView (padding: horizontal 16)
│               └── Column (crossAxisAlignment: start)
│                   ├── SizedBox (height: 8)
│                   ├── Container (Image Display Card, height: 320, color: #F5F5F5)
│                   │   └── Center
│                   │       └── Container (inner card 220x220, color: white)
│                   │           └── Padding (20)
│                   │               └── Image.asset(s1, fit: contain)
│                   ├── SizedBox (height: 24)
│                   ├── Text("Gold Necklace", fontSize: 22, fontWeight: bold)
│                   ├── SizedBox (height: 8)
│                   ├── Text("₹45,999", fontSize: 20, fontWeight: bold)
│                   ├── SizedBox (height: 14)
│                   ├── Text("Beautiful gold necklace with premium quality.")
│                   ├── SizedBox (height: 14)
│                   ├── Text("In Stock", color: Color(0xFF2E7D32), fontWeight: w600)
│                   ├── SizedBox (height: 24)
│                   ├── Container (Quantity Counter Box, border: grey.300)
│                   │   └── Row (mainAxisSize: min)
│                   │       ├── GestureDetector (onTap: decrement quantity)
│                   │       │   └── SizedBox (40x40) -> Icon(Icons.remove)
│                   │       ├── SizedBox (40) -> Center -> Text('$_quantity')
│                   │       └── GestureDetector (onTap: increment quantity)
│                   │           └── SizedBox (40x40) -> Icon(Icons.add)
│                   ├── SizedBox (height: 30)
│                   ├── SizedBox (height: 52, width: double.infinity)
│                   │   └── ElevatedButton (onPressed -> CartScreen)
│                   │       └── Text("Add to Cart")
│                   ├── SizedBox (height: 14)
│                   ├── SizedBox (height: 52, width: double.infinity)
│                   │   └── OutlinedButton (Add to Wishlist, side: #3B2E9B)
│                   │       └── Row (mainAxisAlignment: center)
│                   │           ├── Icon(Icons.favorite_border, color: #3B2E9B)
│                   │           ├── SizedBox (width: 10)
│                   │           └── Text("Add to Wishlist", color: #3B2E9B)
│                   └── SizedBox (height: 30)
└── UserBottomNav (currentIndex: 3) (bottomNavigationBar)"""
    },
    {
        "category": "User Experience Screens",
        "name": "CartScreen",
        "file": "lib/screens/cartscreen.dart",
        "type": "StatefulWidget",
        "description": "User shopping bag showing dynamic item list, quantity counters, delete option, price aggregation, and sticky checkout footer.",
        "tree": """Scaffold (backgroundColor: Colors.white)
├── SafeArea (body)
│   └── Column
│       ├── Padding (Top App Bar)
│       │   └── Row
│       │       ├── Icon(Icons.arrow_back_ios_new)
│       │       ├── Spacer()
│       │       ├── Text("My Cart", fontSize: 17, fontWeight: bold)
│       │       ├── Spacer()
│       │       └── Icon(Icons.favorite_border)
│       ├── Expanded (Cart Items List)
│       │   └── ListView.separated (itemCount: _cartItems.length)
│       │       └── _CartItemCard
│       │           └── Container (border: grey.200, radius: 14, padding: 12)
│       │               └── Row
│       │                   ├── Container (Image Box 90x90, color: #F5F5F5)
│       │                   │   └── Image.asset(image)
│       │                   ├── SizedBox (width: 14)
│       │                   ├── Expanded (Details Column)
│       │                   │   └── Column (crossAxisAlignment: start)
│       │                   │       ├── Text(name, fontSize: 15, fontWeight: bold)
│       │                   │       ├── SizedBox (height: 4)
│       │                   │       ├── Text(price, fontSize: 14, fontWeight: bold)
│       │                   │       ├── SizedBox (height: 10)
│       │                   │       └── Container (Quantity Stepper Box)
│       │                   │           └── Row
│       │                   │               ├── GestureDetector (onTap: onDecrease) -> Icon(remove)
│       │                   │               ├── SizedBox (30) -> Center -> Text('$qty')
│       │                   │               └── GestureDetector (onTap: onIncrease) -> Icon(add)
│       │                   └── GestureDetector (onTap: onDelete)
│       │                       └── Icon(Icons.delete_outline, size: 26, color: #D32F2F)
│       └── Container (Checkout Summary Bottom Sheet, elevation shadow)
│           └── Column
│               ├── Row (mainAxisAlignment: spaceBetween)
│               │   ├── Text("Total Items (2)", color: #757575)
│               │   └── Text("₹68,998", fontSize: 20, fontWeight: bold)
│               ├── SizedBox (height: 16)
│               └── SizedBox (height: 52, width: double.infinity)
│                   └── ElevatedButton (onPressed -> CheckoutScreen)
│                       └── Text("Proceed to Checkout")
└── UserBottomNav (currentIndex: 3) (bottomNavigationBar)"""
    },
    {
        "category": "User Experience Screens",
        "name": "CheckoutScreen",
        "file": "lib/screens/checkoutscreen.dart",
        "type": "StatelessWidget",
        "description": "Order placement overview including delivery address card, item breakdown, dashed total line, and payment progression button.",
        "tree": """Scaffold (backgroundColor: Colors.white)
├── SafeArea (body)
│   └── Column
│       ├── Padding (Top App Bar)
│       │   └── Row
│       │       ├── IconButton (Icons.arrow_back_ios_new, onPressed -> pop)
│       │       ├── Spacer()
│       │       ├── Text("Place Order", fontSize: 17, fontWeight: bold)
│       │       ├── Spacer()
│       │       └── SizedBox (width: 48)
│       ├── Expanded
│       │   └── SingleChildScrollView (padding: horizontal 16)
│       │       └── Column (crossAxisAlignment: start)
│       │           ├── SizedBox (height: 8)
│       │           ├── Text("Delivery Address", fontSize: 16, fontWeight: bold)
│       │           ├── SizedBox (height: 12)
│       │           ├── Container (Address Card, border: grey.300, radius: 12)
│       │           │   └── Row (crossAxisAlignment: start)
│       │           │       ├── Expanded (Address Details)
│       │           │       │   └── Column (crossAxisAlignment: start)
│       │           │       │       ├── Text("Arjun", fontWeight: bold)
│       │           │       │       ├── SizedBox (height: 6)
│       │           │       │       ├── Text("123, Green Street,\\nMumbai - 400001")
│       │           │       │       ├── SizedBox (height: 6)
│       │           │       │       └── Text("+91 9876543210")
│       │           │       └── GestureDetector (onTap: change address)
│       │           │           └── Text("Change", color: #3B2E9B, fontWeight: bold)
│       │           ├── SizedBox (height: 26)
│       │           ├── Text("Order Summary", fontSize: 16, fontWeight: bold)
│       │           ├── SizedBox (height: 12)
│       │           ├── Container (Order Summary Card, border: grey.300, radius: 12)
│       │           │   └── Column
│       │           │       ├── _summaryRow ("Items (2)", "₹68,998")
│       │           │       ├── SizedBox (height: 14)
│       │           │       ├── _summaryRow ("Delivery Charge", "FREE", valueColor: green)
│       │           │       ├── SizedBox (height: 14)
│       │           │       ├── DashedLine (Custom 40-segment dashed separator)
│       │           │       ├── SizedBox (height: 14)
│       │           │       └── _summaryRow ("Total Amount", "₹68,998", bold: true)
│       │           └── SizedBox (height: 30)
│       └── Container (Bottom Payment Action Bar)
│           └── SizedBox (height: 52, width: double.infinity)
│               └── ElevatedButton (onPressed -> PaymentScreen)
│                   └── Text("Continue to Payment")
└── UserBottomNav (currentIndex: 3) (bottomNavigationBar)"""
    },
    {
        "category": "User Experience Screens",
        "name": "PaymentScreen",
        "file": "lib/screens/paymentscreen.dart",
        "type": "StatefulWidget",
        "description": "Payment gateway selection supporting Cash on Delivery and UPI with active selection indicators.",
        "tree": """Scaffold (backgroundColor: Colors.white)
├── SafeArea (body)
│   └── Column
│       ├── Padding (Top App Bar)
│       │   └── Row
│       │       ├── Icon(Icons.arrow_back_ios_new)
│       │       ├── Spacer()
│       │       ├── Text("Payment", fontSize: 17, fontWeight: bold)
│       │       ├── Spacer()
│       │       └── SizedBox (width: 20)
│       ├── Expanded
│       │   └── SingleChildScrollView (padding: horizontal 16)
│       │       └── Column (crossAxisAlignment: start)
│       │           ├── SizedBox (height: 8)
│       │           ├── Container (Total Card, color: #F5F5F5)
│       │           │   └── Row (mainAxisAlignment: spaceBetween)
│       │           │       ├── Text("Total Amount", fontWeight: bold)
│       │           │       └── Text("₹68,998", fontSize: 18, fontWeight: bold)
│       │           ├── SizedBox (height: 28)
│       │           ├── Text("Select Payment Method", fontSize: 16, fontWeight: bold)
│       │           ├── SizedBox (height: 16)
│       │           ├── _PaymentOption ("Cash on Delivery", icon: Icons.payments_outlined)
│       │           │   └── GestureDetector -> AnimatedContainer
│       │           │       └── Row
│       │           │           ├── Container (leading icon box) -> Icon(Icons.payments_outlined)
│       │           │           ├── SizedBox (width: 14)
│       │           │           ├── Expanded -> Column -> Text("Cash on Delivery")
│       │           │           └── Container (Selection Indicator circle with Icon(check))
│       │           ├── SizedBox (height: 14)
│       │           ├── _PaymentOption ("UPI", subtitle: "Pay using any UPI App")
│       │           └── SizedBox (height: 30)
│       └── Container (Place Order Bottom Bar)
│           └── SizedBox (height: 52, width: double.infinity)
│               └── ElevatedButton (onPressed -> pushReplacement OrderHistoryScreen)
│                   └── Text("Place Order")
└── UserBottomNav (currentIndex: 3) (bottomNavigationBar)"""
    },
    {
        "category": "User Experience Screens",
        "name": "OrderHistoryScreen",
        "file": "lib/screens/orderhistoryscreen.dart",
        "type": "StatefulWidget",
        "description": "User purchase logs with filter pills ('All', 'Processing', 'Delivered'), dynamic status chips, and contextual actions.",
        "tree": """Scaffold (backgroundColor: Colors.white)
├── SafeArea (body)
│   └── Column
│       ├── Padding (Top App Bar)
│       │   └── Row
│       │       ├── Icon(Icons.arrow_back_ios_new)
│       │       ├── Spacer()
│       │       ├── Text("Order History", fontSize: 17, fontWeight: bold)
│       │       ├── Spacer()
│       │       └── Icon(Icons.search)
│       ├── SizedBox (height: 8)
│       ├── Padding (horizontal: 16, Tab Chips Row)
│       │   └── Row
│       │       └── _tabs.map (All, Processing, Delivered)
│       │           └── GestureDetector (onTap: switch tab)
│       │               └── AnimatedContainer (border, radius: 20, active color: #3B2E9B)
│       │                   └── Text(tab)
│       ├── SizedBox (height: 20)
│       └── Expanded (Orders List)
│           └── ListView.separated (itemCount: _orders.length)
│               └── _OrderCard
│                   └── Container (border: grey.200, radius: 14, padding: 16)
│                       └── Column (crossAxisAlignment: start)
│                           ├── Row (Order ID + Dynamic Status Chip)
│                           │   ├── Expanded
│                           │   │   └── Column
│                           │   │       ├── Text('Order $orderId', fontWeight: bold)
│                           │   │       ├── SizedBox (height: 4)
│                           │   │       └── Text(date, color: grey.600)
│                           │   └── Container (Status Badge: Processing/Delivered/Cancelled)
│                           │       └── Text(status)
│                           ├── SizedBox (height: 16)
│                           └── Row (Items + Amount + Outlined Action Button)
│                               ├── Expanded
│                               │   └── Column
│                               │       ├── Text(items)
│                               │       ├── SizedBox (height: 4)
│                               │       └── Text(amount, fontWeight: bold)
│                               └── OutlinedButton (side: #3B2E9B)
│                                   └── Text(buttonText: 'Track Order'/'Reorder'/'Details')
└── UserBottomNav (currentIndex: 3) (bottomNavigationBar)"""
    },
    {
        "category": "User Experience Screens",
        "name": "ProfileScreen",
        "file": "lib/screens/profilescreen.dart",
        "type": "StatelessWidget",
        "description": "User account overview with avatar, order navigation, wishlist link, edit profile, and red Logout button.",
        "tree": """Scaffold (backgroundColor: Colors.white)
├── SafeArea (body)
│   └── Column
│       ├── Padding (Top Bar)
│       │   └── Row (mainAxisAlignment: center)
│       │       └── Text("My Profile", fontSize: 17, fontWeight: bold)
│       └── Expanded
│           └── SingleChildScrollView (padding: horizontal 20)
│               └── Column
│                   ├── SizedBox (height: 30)
│                   ├── Container (Avatar circle 110x110, color: #EBE4F7)
│                   │   └── Icon(Icons.person, size: 60, color: #3B2E9B)
│                   ├── SizedBox (height: 20)
│                   ├── Text("NAME", fontSize: 18, fontWeight: bold)
│                   ├── SizedBox (height: 50)
│                   ├── _menuItem ("My Orders" -> OrderHistoryScreen)
│                   │   └── GestureDetector -> Row
│                   │       ├── Expanded -> Text("My Orders")
│                   │       └── Icon(Icons.arrow_forward_ios, size: 16)
│                   ├── Divider (height: 1, color: #EEEEEE)
│                   ├── _menuItem ("My Wishlist" -> WishlistScreen)
│                   ├── Divider (height: 1, color: #EEEEEE)
│                   ├── _menuItem ("Edit profile")
│                   ├── SizedBox (height: 120)
│                   ├── SizedBox (height: 52, width: double.infinity)
│                   │   └── ElevatedButton (onPressed -> pushAndRemoveUntil LoginScreen, color: #E53935)
│                   │       └── Row (mainAxisAlignment: center)
│                   │           ├── Icon(Icons.logout, size: 20, color: white)
│                   │           ├── SizedBox (width: 10)
│                   │           └── Text("Log Out", color: white)
│                   └── SizedBox (height: 30)
└── UserBottomNav (currentIndex: 4) (bottomNavigationBar)"""
    },
    {
        "category": "User Experience Screens",
        "name": "WishlistScreen",
        "file": "lib/screens/wishlistscreen.dart",
        "type": "StatelessWidget",
        "description": "Saved items list with empty state placeholder and persistent bottom navigation.",
        "tree": """Scaffold
├── AppBar (title: Text("My Wishlist"), centerTitle: true)
├── Center (body)
│   └── Column (mainAxisSize: min)
│       ├── Icon(Icons.favorite_border, size: 56, color: #3B2E9B)
│       ├── SizedBox (height: 12)
│       └── Text("Your wishlist is empty.")
└── UserBottomNav (currentIndex: 2) (bottomNavigationBar)"""
    },
    {
        "category": "User Experience Screens",
        "name": "TermsScreen",
        "file": "lib/screens/tearmscreen.dart",
        "type": "StatelessWidget",
        "description": "Terms of Service and legal agreements viewer with card layout and Accept / Decline choices.",
        "tree": """Scaffold (backgroundColor: Colors.white)
└── SafeArea (body)
    └── SingleChildScrollView (padding: horizontal 28)
        └── Column (crossAxisAlignment: stretch)
            ├── SizedBox (height: 20)
            ├── Align (alignment: centerLeft)
            │   └── GestureDetector (onTap -> pop)
            │       └── Container (circle background)
            │           └── Icon(Icons.arrow_back_ios_new, color: #3B2E9B)
            ├── SizedBox (height: 40)
            ├── Text("TERMS OF SERVICE", fontSize: 30, color: #3B2E9B, fontWeight: bold)
            ├── SizedBox (height: 50)
            ├── Container (Terms Content Card, border: grey.300, radius: 14, padding: 20)
            │   └── Column (crossAxisAlignment: start)
            │       ├── Text("1. Acceptance of Terms", fontWeight: bold)
            │       ├── SizedBox (height: 8)
            │       ├── Text("By accessing and using this application, you accept...")
            │       ├── SizedBox (height: 22)
            │       ├── Text("2. Privacy Policy", fontWeight: bold)
            │       ├── SizedBox (height: 8)
            │       ├── Text("Your use of our service is also subject to our Privacy Policy...")
            │       ├── SizedBox (height: 22)
            │       ├── Text("3. User Accounts", fontWeight: bold)
            │       ├── SizedBox (height: 8)
            │       └── Text("When you create an account with us, you must provide...")
            ├── SizedBox (height: 130)
            ├── SizedBox (height: 52)
            │   └── ElevatedButton (onPressed -> pop)
            │       └── Text("Accept & Continue")
            ├── SizedBox (height: 18)
            ├── Center
            │   └── Text("Decline", color: grey.700)
            └── SizedBox (height: 40)"""
    },
    {
        "category": "Admin Portal Screens",
        "name": "AdminDashboardScreen",
        "file": "lib/admin_screen/admin_dashboard_screen.dart",
        "type": "StatelessWidget",
        "description": "Administrator control panel overview with summary metrics (Total Orders, Active Users, Total Products) and real-time Recent Orders list.",
        "tree": """Scaffold (backgroundColor: Colors.white)
├── SafeArea (body)
│   └── Column
│       ├── Padding (Top App Bar)
│       │   └── Row
│       │       ├── Text("DASHBOARD", fontSize: 20, color: #3B2E9B, fontWeight: bold)
│       │       ├── Spacer()
│       │       └── Stack (Notification Bell with Red Unread Dot)
│       │           ├── Icon(Icons.notifications_none, size: 26)
│       │           └── Positioned (top: 2, right: 2) -> Container (red 8x8 circle)
│       └── Expanded
│           └── SingleChildScrollView (padding: horizontal 20)
│               └── Column (crossAxisAlignment: start)
│                   ├── SizedBox (height: 8)
│                   ├── Row (Stats Row 1)
│                   │   ├── Expanded -> _StatCard (label: "Total Orders", value: "342")
│                   │   ├── SizedBox (width: 14)
│                   │   └── Expanded -> _StatCard (label: "Active Users", value: "1,204")
│                   ├── SizedBox (height: 14)
│                   ├── Row (Stats Row 2)
│                   │   ├── Expanded -> _StatCard (label: "Total Products", value: "86")
│                   │   ├── SizedBox (width: 14)
│                   │   └── Expanded -> SizedBox() (empty spacer)
│                   ├── SizedBox (height: 34)
│                   ├── Row (Recent Orders Header: spaceBetween)
│                   │   ├── Text("Recent Orders", fontSize: 16, fontWeight: bold)
│                   │   └── Text("View All", fontSize: 14, color: #3B2E9B, fontWeight: bold)
│                   ├── SizedBox (height: 16)
│                   ├── _RecentOrderTile (Order 1: New, Initial 'S', #ORD-88231)
│                   │   └── Container (border: grey.200, radius: 14, padding: 14)
│                   │       └── Row
│                   │           ├── Container (Avatar circle with initial 'S')
│                   │           ├── SizedBox (width: 14)
│                   │           ├── Expanded -> Column -> Text(orderId) + Text(subtitle)
│                   │           └── Container (Status Badge: "New", color: orange)
│                   ├── SizedBox (height: 12)
│                   ├── _RecentOrderTile (Order 2: Processing, Initial 'J', #ORD-88230)
│                   ├── SizedBox (height: 12)
│                   ├── _RecentOrderTile (Order 3: Delivered, Initial 'R', #ORD-88229)
│                   └── SizedBox (height: 30)
└── AdminBottomNav (currentIndex: 0) (bottomNavigationBar)"""
    },
    {
        "category": "Admin Portal Screens",
        "name": "AdminProductsScreen",
        "file": "lib/admin_screen/admin_products_screen.dart",
        "type": "StatelessWidget",
        "description": "Product management table with items, pricing, live stock numbers, inline Edit & Delete triggers, plus Floating Action Button to add inventory.",
        "tree": """Scaffold (backgroundColor: Colors.white)
├── SafeArea (body)
│   └── Column
│       ├── Padding (Top App Bar)
│       │   └── Row
│       │       ├── Icon(Icons.arrow_back_ios_new)
│       │       ├── Spacer()
│       │       ├── Text("Products", fontSize: 17, fontWeight: bold)
│       │       ├── Spacer()
│       │       └── SizedBox (width: 20)
│       └── Expanded (Products ListView)
│           └── ListView.separated (itemCount: products.length)
│               └── _ProductTile
│                   └── Container (border: grey.200, radius: 14, padding: 14)
│                       └── Row
│                           ├── Container (Thumbnail Box 80x80, color: #F5F5F5) -> Icon(icon)
│                           ├── SizedBox (width: 14)
│                           └── Expanded
│                               └── Column (crossAxisAlignment: start)
│                                   ├── Text(name, fontSize: 15, fontWeight: bold)
│                                   ├── SizedBox (height: 4)
│                                   ├── Text(price, fontSize: 14, fontWeight: bold)
│                                   ├── SizedBox (height: 4)
│                                   ├── Text("Stock: $stock", fontSize: 12)
│                                   ├── SizedBox (height: 12)
│                                   └── Row (Inline Action Buttons)
│                                       ├── _actionButton ("Edit" -> EditProductScreen, bg: #EBE4F7)
│                                       ├── SizedBox (width: 8)
│                                       └── _actionButton ("Delete" -> DeleteProductScreen, bg: #FFEBEE)
├── FloatingActionButton (onPressed -> AddProductScreen, backgroundColor: #3B2E9B)
│   └── Icon(Icons.add, color: white, size: 32)
└── AdminBottomNav (currentIndex: 1) (bottomNavigationBar)"""
    },
    {
        "category": "Admin Portal Screens",
        "name": "AddProductScreen",
        "file": "lib/admin_screen/add_product_screen.dart",
        "type": "StatefulWidget",
        "description": "Product creation portal with custom dashed border image upload box, name, category picker, side-by-side price/stock fields, and description text area.",
        "tree": """Scaffold (backgroundColor: Colors.white)
├── SafeArea (body)
│   └── Column
│       ├── Padding (Top App Bar)
│       │   └── Row
│       │       ├── Icon(Icons.arrow_back_ios_new)
│       │       ├── Spacer()
│       │       ├── Text("Add New Jewellery", fontSize: 17, fontWeight: bold)
│       │       ├── Spacer()
│       │       └── SizedBox (width: 20)
│       ├── Expanded
│       │   └── SingleChildScrollView (padding: horizontal 20)
│       │       └── Column (crossAxisAlignment: start)
│       │           ├── SizedBox (height: 4)
│       │           ├── CustomPaint (_DashedBorderPainter)
│       │           │   └── Container (Upload Image Box, color: #F5F5F5, padding: 34 vertical)
│       │           │       └── Column
│       │           │           ├── Icon(Icons.photo_camera_outlined, size: 40)
│       │           │           ├── SizedBox (height: 12)
│       │           │           ├── Text("Click to Upload Image", fontWeight: bold)
│       │           │           └── Text("PNG, JPG up to 5MB", color: grey.600)
│       │           ├── SizedBox (height: 28)
│       │           ├── Text("Product Name")
│       │           ├── SizedBox (height: 10)
│       │           ├── TextField (_productNameController, hint: "e.g., Diamond Solitaire Ring")
│       │           ├── SizedBox (height: 20)
│       │           ├── Text("Category")
│       │           ├── SizedBox (height: 10)
│       │           ├── Container (Dropdown Box, border: grey.300)
│       │           │   └── DropdownButtonHideUnderline
│       │           │       └── DropdownButton<String> (_selectedCategory, items: _categories)
│       │           ├── SizedBox (height: 20)
│       │           ├── Row (Price + Stock Row)
│       │           │   ├── Expanded (Price Column)
│       │           │   │   └── Column
│       │           │   │       ├── Text("Price")
│       │           │   │       ├── SizedBox (height: 10)
│       │           │   │       └── TextField (_priceController, prefixIcon: Text('₹'))
│       │           │   ├── SizedBox (width: 14)
│       │           │   └── Expanded (Stock Column)
│       │           │       └── Column
│       │           │           ├── Text("Stock Quantity")
│       │           │           ├── SizedBox (height: 10)
│       │           │           └── TextField (_stockController, hint: "e.g., 50")
│       │           ├── SizedBox (height: 20)
│       │           ├── Text("Description")
│       │           ├── SizedBox (height: 10)
│       │           ├── TextField (_descriptionController, maxLines: 5)
│       │           └── SizedBox (height: 30)
│       └── Container (Sticky Save Footer)
│           └── SizedBox (height: 52, width: double.infinity)
│               └── ElevatedButton (onPressed: save)
│                   └── Text("Save Product")
└── AdminBottomNav (currentIndex: 1) (bottomNavigationBar)"""
    },
    {
        "category": "Admin Portal Screens",
        "name": "EditProductScreen",
        "file": "lib/admin_screen/edit_product_screen.dart",
        "type": "StatefulWidget",
        "description": "Product editor pre-populated with active inventory metadata, image replacement badge, Update Product button, and red Delete action.",
        "tree": """Scaffold (backgroundColor: Colors.white)
├── SafeArea (body)
│   └── Column
│       ├── Padding (Top App Bar)
│       │   └── Row
│       │       ├── Icon(Icons.arrow_back_ios_new)
│       │       ├── Spacer()
│       │       ├── Text("Edit Jewellery", fontSize: 17, fontWeight: bold)
│       │       ├── Spacer()
│       │       └── SizedBox (width: 20)
│       ├── Expanded
│       │   └── SingleChildScrollView (padding: horizontal 20)
│       │       └── Column (crossAxisAlignment: start)
│       │           ├── SizedBox (height: 4)
│       │           ├── Stack (Image Preview + Floating Change Badge)
│       │           │   ├── Container (height: 150, color: #F5F5F5)
│       │           │   │   └── Center -> Container(110x110) -> Image.asset(s1)
│       │           │   └── Positioned (bottom: -6, right: -6)
│       │           │       └── Container (circle 38x38, color: #3B2E9B)
│       │           │           └── Icon(Icons.add, color: white)
│       │           ├── SizedBox (height: 28)
│       │           ├── Text("Product Name")
│       │           ├── SizedBox (height: 10)
│       │           ├── TextField (_productNameController, prefilled: "Gold Necklace")
│       │           ├── SizedBox (height: 20)
│       │           ├── Text("Category")
│       │           ├── SizedBox (height: 10)
│       │           ├── Container (Dropdown Box) -> DropdownButton<String> ("Necklaces")
│       │           ├── SizedBox (height: 20)
│       │           ├── Row (Price + Stock Row)
│       │           │   ├── Expanded -> Column -> Text("Price") + TextField ("45,999")
│       │           │   ├── SizedBox (width: 14)
│       │           │   └── Expanded -> Column -> Text("Stock Quantity") + TextField ("12")
│       │           ├── SizedBox (height: 20)
│       │           ├── Text("Description")
│       │           ├── SizedBox (height: 10)
│       │           ├── TextField (_descriptionController, maxLines: 4)
│       │           └── SizedBox (height: 30)
│       └── Container (Footer Actions)
│           └── Column
│               ├── SizedBox (height: 52, width: double.infinity)
│               │   └── ElevatedButton (onPressed: update)
│               │       └── Text("Update Product")
│               ├── SizedBox (height: 12)
│               └── GestureDetector (onTap: delete)
│                   └── Text("Delete Product", color: #E53935, fontWeight: bold)
└── AdminBottomNav (currentIndex: 1) (bottomNavigationBar)"""
    },
    {
        "category": "Admin Portal Screens",
        "name": "DeleteProductScreen",
        "file": "lib/admin_screen/delete_product_screen.dart",
        "type": "StatelessWidget",
        "description": "Product deletion confirmation modal screen with trash icon badge, item name confirmation, and Cancel / Yes Delete buttons.",
        "tree": """Scaffold (backgroundColor: Colors.white)
├── SafeArea (body)
│   └── Center
│       └── Padding (horizontal: 28)
│           └── Column (mainAxisSize: min)
│               ├── Container (Trash Icon Circle 80x80, color: #FFEBEE)
│               │   └── Icon(Icons.delete_outline, size: 40, color: #E53935)
│               ├── SizedBox (height: 26)
│               ├── Text("Delete Product?", fontSize: 20, fontWeight: bold)
│               ├── SizedBox (height: 14)
│               ├── Text("Are you sure you want to delete", color: grey.600)
│               ├── SizedBox (height: 2)
│               ├── Text('"Gold Necklace"', fontWeight: bold)
│               ├── SizedBox (height: 8)
│               ├── Text("This action cannot be undone.", color: #E53935, fontWeight: w600)
│               ├── SizedBox (height: 30)
│               └── Row (Decision Row)
│                   ├── Expanded
│                   │   └── SizedBox (height: 48)
│                   │       └── OutlinedButton (onPressed -> pop)
│                   │           └── Text("Cancel")
│                   ├── SizedBox (width: 12)
│                   └── Expanded
│                       └── SizedBox (height: 48)
│                           └── ElevatedButton (color: #E53935)
│                               └── Text("Yes, Delete", color: white)
└── AdminBottomNav (currentIndex: 1) (bottomNavigationBar)"""
    },
    {
        "category": "Admin Portal Screens",
        "name": "ManageCategoriesScreen",
        "file": "lib/admin_screen/manage_categories_screen.dart",
        "type": "StatelessWidget",
        "description": "Overview of all store departments with product quantities per category, inline Edit/Delete buttons, and bottom 'Add New Category' CTA.",
        "tree": """Scaffold (backgroundColor: Colors.white)
├── SafeArea (body)
│   └── Column
│       ├── Padding (Top App Bar)
│       │   └── Row
│       │       ├── Icon(Icons.arrow_back_ios_new)
│       │       ├── Spacer()
│       │       ├── Text("Manage Categories", fontSize: 17, fontWeight: bold)
│       │       ├── Spacer()
│       │       └── SizedBox (width: 20)
│       ├── Expanded (Categories List)
│       │   └── ListView.separated (itemCount: categories.length)
│       │       └── _CategoryTile
│       │           └── Container (border: grey.200, radius: 14, padding: 12)
│       │               └── Row
│       │                   ├── Container (Icon Box 56x56, color: iconBg) -> Icon(icon, color: iconColor)
│       │                   ├── SizedBox (width: 14)
│       │                   ├── Expanded
│       │                   │   └── Column (crossAxisAlignment: start)
│       │                   │       ├── Text(name, fontSize: 15, fontWeight: bold)
│       │                   │       ├── SizedBox (height: 4)
│       │                   │       └── Text('$count Products', color: grey.600)
│       │                   ├── InkWell (onTap -> EditCategoryScreen)
│       │                   │   └── Container (36x36, color: #F5F5F5)
│       │                   │       └── Icon(Icons.edit_outlined, size: 18)
│       │                   ├── SizedBox (width: 8)
│       │                   └── Container (36x36, color: #FFEBEE)
│       │                       └── Icon(Icons.delete_outline, size: 18, color: #E53935)
│       └── Container (Add New Category Footer)
│           └── SizedBox (height: 52, width: double.infinity)
│               └── ElevatedButton (onPressed -> AddCategoryScreen)
│                   └── Row (mainAxisAlignment: center)
│                       ├── Icon(Icons.add, color: white)
│                       ├── SizedBox (width: 8)
│                       └── Text("Add New Category")
└── AdminBottomNav (currentIndex: 2) (bottomNavigationBar)"""
    },
    {
        "category": "Admin Portal Screens",
        "name": "AddCategoryScreen",
        "file": "lib/admin_screen/add_category_screen.dart",
        "type": "StatefulWidget",
        "description": "Category creation page with dashed icon upload area, title, color theme selector, and detailed description field.",
        "tree": """Scaffold (backgroundColor: Colors.white)
├── SafeArea (body)
│   └── Column
│       ├── Padding (Top App Bar)
│       │   └── Row
│       │       ├── Icon(Icons.arrow_back_ios_new)
│       │       ├── Spacer()
│       │       ├── Text("Add Category", fontSize: 17, fontWeight: bold)
│       │       ├── Spacer()
│       │       └── SizedBox (width: 20)
│       ├── Expanded
│       │   └── SingleChildScrollView (padding: horizontal 20)
│       │       └── Column (crossAxisAlignment: start)
│       │           ├── SizedBox (height: 4)
│       │           ├── CustomPaint (_DashedBorderPainter)
│       │           │   └── Container (Upload Icon Box, color: #F5F5F5, padding: 32 vertical)
│       │           │       └── Column
│       │           │           ├── Icon(Icons.add_photo_alternate_outlined, size: 40)
│       │           │           ├── SizedBox (height: 12)
│       │           │           ├── Text("Upload Category Icon", fontWeight: bold)
│       │           │           └── Text("PNG, JPG up to 2MB", color: grey.600)
│       │           ├── SizedBox (height: 28)
│       │           ├── Text("Category Name")
│       │           ├── SizedBox (height: 10)
│       │           ├── TextField (_categoryNameController, hint: "e.g., Rings")
│       │           ├── SizedBox (height: 20)
│       │           ├── Text("Category Color")
│       │           ├── SizedBox (height: 10)
│       │           ├── Container (Dropdown Box)
│       │           │   └── DropdownButton<String> ('Purple', 'Blue', 'Green', 'Orange')
│       │           ├── SizedBox (height: 20)
│       │           ├── Text("Description")
│       │           ├── SizedBox (height: 10)
│       │           ├── TextField (_descriptionController, maxLines: 4)
│       │           └── SizedBox (height: 30)
│       └── Container (Save Category Footer)
│           └── SizedBox (height: 52, width: double.infinity)
│               └── ElevatedButton (onPressed: save)
│                   └── Text("Save Category")
└── AdminBottomNav (currentIndex: 2) (bottomNavigationBar)"""
    },
    {
        "category": "Admin Portal Screens",
        "name": "EditCategoryScreen",
        "file": "lib/admin_screen/edit_category_screen.dart",
        "type": "StatefulWidget",
        "description": "Category editor prefilled with existing category credentials, icon update button, Update Category button, and Delete Category link.",
        "tree": """Scaffold (backgroundColor: Colors.white)
├── SafeArea (body)
│   └── Column
│       ├── Padding (Top App Bar)
│       │   └── Row
│       │       ├── Icon(Icons.arrow_back_ios_new)
│       │       ├── Spacer()
│       │       ├── Text("Edit Category", fontSize: 17, fontWeight: bold)
│       │       ├── Spacer()
│       │       └── SizedBox (width: 20)
│       ├── Expanded
│       │   └── SingleChildScrollView (padding: horizontal 20)
│       │       └── Column (crossAxisAlignment: start)
│       │           ├── SizedBox (height: 4)
│       │           ├── Stack (Current Icon Preview + Add Badge)
│       │           │   ├── Container (height: 150, color: #F5F5F5)
│       │           │   │   └── Center -> Container(100x100, color: #F3E5F5) -> Icon(Icons.abc, color: #8E24AA)
│       │           │   └── Positioned (bottom: -6, right: -6)
│       │           │       └── Container (circle 38x38, color: #3B2E9B) -> Icon(Icons.add, color: white)
│       │           ├── SizedBox (height: 28)
│       │           ├── Text("Category Name")
│       │           ├── SizedBox (height: 10)
│       │           ├── TextField (_categoryNameController, prefilled: "Necklaces")
│       │           ├── SizedBox (height: 20)
│       │           ├── Text("Category Color")
│       │           ├── SizedBox (height: 10)
│       │           ├── Container (Dropdown Box) -> DropdownButton<String> ("Purple")
│       │           ├── SizedBox (height: 20)
│       │           ├── Text("Description")
│       │           ├── SizedBox (height: 10)
│       │           ├── TextField (_descriptionController, maxLines: 4)
│       │           └── SizedBox (height: 30)
│       └── Container (Footer Actions)
│           └── Column
│               ├── SizedBox (height: 52, width: double.infinity)
│               │   └── ElevatedButton (onPressed: update)
│               │       └── Text("Update Category")
│               ├── SizedBox (height: 12)
│               └── GestureDetector (onTap: delete)
│                   └── Text("Delete Category", color: #E53935, fontWeight: bold)
└── AdminBottomNav (currentIndex: 2) (bottomNavigationBar)"""
    },
    {
        "category": "Admin Portal Screens",
        "name": "ManageOrdersScreen",
        "file": "lib/admin_screen/manage_orders_screen.dart",
        "type": "StatelessWidget",
        "description": "Comprehensive admin order processing log displaying customer names, item count, totals, status badges, and 'Update Status' triggers.",
        "tree": """Scaffold (backgroundColor: Colors.white)
├── SafeArea (body)
│   └── Column
│       ├── Padding (Top App Bar)
│       │   └── Row
│       │       ├── Icon(Icons.arrow_back_ios_new)
│       │       ├── Spacer()
│       │       ├── Text("Manage Oder", fontSize: 17, fontWeight: bold)
│       │       ├── Spacer()
│       │       └── SizedBox (width: 20)
│       └── Expanded (Orders List)
│           └── ListView.separated (itemCount: orders.length)
│               └── _OrderCard
│                   └── Container (border: grey.200, radius: 14, padding: 16)
│                       └── Column (crossAxisAlignment: start)
│                           ├── Row (Order ID + Status Badge)
│                           │   ├── Expanded
│                           │   │   └── Column
│                           │   │       ├── Text(orderId, fontSize: 15, fontWeight: bold)
│                           │   │       ├── SizedBox (height: 4)
│                           │   │       └── Text('$customer  •  $items Items', color: grey.600)
│                           │   └── Container (Status Chip: New / Processing / Delivered)
│                           │       └── Text(status)
│                           ├── SizedBox (height: 18)
│                           └── Row (crossAxisAlignment: end)
│                               ├── Column (Date)
│                               │   ├── Text('Date', fontSize: 11)
│                               │   └── Text(date, fontWeight: bold)
│                               ├── SizedBox (width: 36)
│                               ├── Column (Total Amount)
│                               │   ├── Text('Total Amount', fontSize: 11)
│                               │   └── Text(amount, fontWeight: bold, color: #3B2E9B)
│                               ├── Spacer()
│                               └── ElevatedButton (onPressed -> UpdateOrderStatusScreen)
│                                   └── Text(buttonText: 'Update Status' / 'View Details')
└── AdminBottomNav (currentIndex: 3) (bottomNavigationBar)"""
    },
    {
        "category": "Admin Portal Screens",
        "name": "UpdateOrderStatusScreen",
        "file": "lib/admin_screen/update_order_status_screen.dart",
        "type": "StatefulWidget",
        "description": "Order progression stepper (New -> Processing -> Shipped -> Delivered) with interactive radio-selection step cards.",
        "tree": """Scaffold (backgroundColor: Colors.white)
└── SafeArea (body)
    └── Column
        ├── Padding (Top App Bar)
        │   └── Row
        │       ├── Icon(Icons.arrow_back_ios_new)
        │       ├── Spacer()
        │       ├── Column (center alignment)
        │       │   ├── Text("Update Order Status", fontSize: 17, fontWeight: bold)
        │       │   ├── SizedBox (height: 4)
        │       │   └── Text("Order #ORD-88231", color: grey.600)
        │       ├── Spacer()
        │       └── SizedBox (width: 20)
        ├── SizedBox (height: 20)
        ├── Expanded (Steps List)
        │   └── ListView.builder (_steps: ['New', 'Processing', 'Shipped', 'Delivered'])
        │       └── GestureDetector (onTap: select step)
        │           └── Container (margin: 6 bottom, padding: 14x16, active color: #F3F0FC)
        │               └── Row
        │                   ├── Container (Radio Circle indicator with white dot when active)
        │                   ├── SizedBox (width: 16)
        │                   ├── Expanded -> Text(_steps[index], fontWeight: bold when active)
        │                   └── Container (Step Badge: "Step 1", "Step 2", etc., color: orange)
        │                       └── Text('Step ${index + 1}')
        └── Container (Confirm Update Footer)
            └── SizedBox (height: 52, width: double.infinity)
                └── ElevatedButton (onPressed: confirm)
                    └── Text("Confirm Update")"""
    },
    {
        "category": "Admin Portal Screens",
        "name": "ManageUsersScreen",
        "file": "lib/admin_screen/manage_users_screen.dart",
        "type": "StatelessWidget",
        "description": "User account management list featuring name/email search, initial letter badges, role indicators ('Admin' / 'User'), and FAB to register users.",
        "tree": """Scaffold (backgroundColor: Colors.white)
├── SafeArea (body)
│   └── Column
│       ├── Padding (Top App Bar)
│       │   └── Row
│       │       ├── Icon(Icons.arrow_back_ios_new)
│       │       ├── Spacer()
│       │       ├── Text("Manage Users", fontSize: 17, fontWeight: bold)
│       │       ├── Spacer()
│       │       └── SizedBox (width: 20)
│       ├── Padding (horizontal: 16, Search Bar Box)
│       │   └── Container (color: #F5F5F5, radius: 10)
│       │       └── TextField (prefixIcon: search, hint: "Search by name or email...")
│       ├── SizedBox (height: 16)
│       └── Expanded (User Accounts List)
│           └── ListView.separated (itemCount: users.length)
│               └── _UserTile
│                   └── Container (border: grey.200, radius: 14, padding: 14)
│                       └── Row
│                           ├── Container (Avatar circle 44x44, color: avatarBg) -> Text(initial)
│                           ├── SizedBox (width: 14)
│                           ├── Expanded
│                           │   └── Column (crossAxisAlignment: start)
│                           │       ├── Text(name, fontSize: 14, fontWeight: bold)
│                           │       ├── SizedBox (height: 3)
│                           │       └── Text(email, color: grey.600)
│                           ├── SizedBox (width: 8)
│                           ├── Container (Role Chip: Admin=#F3E5F5, User=#E8F5E9)
│                           │   └── Text(role)
│                           ├── SizedBox (width: 6)
│                           └── Icon(Icons.more_vert, size: 20, color: grey)
├── FloatingActionButton (onPressed -> AddUserScreen, backgroundColor: #3B2E9B)
│   └── Icon(Icons.add, color: white, size: 30)
└── AdminBottomNav (currentIndex: 4) (bottomNavigationBar)"""
    },
    {
        "category": "Admin Portal Screens",
        "name": "AddUserScreen",
        "file": "lib/admin_screen/add_user_screen.dart",
        "type": "StatefulWidget",
        "description": "New user creation portal with photo placeholder, full name, email, phone, role dropdown ('User' / 'Admin'), and password inputs.",
        "tree": """Scaffold (backgroundColor: Colors.white)
├── SafeArea (body)
│   └── Column
│       ├── Padding (Top App Bar)
│       │   └── Row
│       │       ├── Icon(Icons.arrow_back_ios_new)
│       │       ├── Spacer()
│       │       ├── Text("Add User", fontSize: 17, fontWeight: bold)
│       │       ├── Spacer()
│       │       └── SizedBox (width: 20)
│       ├── Expanded
│       │   └── SingleChildScrollView (padding: horizontal 20)
│       │       └── Column (crossAxisAlignment: start)
│       │           ├── SizedBox (height: 4)
│       │           ├── Center
│       │           │   └── CustomPaint (_DashedBorderPainter)
│       │           │       └── Container (Profile Photo Circle 120x120, color: #F5F5F5)
│       │           │           └── Column (mainAxisAlignment: center)
│       │           │               ├── Icon(Icons.person_add_alt_1_outlined, size: 32)
│       │           │               ├── SizedBox (height: 6)
│       │           │               └── Text("Add Photo", fontSize: 11)
│       │           ├── SizedBox (height: 30)
│       │           ├── Text("Full Name")
│       │           ├── SizedBox (height: 10)
│       │           ├── TextField (_nameController, hint: "e.g., John Doe")
│       │           ├── SizedBox (height: 20)
│       │           ├── Text("Email Address")
│       │           ├── SizedBox (height: 10)
│       │           ├── TextField (_emailController, hint: "e.g., john@example.com")
│       │           ├── SizedBox (height: 20)
│       │           ├── Text("Phone Number")
│       │           ├── SizedBox (height: 10)
│       │           ├── TextField (_phoneController, hint: "e.g., +91 98765 43210")
│       │           ├── SizedBox (height: 20)
│       │           ├── Text("Role")
│       │           ├── SizedBox (height: 10)
│       │           ├── Container (Dropdown Box)
│       │           │   └── DropdownButton<String> (_selectedRole, items: ['User', 'Admin'])
│       │           ├── SizedBox (height: 20)
│       │           ├── Text("Password")
│       │           ├── SizedBox (height: 10)
│       │           ├── TextField (_passwordController, obscureText: true)
│       │           └── SizedBox (height: 30)
│       └── Container (Save User Footer)
│           └── SizedBox (height: 52, width: double.infinity)
│               └── ElevatedButton (onPressed: save)
│                   └── Text("Save User")
└── AdminBottomNav (currentIndex: 4) (bottomNavigationBar)"""
    },
    {
        "category": "Admin Portal Screens",
        "name": "AdminProfileScreen",
        "file": "lib/admin_screen/admin_profile_screen.dart",
        "type": "StatelessWidget",
        "description": "Administrator profile hub with 'Super Admin' badge, shortcuts to Orders, Products, Edit Profile, and Logout.",
        "tree": """Scaffold (backgroundColor: Colors.white)
├── SafeArea (body)
│   └── Column
│       ├── Padding (Top App Bar)
│       │   └── Row
│       │       ├── Icon(Icons.arrow_back_ios_new)
│       │       ├── Spacer()
│       │       ├── Text("Admin Profile", fontSize: 17, fontWeight: bold)
│       │       ├── Spacer()
│       │       └── SizedBox (width: 20)
│       └── Expanded
│           └── SingleChildScrollView (padding: horizontal 20)
│               └── Column
│                   ├── SizedBox (height: 20)
│                   ├── Container (Avatar Circle 100x100, color: #EBE4F7)
│                   │   └── Text("A", fontSize: 44, fontWeight: bold, color: #3B2E9B)
│                   ├── SizedBox (height: 16)
│                   ├── Text("Admin", fontSize: 20, fontWeight: bold)
│                   ├── SizedBox (height: 10)
│                   ├── Container (Role Chip: "Super Admin", color: #EBE4F7)
│                   │   └── Text("Super Admin", color: #3B2E9B)
│                   ├── SizedBox (height: 60)
│                   ├── Container (Menu Card, border: grey.200, radius: 14)
│                   │   └── Column
│                   │       ├── _menuItem (icon: inventory_2, "Orders" -> ManageOrdersScreen)
│                   │       ├── Divider()
│                   │       ├── _menuItem (icon: local_offer, "Products" -> AdminProductsScreen)
│                   │       ├── Divider()
│                   │       └── _menuItem (icon: person, "Edit Profile" -> EditProfileScreen)
│                   ├── SizedBox (height: 80)
│                   ├── SizedBox (height: 52, width: double.infinity)
│                   │   └── ElevatedButton (onPressed: logout, color: #E53935)
│                   │       └── Row (mainAxisAlignment: center)
│                   │           ├── Icon(Icons.logout, size: 20, color: white)
│                   │           ├── SizedBox (width: 10)
│                   │           └── Text("Log Out", color: white)
│                   └── SizedBox (height: 30)
└── AdminBottomNav (currentIndex: 5) (bottomNavigationBar)"""
    },
    {
        "category": "Admin Portal Screens",
        "name": "EditProfileScreen",
        "file": "lib/admin_screen/edit_profile_screen.dart",
        "type": "StatefulWidget",
        "description": "Admin profile modifier with camera change badge, name, locked email input, and dual password inputs with visibility toggles.",
        "tree": """Scaffold (backgroundColor: Colors.white)
└── SafeArea (body)
    └── Column
        ├── Padding (Top App Bar)
        │   └── Row
        │       ├── Icon(Icons.arrow_back_ios_new)
        │       ├── Spacer()
        │       ├── Text("Edit Profile", fontSize: 17, fontWeight: bold)
        │       ├── Spacer()
        │       └── SizedBox (width: 20)
        └── Expanded
            └── SingleChildScrollView (padding: horizontal 20)
                └── Column (crossAxisAlignment: start)
                    ├── SizedBox (height: 10)
                    ├── Center
                    │   └── Stack
                    │       ├── Container (Avatar Circle 100x100, color: #EBE4F7) -> Text("A")
                    │       └── Positioned (bottom: 0, right: 0)
                    │           └── Container (Camera Badge circle 34x34, color: #3B2E9B)
                    │               └── Icon(Icons.photo_camera, size: 16, color: white)
                    ├── SizedBox (height: 36)
                    ├── Text("Full Name")
                    ├── SizedBox (height: 10)
                    ├── TextField (_nameController, prefilled: "vishal sarena")
                    ├── SizedBox (height: 22)
                    ├── Text("Email Address")
                    ├── SizedBox (height: 10)
                    ├── TextField (_emailController, prefilled: "vsarena@rku.ac.in", suffixIcon: lock_outline)
                    ├── SizedBox (height: 22)
                    ├── Text("New Password")
                    ├── SizedBox (height: 10)
                    ├── TextField (_newPasswordController, suffixIcon: visibility toggle)
                    ├── SizedBox (height: 22)
                    ├── Text("Confirm Password")
                    ├── SizedBox (height: 10)
                    ├── TextField (_confirmPasswordController, suffixIcon: visibility toggle)
                    ├── SizedBox (height: 40)
                    ├── SizedBox (height: 52, width: double.infinity)
                    │   └── ElevatedButton (onPressed: save)
                    │       └── Text("Save Changes")
                    └── SizedBox (height: 30)"""
    },
    {
        "category": "Shared Bottom Navigation Widgets",
        "name": "UserBottomNav",
        "file": "lib/widgets/user_bottom_nav.dart",
        "type": "StatelessWidget",
        "description": "5-tab bottom navigation bar for shoppers: Home (0), Jewellery (1), Wishlist (2), Cart (3), and Profile (4).",
        "tree": """Container (color: Colors.white, boxShadow: subtle top blur)
└── SafeArea (top: false)
    └── Padding (vertical: 8, horizontal: 4)
        └── Row (mainAxisAlignment: spaceAround)
            ├── Expanded -> InkWell (index: 0, onTap -> HomeScreen)
            │   └── Column
            │       ├── Icon(Icons.home_outlined / Icons.home)
            │       └── Text("Home")
            ├── Expanded -> InkWell (index: 1, onTap -> JewelleryScreen)
            │   └── Column
            │       ├── Icon(Icons.diamond_outlined / Icons.diamond)
            │       └── Text("Jewellery")
            ├── Expanded -> InkWell (index: 2, onTap -> WishlistScreen)
            │   └── Column
            │       ├── Icon(Icons.favorite_border / Icons.favorite)
            │       └── Text("Wishlist")
            ├── Expanded -> InkWell (index: 3, onTap -> CartScreen)
            │   └── Column
            │       ├── Icon(Icons.shopping_cart_outlined / Icons.shopping_cart)
            │       └── Text("Cart")
            └── Expanded -> InkWell (index: 4, onTap -> ProfileScreen)
                └── Column
                    ├── Icon(Icons.person_outline / Icons.person)
                    └── Text("Profile")"""
    },
    {
        "category": "Shared Bottom Navigation Widgets",
        "name": "AdminBottomNav",
        "file": "lib/widgets/admin_bottom_nav.dart",
        "type": "StatelessWidget",
        "description": "6-tab bottom navigation bar for store admins: Dashboard (0), Products (1), Category (2), Orders (3), Users (4), and Profile (5).",
        "tree": """Container (color: Colors.white, boxShadow: subtle top blur)
└── SafeArea (top: false)
    └── Padding (vertical: 8, horizontal: 4)
        └── Row (mainAxisAlignment: spaceAround)
            ├── Expanded -> InkWell (index: 0, onTap -> AdminDashboardScreen)
            │   └── Column
            │       ├── Icon(Icons.grid_view_outlined / Icons.grid_view)
            │       └── Text("Dashboard")
            ├── Expanded -> InkWell (index: 1, onTap -> AdminProductsScreen)
            │   └── Column
            │       ├── Icon(Icons.inventory_2_outlined / Icons.inventory_2)
            │       └── Text("Products")
            ├── Expanded -> InkWell (index: 2, onTap -> ManageCategoriesScreen)
            │   └── Column
            │       ├── Icon(Icons.category_outlined / Icons.category)
            │       └── Text("Category")
            ├── Expanded -> InkWell (index: 3, onTap -> ManageOrdersScreen)
            │   └── Column
            │       ├── Icon(Icons.receipt_long_outlined / Icons.receipt_long)
            │       └── Text("Orders")
            ├── Expanded -> InkWell (index: 4, onTap -> ManageUsersScreen)
            │   └── Column
            │       ├── Icon(Icons.person_outline / Icons.person)
            │       └── Text("Users")
            └── Expanded -> InkWell (index: 5, onTap -> AdminProfileScreen)
                └── Column
                    ├── Icon(Icons.account_circle_outlined / Icons.account_circle)
                    └── Text("Profile")"""
    }
]

def generate_txt():
    out_lines = []
    out_lines.append("=" * 80)
    out_lines.append("           JK JEWELLERY FLUTTER PROJECT - COMPLETE WIDGET TREES")
    out_lines.append("=" * 80)
    out_lines.append("")
    out_lines.append(f"Total Pages Analyzed: {len(PAGES)}")
    out_lines.append("")
    for idx, page in enumerate(PAGES, 1):
        out_lines.append("-" * 80)
        out_lines.append(f"[{idx:02d}] {page['name']} ({page['category']})")
        out_lines.append(f"File Path: {page['file']}")
        out_lines.append(f"Widget Type: {page['type']}")
        out_lines.append(f"Description: {page['description']}")
        out_lines.append("-" * 80)
        out_lines.append("WIDGET TREE:")
        out_lines.append(page['tree'])
        out_lines.append("")
        out_lines.append("")
    
    with open("flutter_widget_trees.txt", "w", encoding="utf-8") as f:
        f.write("\n".join(out_lines))
    print("Generated flutter_widget_trees.txt successfully.")

def generate_md():
    out_lines = []
    out_lines.append("# JK Jewellery Flutter App — Complete Widget Tree Architecture")
    out_lines.append("\nThis document provides an exhaustive, production-grade visual breakdown of the Flutter Widget Tree hierarchy across every screen and component in the `lib` folder of the JK Jewellery project.\n")
    out_lines.append("## Project Summary Table\n")
    out_lines.append("| # | Page Name | Category | File Path | Type |")
    out_lines.append("|---|-----------|----------|-----------|------|")
    for idx, page in enumerate(PAGES, 1):
        out_lines.append(f"| {idx:02d} | **{page['name']}** | {page['category']} | `{page['file']}` | `{page['type']}` |")
    out_lines.append("\n---\n")

    current_cat = None
    for idx, page in enumerate(PAGES, 1):
        if page['category'] != current_cat:
            current_cat = page['category']
            out_lines.append(f"## {current_cat}\n")
        out_lines.append(f"### {idx:02d}. {page['name']}\n")
        out_lines.append(f"- **File:** `{page['file']}`")
        out_lines.append(f"- **Type:** `{page['type']}`")
        out_lines.append(f"- **Description:** {page['description']}\n")
        out_lines.append("```text")
        out_lines.append(page['tree'])
        out_lines.append("```\n")

    with open("flutter_widget_trees.md", "w", encoding="utf-8") as f:
        f.write("\n".join(out_lines))
    print("Generated flutter_widget_trees.md successfully.")

def generate_html():
    html_content = ["""<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>JK Jewellery App - Flutter Widget Tree Architecture</title>
<style>
  body {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
    line-height: 1.6;
    color: #222;
    background-color: #f8f9fa;
    margin: 0;
    padding: 30px;
  }
  .container {
    max-width: 1000px;
    margin: auto;
    background: #fff;
    padding: 40px;
    border-radius: 12px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.08);
  }
  h1 { color: #3B2E9B; border-bottom: 3px solid #3B2E9B; padding-bottom: 12px; margin-top: 0; }
  h2 { color: #231B66; margin-top: 40px; border-bottom: 1px solid #ddd; padding-bottom: 6px; }
  h3 { color: #3B2E9B; margin-top: 25px; margin-bottom: 8px; }
  .badge {
    display: inline-block;
    padding: 3px 10px;
    font-size: 12px;
    font-weight: 600;
    border-radius: 12px;
    background: #EBE4F7;
    color: #3B2E9B;
    margin-right: 6px;
  }
  .file-badge {
    background: #f1f3f5;
    color: #495057;
    font-family: monospace;
  }
  pre {
    background: #1e1e2e;
    color: #cdd6f4;
    padding: 20px;
    border-radius: 8px;
    overflow-x: auto;
    font-family: "Cascadia Code", "Fira Code", Consolas, "Courier New", monospace;
    font-size: 13px;
    line-height: 1.5;
  }
  table {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
    font-size: 14px;
  }
  th, td {
    border: 1px solid #e9ecef;
    padding: 10px 12px;
    text-align: left;
  }
  th { background-color: #3B2E9B; color: #fff; }
  tr:nth-child(even) { background-color: #f8f9fa; }
  @media print {
    body { background: #fff; padding: 0; }
    .container { box-shadow: none; padding: 10px; }
    pre { background: #f8f9fa; color: #111; border: 1px solid #ccc; page-break-inside: avoid; }
    h2, h3 { page-break-after: avoid; }
  }
</style>
</head>
<body>
<div class="container">
<h1>JK Jewellery — Flutter Widget Tree Architecture</h1>
<p>Complete widget tree hierarchy analysis across all <strong>""" + str(len(PAGES)) + """</strong> Dart screens and components in the <code>lib</code> folder.</p>
<table>
<thead>
<tr><th>#</th><th>Screen / Component</th><th>Category</th><th>File Path</th><th>Type</th></tr>
</thead>
<tbody>"""]

    for idx, page in enumerate(PAGES, 1):
        html_content.append(f"<tr><td>{idx:02d}</td><td><strong>{page['name']}</strong></td><td>{page['category']}</td><td><code>{page['file']}</code></td><td>{page['type']}</td></tr>")

    html_content.append("</tbody></table>")

    current_cat = None
    for idx, page in enumerate(PAGES, 1):
        if page['category'] != current_cat:
            current_cat = page['category']
            html_content.append(f"<h2>{current_cat}</h2>")
        
        safe_tree = page['tree'].replace('&', '&amp;').replace('<', '&lt;').replace('>', '&gt;')
        html_content.append(f"""
<div style="margin-bottom: 30px;">
  <h3>{idx:02d}. {page['name']}</h3>
  <div>
    <span class="badge file-badge">{page['file']}</span>
    <span class="badge">{page['type']}</span>
    <span class="badge">{page['category']}</span>
  </div>
  <p style="color: #555; margin: 8px 0;">{page['description']}</p>
  <pre><code>{safe_tree}</code></pre>
</div>
""")

    html_content.append("</div></body></html>")
    with open("flutter_widget_trees.html", "w", encoding="utf-8") as f:
        f.write("\n".join(html_content))
    print("Generated flutter_widget_trees.html successfully.")

def generate_docx():
    doc = Document()
    
    # Page Margins: 0.75 in
    for section in doc.sections:
        section.top_margin = Inches(0.75)
        section.bottom_margin = Inches(0.75)
        section.left_margin = Inches(0.75)
        section.right_margin = Inches(0.75)

    # Styles
    title_p = doc.add_paragraph()
    title_run = title_p.add_run("JK Jewellery — Flutter Widget Tree Guide")
    title_run.font.name = "Calibri"
    title_run.font.size = Pt(24)
    title_run.font.bold = True
    title_run.font.color.rgb = RGBColor(0x3B, 0x2E, 0x9B)
    title_p.paragraph_format.space_after = Pt(6)

    sub_p = doc.add_paragraph()
    sub_run = sub_p.add_run("Complete widget hierarchy analysis for all screens in the lib folder.")
    sub_run.font.size = Pt(11)
    sub_run.font.color.rgb = RGBColor(0x66, 0x66, 0x66)
    sub_p.paragraph_format.space_after = Pt(18)

    # Summary table
    table = doc.add_table(rows=1, cols=4)
    table.style = 'Light Shading Accent 1'
    hdr_cells = table.rows[0].cells
    hdr_cells[0].text = "#"
    hdr_cells[1].text = "Page Name"
    hdr_cells[2].text = "Category"
    hdr_cells[3].text = "File Path"
    
    for idx, page in enumerate(PAGES, 1):
        row_cells = table.add_row().cells
        row_cells[0].text = f"{idx:02d}"
        row_cells[1].text = page['name']
        row_cells[2].text = page['category']
        row_cells[3].text = page['file']

    doc.add_page_break()

    current_cat = None
    for idx, page in enumerate(PAGES, 1):
        if page['category'] != current_cat:
            current_cat = page['category']
            cat_p = doc.add_paragraph()
            cat_run = cat_p.add_run(current_cat)
            cat_run.font.size = Pt(18)
            cat_run.font.bold = True
            cat_run.font.color.rgb = RGBColor(0x23, 0x1B, 0x66)
            cat_p.paragraph_format.space_before = Pt(18)
            cat_p.paragraph_format.space_after = Pt(6)

        # Page Heading
        p_head = doc.add_paragraph()
        r_head = p_head.add_run(f"{idx:02d}. {page['name']}")
        r_head.font.size = Pt(14)
        r_head.font.bold = True
        r_head.font.color.rgb = RGBColor(0x3B, 0x2E, 0x9B)
        p_head.paragraph_format.space_before = Pt(10)
        p_head.paragraph_format.space_after = Pt(2)

        # Meta
        p_meta = doc.add_paragraph()
        r_meta1 = p_meta.add_run(f"File: ")
        r_meta1.bold = True
        p_meta.add_run(f"{page['file']}   |   ")
        r_meta2 = p_meta.add_run(f"Type: ")
        r_meta2.bold = True
        p_meta.add_run(f"{page['type']}")
        p_meta.paragraph_format.space_after = Pt(2)

        # Desc
        p_desc = doc.add_paragraph()
        p_desc.add_run(page['description'])
        p_desc.paragraph_format.space_after = Pt(6)

        # Tree Block in Table (for background fill & border)
        tree_table = doc.add_table(rows=1, cols=1)
        tree_cell = tree_table.rows[0].cells[0]
        
        # XML background color #F8F9FA
        shading = parse_xml(r'<w:shd {} w:fill="F4F3FA"/>'.format(nsdecls('w')))
        tree_cell._tc.get_or_add_tcPr().append(shading)

        cell_p = tree_cell.paragraphs[0]
        cell_p.paragraph_format.space_before = Pt(4)
        cell_p.paragraph_format.space_after = Pt(4)
        cell_run = cell_p.add_run(page['tree'])
        cell_run.font.name = "Consolas"
        cell_run.font.size = Pt(8.5)
        cell_run.font.color.rgb = RGBColor(0x1A, 0x1A, 0x1A)

        doc.add_paragraph().paragraph_format.space_after = Pt(10)

    doc.save("flutter_widget_trees.docx")
    print("Generated flutter_widget_trees.docx successfully.")

if __name__ == "__main__":
    generate_txt()
    generate_md()
    generate_html()
    generate_docx()
    print("All 4 files created successfully!")
