# JK Jewellery Flutter App — Complete Widget Tree Architecture

This document provides an exhaustive, production-grade visual breakdown of the Flutter Widget Tree hierarchy across every screen and component in the `lib` folder of the JK Jewellery project.

## Project Summary Table

| # | Page Name | Category | File Path | Type |
|---|-----------|----------|-----------|------|
| 01 | **MyApp (Root Entry & Route Map)** | Application Root & Entry | `lib/main.dart` | `StatelessWidget` |
| 02 | **LoginScreen** | Authentication Screens | `lib/authentication/loginscreen.dart` | `StatefulWidget` |
| 03 | **RegisterScreen** | Authentication Screens | `lib/authentication/registerscreen.dart` | `StatefulWidget` |
| 04 | **ForgotPasswordScreen** | Authentication Screens | `lib/authentication/forgotPasswordScreen.dart` | `StatefulWidget` |
| 05 | **OtpScreen** | Authentication Screens | `lib/authentication/otpscreen.dart` | `StatefulWidget` |
| 06 | **PasswordScreen (Set New Password)** | Authentication Screens | `lib/authentication/passwordscreen.dart` | `StatefulWidget` |
| 07 | **HomeScreen** | User Experience Screens | `lib/screens/homescreen.dart` | `StatelessWidget` |
| 08 | **JewelleryScreen (Catalog / All Jewellery)** | User Experience Screens | `lib/screens/jewelleryscreen.dart` | `StatelessWidget` |
| 09 | **SearchFilterScreen** | User Experience Screens | `lib/screens/searchfilterscreen.dart` | `StatefulWidget` |
| 10 | **ProductDetailsScreen** | User Experience Screens | `lib/screens/productdetailsscreen.dart` | `StatefulWidget` |
| 11 | **CartScreen** | User Experience Screens | `lib/screens/cartscreen.dart` | `StatefulWidget` |
| 12 | **CheckoutScreen** | User Experience Screens | `lib/screens/checkoutscreen.dart` | `StatelessWidget` |
| 13 | **PaymentScreen** | User Experience Screens | `lib/screens/paymentscreen.dart` | `StatefulWidget` |
| 14 | **OrderHistoryScreen** | User Experience Screens | `lib/screens/orderhistoryscreen.dart` | `StatefulWidget` |
| 15 | **ProfileScreen** | User Experience Screens | `lib/screens/profilescreen.dart` | `StatelessWidget` |
| 16 | **WishlistScreen** | User Experience Screens | `lib/screens/wishlistscreen.dart` | `StatelessWidget` |
| 17 | **TermsScreen** | User Experience Screens | `lib/screens/tearmscreen.dart` | `StatelessWidget` |
| 18 | **AdminDashboardScreen** | Admin Portal Screens | `lib/admin_screen/admin_dashboard_screen.dart` | `StatelessWidget` |
| 19 | **AdminProductsScreen** | Admin Portal Screens | `lib/admin_screen/admin_products_screen.dart` | `StatelessWidget` |
| 20 | **AddProductScreen** | Admin Portal Screens | `lib/admin_screen/add_product_screen.dart` | `StatefulWidget` |
| 21 | **EditProductScreen** | Admin Portal Screens | `lib/admin_screen/edit_product_screen.dart` | `StatefulWidget` |
| 22 | **DeleteProductScreen** | Admin Portal Screens | `lib/admin_screen/delete_product_screen.dart` | `StatelessWidget` |
| 23 | **ManageCategoriesScreen** | Admin Portal Screens | `lib/admin_screen/manage_categories_screen.dart` | `StatelessWidget` |
| 24 | **AddCategoryScreen** | Admin Portal Screens | `lib/admin_screen/add_category_screen.dart` | `StatefulWidget` |
| 25 | **EditCategoryScreen** | Admin Portal Screens | `lib/admin_screen/edit_category_screen.dart` | `StatefulWidget` |
| 26 | **ManageOrdersScreen** | Admin Portal Screens | `lib/admin_screen/manage_orders_screen.dart` | `StatelessWidget` |
| 27 | **UpdateOrderStatusScreen** | Admin Portal Screens | `lib/admin_screen/update_order_status_screen.dart` | `StatefulWidget` |
| 28 | **ManageUsersScreen** | Admin Portal Screens | `lib/admin_screen/manage_users_screen.dart` | `StatelessWidget` |
| 29 | **AddUserScreen** | Admin Portal Screens | `lib/admin_screen/add_user_screen.dart` | `StatefulWidget` |
| 30 | **AdminProfileScreen** | Admin Portal Screens | `lib/admin_screen/admin_profile_screen.dart` | `StatelessWidget` |
| 31 | **EditProfileScreen** | Admin Portal Screens | `lib/admin_screen/edit_profile_screen.dart` | `StatefulWidget` |
| 32 | **UserBottomNav** | Shared Bottom Navigation Widgets | `lib/widgets/user_bottom_nav.dart` | `StatelessWidget` |
| 33 | **AdminBottomNav** | Shared Bottom Navigation Widgets | `lib/widgets/admin_bottom_nav.dart` | `StatelessWidget` |

