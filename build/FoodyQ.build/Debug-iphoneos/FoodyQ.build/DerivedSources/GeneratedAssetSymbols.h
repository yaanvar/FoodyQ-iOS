#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The resource bundle ID.
static NSString * const ACBundleID AC_SWIFT_PRIVATE = @"FoddyQ-Team.FoodyQ";

/// The "Background" asset catalog color resource.
static NSString * const ACColorNameBackground AC_SWIFT_PRIVATE = @"Background";

/// The "Shadow" asset catalog color resource.
static NSString * const ACColorNameShadow AC_SWIFT_PRIVATE = @"Shadow";

/// The "tabbar" asset catalog color resource.
static NSString * const ACColorNameTabbar AC_SWIFT_PRIVATE = @"tabbar";

/// The "tabbaritem" asset catalog color resource.
static NSString * const ACColorNameTabbaritem AC_SWIFT_PRIVATE = @"tabbaritem";

/// The "Background 1" asset catalog image resource.
static NSString * const ACImageNameBackground1 AC_SWIFT_PRIVATE = @"Background 1";

/// The "Background 10" asset catalog image resource.
static NSString * const ACImageNameBackground10 AC_SWIFT_PRIVATE = @"Background 10";

/// The "Background 2" asset catalog image resource.
static NSString * const ACImageNameBackground2 AC_SWIFT_PRIVATE = @"Background 2";

/// The "Background 3" asset catalog image resource.
static NSString * const ACImageNameBackground3 AC_SWIFT_PRIVATE = @"Background 3";

/// The "Background 4" asset catalog image resource.
static NSString * const ACImageNameBackground4 AC_SWIFT_PRIVATE = @"Background 4";

/// The "Background 5" asset catalog image resource.
static NSString * const ACImageNameBackground5 AC_SWIFT_PRIVATE = @"Background 5";

/// The "Background 6" asset catalog image resource.
static NSString * const ACImageNameBackground6 AC_SWIFT_PRIVATE = @"Background 6";

/// The "Background 7" asset catalog image resource.
static NSString * const ACImageNameBackground7 AC_SWIFT_PRIVATE = @"Background 7";

/// The "Background 8" asset catalog image resource.
static NSString * const ACImageNameBackground8 AC_SWIFT_PRIVATE = @"Background 8";

/// The "Background 9" asset catalog image resource.
static NSString * const ACImageNameBackground9 AC_SWIFT_PRIVATE = @"Background 9";

/// The "Blob" asset catalog image resource.
static NSString * const ACImageNameBlob AC_SWIFT_PRIVATE = @"Blob";

/// The "logo_big" asset catalog image resource.
static NSString * const ACImageNameLogoBig AC_SWIFT_PRIVATE = @"logo_big";

/// The "logo_small" asset catalog image resource.
static NSString * const ACImageNameLogoSmall AC_SWIFT_PRIVATE = @"logo_small";

#undef AC_SWIFT_PRIVATE