# Keep all Kotlin metadata
-keep class kotlin.** { *; }
-keep class kotlinx.** { *; }
-keep class com.example.yourapp.** { *; }

# Keep all Flutter-generated classes
-keep class io.flutter.** { *; }

# Keep localization classes
-keep class * implements flutter.plugins.localization.** { *; }
