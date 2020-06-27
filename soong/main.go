package msm8974

import (
    "android/soong/android"
)

func init() {
    android.RegisterModuleType("oppo_msm8974_init_library_static", initLibraryFactory)
}
