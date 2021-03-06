import * as React from 'react';

import { StyleSheet, View, Text } from 'react-native';
import * as BuzzBooster from 'react-native-buzz-booster';
import { CampaignEntryView, CampaignFloatingActionButton } from 'react-native-buzz-booster';

export default function App() {
  BuzzBooster.init({
    androidAppKey: "307117684877774",
    iosAppKey: "279753136766115"
  })
  BuzzBooster.setUserId("damons")
  BuzzBooster.showInAppMessage()
  React.useEffect(() => {
    
  }, []);

  return (
    <View style={styles.container}>
      <View style = {{ width: 100, height: 100 }}>
        <Text>Go to Campaign</Text>
      </View>
      
      <CampaignEntryView style = {{ width: 100, height: 100 }}></CampaignEntryView>
      <CampaignFloatingActionButton style={styles.fab}/>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
  fab: {
    width: 100,
    height: 100,
    bottom: 20,
    right: 20,
    position: 'absolute',
  }
});
