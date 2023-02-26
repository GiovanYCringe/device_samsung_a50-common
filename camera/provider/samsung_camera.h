/*
 * Copyright (C) 2021 The LineageOS Project
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

#ifndef SAMSUNG_CAMERA_H
#define SAMSUNG_CAMERA_H

#include <vector>

#define SAMSUNG_CAMERA_DEBUG

std::vector<int> mExtraIDs = {
#ifdef EXYNOS9611_MODEL_a51
      4, 20, 23, 50, 52, 54
#else
#error "Please update extra camera id's configuration"
#endif
};

#endif // SAMSUNG_CAMERA_H
