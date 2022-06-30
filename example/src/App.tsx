import * as React from 'react';

import { StyleSheet, View, Text } from 'react-native';
import * as BuzzBooster from 'react-native-buzz-booster';
import { CampaignEntryView, CampaignFloatingActionButton } from 'react-native-buzz-booster';

export default function App() {
  
  React.useEffect(() => {
    BuzzBooster.init("307117684877774")
    BuzzBooster.setUserId("damons")
    BuzzBooster.showInAppMessage()
  }, []);

  return (
    <View style={styles.container}>
      <View style = {{ width: 100, height: 100 }}>
        <Text>Go to Campaign</Text>
      </View>
      <CampaignFloatingActionButton style = {{ width: 100, height: 100 }}/>
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
});
