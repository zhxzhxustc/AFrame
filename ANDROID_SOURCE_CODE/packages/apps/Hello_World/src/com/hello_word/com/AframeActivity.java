package com.hello_word.com;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.webkit.*;
import android.util.Log;
import android.widget.Toast;
import com.google.gson.Gson;

public class AframeActivity extends Activity {

//Called when the activity is first created. 

  @Override
  public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.main);

    final WebView Wv = (WebView)findViewById(R.id.webView1);
	Wv.setWebViewClient(new WebViewClient() {
		public boolean shouldOverrideUrlLoading(WebView view, String url) {
			view.loadUrl(url);
		       return true;
		}
	});
    final JavaScriptInterface myJavaScriptInterface = new JavaScriptInterface(this);    	 
/*    
    Gson gson = new Gson();
    Log.d("XIAO","Start serialization!!!");
    String json = gson.toJson(myJavaScriptInterface);
    Log.d("XIAO","Done serialization!!!");
    Log.d("XIAO","Start deserialization!!!");
    Context obj2 = gson.fromJson(json, Context.class);   
    Log.d("XIAO","Done deserialization!!!");    
    Toast.makeText(obj2, "Hello Gson!!!", Toast.LENGTH_SHORT).show();
*/
    Wv.getSettings().setLightTouchEnabled(true);
    Wv.getSettings().setJavaScriptEnabled(true);
    Wv.addJavascriptInterface(myJavaScriptInterface, "AndroidFunction");
    Wv.loadUrl("http://www.google.com"); 
  }

  public class JavaScriptInterface {
    Context mContext;
    JavaScriptInterface(Context c) {
        mContext = c;
    }
	    
    public void showToast(String webMessage){	    	
    	final String msgeToast = webMessage;	    	
        Toast.makeText(mContext, webMessage, Toast.LENGTH_SHORT).show();
    }
  }
    
}


