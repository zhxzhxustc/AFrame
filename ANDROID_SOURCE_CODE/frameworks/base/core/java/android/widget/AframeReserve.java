/*
 * Copyright (C) 2006 The Android Open Source Project
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

package android.widget;

import com.android.internal.R;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.Gravity;
import android.view.View;
import android.view.ViewDebug;
import android.view.ViewGroup;
import android.widget.RemoteViews.RemoteView;


/**
 * Aframe ViewGroup containing reserve the canvas space for aframe activity
 */

@RemoteView
public class AframeReserve extends LinearLayout {

    public AframeReserve(Context context) {
        super(context);
    }

    public AframeReserve(Context context, AttributeSet attrs) {
        super(context, attrs, 0);
    }
    
    public AframeReserve(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }
}
