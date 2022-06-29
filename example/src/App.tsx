import * as React from 'react';

import { StyleSheet, View, Text } from 'react-native';
import * as BuzzBooster from 'react-native-buzz-booster';

export default function App() {
  const [result, setResult] = React.useState<number | undefined>();

  React.useEffect(() => {
    BuzzBooster.init("307117684877774")
    BuzzBooster.setUserId("damons")
    BuzzBooster.showInAppMessage()
  }, []);

  return (
    <View style={styles.container}>
      <Text>Result: {result}</Text>
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
