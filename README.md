# react-native-buzz-booster
BuzzBooster React Native SDK

## Installation

```sh
npm install react-native-buzz-booster
```

## Usage

```ts
import * as BuzzBooster from 'react-native-buzz-booster';
import { CampaignEntryView, CampaignFloatingActionButton } from 'react-native-buzz-booster';

// ...
export default function App() {
    BuzzBooster.init({
        androidAppKey: "307117684877774",
        iosAppKey: "279753136766115"
    })
    BuzzBooster.setUserId("damons")
    BuzzBooster.showInAppMessage()

    return (
    <View style={styles.container}>
      <View style = {{ width: 100, height: 100 }}>
        <Text>Go to Campaign</Text>
        <CampaignEntryView style = {{ width: 100, height: 100 }}></CampaignEntryView>
      </View>
      <CampaignFloatingActionButton style = {{ width: 100, height: 100 }}/>
    </View>
  );
}
```

## Deployment
```sh
npm adduser # when need new user
npm publish
```

## License

MIT
