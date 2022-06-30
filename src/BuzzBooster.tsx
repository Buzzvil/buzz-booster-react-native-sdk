import { NativeModules, Platform } from 'react-native';
const LINKING_ERROR =
  `The package 'react-native-buzz-booster' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo managed workflow\n';

const BuzzBooster = NativeModules.BuzzBooster  ? NativeModules.BuzzBooster  : new Proxy(
    {},
    {
      get() {
        throw new Error(LINKING_ERROR);
      },
    }
  );

export function init(appKey: string) {
    BuzzBooster.init(appKey)
}

export function setUserId(userId?: string) {
    BuzzBooster.setUserId(userId)
}

export function showInAppMessage() {
    BuzzBooster.showInAppMessage()
}