---

## Application Root & Entry

### 01. MyApp (Root Entry & Route Map)

- **File:** `lib/main.dart`
- **Type:** `StatelessWidget`
- **Description:** Root configuration of JK Jewellery application. Sets up MaterialApp, seed theme color (#3B2E9B), initial home (LoginScreen), and comprehensive named routes.

```text
MaterialApp
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
    └── '/admin/profile/edit' ──> EditProfileScreen
```

## Authentication Screens

### 02. LoginScreen

- **File:** `lib/authentication/loginscreen.dart`
- **Type:** `StatefulWidget`
- **Description:** User & Admin login screen with email, password fields, link to forgot password, and navigation to admin or registration.

```text
Scaffold (backgroundColor: Colors.white)
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
            └── SizedBox (height: 40)
```

### 03. RegisterScreen

- **File:** `lib/authentication/registerscreen.dart`
- **Type:** `StatefulWidget`
- **Description:** New account registration page with full name, email, phone, and dual password inputs.

```text
Scaffold (backgroundColor: Colors.white)
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
            └── SizedBox (height: 40)
```

### 04. ForgotPasswordScreen

- **File:** `lib/authentication/forgotPasswordScreen.dart`
- **Type:** `StatefulWidget`
- **Description:** Password reset initialization with email input and back navigation.

```text
Scaffold (backgroundColor: Colors.white)
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
            └── SizedBox (height: 40)
```

### 05. OtpScreen

- **File:** `lib/authentication/otpscreen.dart`
- **Type:** `StatefulWidget`
- **Description:** OTP verification input screen.

```text
Scaffold (backgroundColor: Colors.white)
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
            └── SizedBox (height: 40)
```

### 06. PasswordScreen (Set New Password)

- **File:** `lib/authentication/passwordscreen.dart`
- **Type:** `StatefulWidget`
- **Description:** Allows user to submit a new password and confirmation after OTP verification.

```text
Scaffold (backgroundColor: Colors.white)
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
            └── SizedBox (height: 40)
```

## User Experience Screens

### 07. HomeScreen

- **File:** `lib/screens/homescreen.dart`
- **Type:** `StatelessWidget`
- **Description:** Main consumer storefront landing screen. Top user bar, search input, circular category badges, horizontal New Arrivals list, and horizontal Popular Products carousel.

```text
Scaffold (backgroundColor: Colors.white)
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
└── UserBottomNav (currentIndex: 0) (bottomNavigationBar)
```

### 08. JewelleryScreen (Catalog / All Jewellery)

- **File:** `lib/screens/jewelleryscreen.dart`
- **Type:** `StatelessWidget`
- **Description:** Full catalog display with 2-column GridView of products, direct search bar, quick filter button, and cart shortcut.

```text
Scaffold (backgroundColor: Colors.white)
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
└── UserBottomNav (currentIndex: 1) (bottomNavigationBar)
```

### 09. SearchFilterScreen

- **File:** `lib/screens/searchfilterscreen.dart`
- **Type:** `StatefulWidget`
- **Description:** Filter options dialog with category dropdown, radio options for product status (All, New, Old), and radio options for sorting.

```text
Scaffold (backgroundColor: Colors.white)
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
└── UserBottomNav (currentIndex: 1) (bottomNavigationBar)
```

### 10. ProductDetailsScreen

- **File:** `lib/screens/productdetailsscreen.dart`
- **Type:** `StatefulWidget`
- **Description:** Item details showcase: high resolution asset preview, stock badge, quantity increment/decrement controls, Add to Cart, and Add to Wishlist.

```text
Scaffold (backgroundColor: Colors.white)
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
└── UserBottomNav (currentIndex: 3) (bottomNavigationBar)
```

### 11. CartScreen

- **File:** `lib/screens/cartscreen.dart`
- **Type:** `StatefulWidget`
- **Description:** User shopping bag showing dynamic item list, quantity counters, delete option, price aggregation, and sticky checkout footer.

```text
Scaffold (backgroundColor: Colors.white)
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
└── UserBottomNav (currentIndex: 3) (bottomNavigationBar)
```

### 12. CheckoutScreen

- **File:** `lib/screens/checkoutscreen.dart`
- **Type:** `StatelessWidget`
- **Description:** Order placement overview including delivery address card, item breakdown, dashed total line, and payment progression button.

```text
Scaffold (backgroundColor: Colors.white)
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
│       │           │       │       ├── Text("123, Green Street,\nMumbai - 400001")
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
└── UserBottomNav (currentIndex: 3) (bottomNavigationBar)
```

### 13. PaymentScreen

- **File:** `lib/screens/paymentscreen.dart`
- **Type:** `StatefulWidget`
- **Description:** Payment gateway selection supporting Cash on Delivery and UPI with active selection indicators.

```text
Scaffold (backgroundColor: Colors.white)
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
└── UserBottomNav (currentIndex: 3) (bottomNavigationBar)
```

### 14. OrderHistoryScreen

- **File:** `lib/screens/orderhistoryscreen.dart`
- **Type:** `StatefulWidget`
- **Description:** User purchase logs with filter pills ('All', 'Processing', 'Delivered'), dynamic status chips, and contextual actions.

```text
Scaffold (backgroundColor: Colors.white)
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
└── UserBottomNav (currentIndex: 3) (bottomNavigationBar)
```

### 15. ProfileScreen

- **File:** `lib/screens/profilescreen.dart`
- **Type:** `StatelessWidget`
- **Description:** User account overview with avatar, order navigation, wishlist link, edit profile, and red Logout button.

```text
Scaffold (backgroundColor: Colors.white)
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
└── UserBottomNav (currentIndex: 4) (bottomNavigationBar)
```

### 16. WishlistScreen

- **File:** `lib/screens/wishlistscreen.dart`
- **Type:** `StatelessWidget`
- **Description:** Saved items list with empty state placeholder and persistent bottom navigation.

```text
Scaffold
├── AppBar (title: Text("My Wishlist"), centerTitle: true)
├── Center (body)
│   └── Column (mainAxisSize: min)
│       ├── Icon(Icons.favorite_border, size: 56, color: #3B2E9B)
│       ├── SizedBox (height: 12)
│       └── Text("Your wishlist is empty.")
└── UserBottomNav (currentIndex: 2) (bottomNavigationBar)
```

### 17. TermsScreen

- **File:** `lib/screens/tearmscreen.dart`
- **Type:** `StatelessWidget`
- **Description:** Terms of Service and legal agreements viewer with card layout and Accept / Decline choices.

```text
Scaffold (backgroundColor: Colors.white)
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
            └── SizedBox (height: 40)
```

## Admin Portal Screens

### 18. AdminDashboardScreen

- **File:** `lib/admin_screen/admin_dashboard_screen.dart`
- **Type:** `StatelessWidget`
- **Description:** Administrator control panel overview with summary metrics (Total Orders, Active Users, Total Products) and real-time Recent Orders list.

```text
Scaffold (backgroundColor: Colors.white)
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
└── AdminBottomNav (currentIndex: 0) (bottomNavigationBar)
```

### 19. AdminProductsScreen

- **File:** `lib/admin_screen/admin_products_screen.dart`
- **Type:** `StatelessWidget`
- **Description:** Product management table with items, pricing, live stock numbers, inline Edit & Delete triggers, plus Floating Action Button to add inventory.

```text
Scaffold (backgroundColor: Colors.white)
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
└── AdminBottomNav (currentIndex: 1) (bottomNavigationBar)
```

### 20. AddProductScreen

- **File:** `lib/admin_screen/add_product_screen.dart`
- **Type:** `StatefulWidget`
- **Description:** Product creation portal with custom dashed border image upload box, name, category picker, side-by-side price/stock fields, and description text area.

```text
Scaffold (backgroundColor: Colors.white)
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
└── AdminBottomNav (currentIndex: 1) (bottomNavigationBar)
```

### 21. EditProductScreen

- **File:** `lib/admin_screen/edit_product_screen.dart`
- **Type:** `StatefulWidget`
- **Description:** Product editor pre-populated with active inventory metadata, image replacement badge, Update Product button, and red Delete action.

```text
Scaffold (backgroundColor: Colors.white)
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
└── AdminBottomNav (currentIndex: 1) (bottomNavigationBar)
```

### 22. DeleteProductScreen

- **File:** `lib/admin_screen/delete_product_screen.dart`
- **Type:** `StatelessWidget`
- **Description:** Product deletion confirmation modal screen with trash icon badge, item name confirmation, and Cancel / Yes Delete buttons.

```text
Scaffold (backgroundColor: Colors.white)
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
└── AdminBottomNav (currentIndex: 1) (bottomNavigationBar)
```

### 23. ManageCategoriesScreen

- **File:** `lib/admin_screen/manage_categories_screen.dart`
- **Type:** `StatelessWidget`
- **Description:** Overview of all store departments with product quantities per category, inline Edit/Delete buttons, and bottom 'Add New Category' CTA.

```text
Scaffold (backgroundColor: Colors.white)
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
└── AdminBottomNav (currentIndex: 2) (bottomNavigationBar)
```

### 24. AddCategoryScreen

- **File:** `lib/admin_screen/add_category_screen.dart`
- **Type:** `StatefulWidget`
- **Description:** Category creation page with dashed icon upload area, title, color theme selector, and detailed description field.

```text
Scaffold (backgroundColor: Colors.white)
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
└── AdminBottomNav (currentIndex: 2) (bottomNavigationBar)
```

### 25. EditCategoryScreen

- **File:** `lib/admin_screen/edit_category_screen.dart`
- **Type:** `StatefulWidget`
- **Description:** Category editor prefilled with existing category credentials, icon update button, Update Category button, and Delete Category link.

```text
Scaffold (backgroundColor: Colors.white)
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
└── AdminBottomNav (currentIndex: 2) (bottomNavigationBar)
```

### 26. ManageOrdersScreen

- **File:** `lib/admin_screen/manage_orders_screen.dart`
- **Type:** `StatelessWidget`
- **Description:** Comprehensive admin order processing log displaying customer names, item count, totals, status badges, and 'Update Status' triggers.

```text
Scaffold (backgroundColor: Colors.white)
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
└── AdminBottomNav (currentIndex: 3) (bottomNavigationBar)
```

### 27. UpdateOrderStatusScreen

- **File:** `lib/admin_screen/update_order_status_screen.dart`
- **Type:** `StatefulWidget`
- **Description:** Order progression stepper (New -> Processing -> Shipped -> Delivered) with interactive radio-selection step cards.

```text
Scaffold (backgroundColor: Colors.white)
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
                    └── Text("Confirm Update")
```

### 28. ManageUsersScreen

- **File:** `lib/admin_screen/manage_users_screen.dart`
- **Type:** `StatelessWidget`
- **Description:** User account management list featuring name/email search, initial letter badges, role indicators ('Admin' / 'User'), and FAB to register users.

```text
Scaffold (backgroundColor: Colors.white)
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
└── AdminBottomNav (currentIndex: 4) (bottomNavigationBar)
```

### 29. AddUserScreen

- **File:** `lib/admin_screen/add_user_screen.dart`
- **Type:** `StatefulWidget`
- **Description:** New user creation portal with photo placeholder, full name, email, phone, role dropdown ('User' / 'Admin'), and password inputs.

```text
Scaffold (backgroundColor: Colors.white)
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
└── AdminBottomNav (currentIndex: 4) (bottomNavigationBar)
```

### 30. AdminProfileScreen

- **File:** `lib/admin_screen/admin_profile_screen.dart`
- **Type:** `StatelessWidget`
- **Description:** Administrator profile hub with 'Super Admin' badge, shortcuts to Orders, Products, Edit Profile, and Logout.

```text
Scaffold (backgroundColor: Colors.white)
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
└── AdminBottomNav (currentIndex: 5) (bottomNavigationBar)
```

### 31. EditProfileScreen

- **File:** `lib/admin_screen/edit_profile_screen.dart`
- **Type:** `StatefulWidget`
- **Description:** Admin profile modifier with camera change badge, name, locked email input, and dual password inputs with visibility toggles.

```text
Scaffold (backgroundColor: Colors.white)
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
                    └── SizedBox (height: 30)
```

## Shared Bottom Navigation Widgets

### 32. UserBottomNav

- **File:** `lib/widgets/user_bottom_nav.dart`
- **Type:** `StatelessWidget`
- **Description:** 5-tab bottom navigation bar for shoppers: Home (0), Jewellery (1), Wishlist (2), Cart (3), and Profile (4).

```text
Container (color: Colors.white, boxShadow: subtle top blur)
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
                    └── Text("Profile")
```

### 33. AdminBottomNav

- **File:** `lib/widgets/admin_bottom_nav.dart`
- **Type:** `StatelessWidget`
- **Description:** 6-tab bottom navigation bar for store admins: Dashboard (0), Products (1), Category (2), Orders (3), Users (4), and Profile (5).

```text
Container (color: Colors.white, boxShadow: subtle top blur)
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
                    └── Text("Profile")
```
