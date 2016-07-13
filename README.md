
=======
# AFrame

This is the source code for Android AFrame ("Activity Frame") project. AFrame provides a developer friendly method to isolate
untrusted third-party code from the host applications. Our inspiration comes from browser’s iframe, which allows a web page to embed another web page, and these two pages are isolated if they come from different origins. Iframe is widely adopted, because of its isolation and easy-to-use properties. We would like to create a similar “frame” in activity, allowing an activity to embed another “activity”. From the user perspective, these two activities look like one because they seamlessly appear on the same window and behave like one unit. However, from the system perspective, they actually run in two different processes with different user IDs. We call such a frame AFrame ("Activity Frame").

## Working with Source Code

1. AFrame implementation is based on AOSP android-4.0.3 r1.2.
2. Establishing a Build Environment: https://source.android.com/source/initializing.html
3. Check out AFrame source code repository
3. $ . build/envsetup.sh
4. $ lunch full_eng
5. $ make -jN // change the value of N according to your machine set up. More details are available fom: https://source.android.com/source/building.html 

## Working with SDK

1. Establishing a Build Environment: https://source.android.com/source/initializing.html
2. Check out AFrame source code repository
3. $ . build/envsetup.sh
4. $ lunch sdk-eng
5. $ make -jN sdk
6. SDK Location: current_folder/out/host/linux-x86/sdk/android-sdk_eng.xyz_linux-x86.zip
7. Import SDK to Eclipse: Eclipse -> Window -> Preferences -> SDK Location
8. Make use of functionalities provided with AFrame, such as the "aframe" tag in AndroidManifest.xml
 
## Publication

Xiao Zhang, Amit Ahlawat, and Wenliang Du. <a href="http://www.cis.syr.edu/~wedu/Research/paper/aframe_acsac2013.pdf">AFrame: Isolating Advertisements from Mobile Applications in Android./</a> In Proceedings of the 29th Annual Computer Security Applications Conference (ACSAC), New Orleans, Louisiana, USA. December 9-13, 2013. 

## More Information

Please contact xzhang35@syr.edu for additional information, questions or suggestions.

## Liscense

Copyright (C) 2016 AFrame Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at: http://www.apache.org/licenses/LICENSE-2.0 Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

Copyright (C) 2012 The Android Open Source Project
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at:
http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

