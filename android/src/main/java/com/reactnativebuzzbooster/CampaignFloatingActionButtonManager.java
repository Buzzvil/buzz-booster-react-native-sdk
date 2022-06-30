package com.reactnativebuzzbooster;
import android.content.Context;
import android.view.View;
import android.widget.Button;

import com.buzzvil.booster.external.campaign.CampaignEntryView;
import com.buzzvil.booster.external.campaign.CampaignFloatingActionButton;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class CampaignFloatingActionButtonManager extends SimpleViewManager<CampaignFloatingActionButton> {
    public static final String REACT_CLASS = "CampaignFloatingActionButton";

    @Override
    public String getName() {
        return REACT_CLASS;
    }

    @Override
    public CampaignFloatingActionButton createViewInstance(ThemedReactContext context) {
        return new CampaignFloatingActionButton(context.getCurrentActivity());
    }
}
