package com.reactnativebuzzbooster;
import android.content.Context;
import android.view.View;
import android.widget.Button;
import com.buzzvil.booster.external.campaign.CampaignEntryView;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;

public class CampaignEntryViewManager extends SimpleViewManager<CampaignEntryView> {
    public static final String REACT_CLASS = "CampaignEntryView";

    @Override
    public String getName() {
        return REACT_CLASS;
    }

    @Override
    public CampaignEntryView createViewInstance(ThemedReactContext context) {
        return new CampaignEntryView(context.getCurrentActivity());
    }
}
