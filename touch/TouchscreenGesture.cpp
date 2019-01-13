/*
 * Copyright (C) 2019 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <fstream>

#include "TouchscreenGesture.h"

namespace vendor {
namespace lineage {
namespace touch {
namespace V1_0 {
namespace oppo8974 {

static const std::string GESTURE_PATHS[] = {
    "/proc/touchpanel/up_arrow_enable",
    "/proc/touchpanel/down_arrow_enable",
    "/proc/touchpanel/left_arrow_enable",
    "/proc/touchpanel/right_arrow_enable",
    "/proc/touchpanel/double_swipe_enable",
    "/proc/touchpanel/letter_o_enable",
};

TouchscreenGesture::TouchscreenGesture() {
}

// Methods from ::vendor::lineage::touch::V1_0::ITouchscreenGesture follow.
Return<void> TouchscreenGesture::getSupportedGestures(getSupportedGestures_cb _hidl_cb) {
    std::vector<Gesture> gestures;
    gestures.push_back(Gesture{0, "Up arrow", 255});
    gestures.push_back(Gesture{1, "Down arrow", 252});
    gestures.push_back(Gesture{2, "Left arrow", 253});
    gestures.push_back(Gesture{3, "Right arrow", 254});
    gestures.push_back(Gesture{4, "Two finger down swipe", 251});
    gestures.push_back(Gesture{5, "Letter O", 250});

    _hidl_cb(gestures);
    return Void();
}

Return<void> TouchscreenGesture::setGestureEnabled(const Gesture& gesture, bool enabled) {
    std::ofstream file(GESTURE_PATHS[gesture.id]);
    file << (enabled ? "1" : "0");
    return Void();
}

}  // namespace oppo8974
}  // namespace V1_0
}  // namespace touch
}  // namespace lineage
}  // namespace vendor
