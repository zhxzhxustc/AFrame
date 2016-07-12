# AFrame

This is the source code for Android AFrame ("Activity Frame") project. AFrame provides a developer friendly method to isolate
untrusted third-party code from the host applications. Our inspiration comes from browser’s iframe, which allows a web page to embed another web page, and these two pages are isolated if they come from different origins. Iframe is widely adopted, because of its isolation and easy-to-use properties. We would like to create a similar “frame” in activity, allowing an activity to embed another “activity”. From the user perspective, these two activities look like one because they seamlessly appear on the same window and behave like one unit. However, from the system perspective, they actually run in two different processes with different user IDs. We call such a frame AFrame ("Activity Frame").

