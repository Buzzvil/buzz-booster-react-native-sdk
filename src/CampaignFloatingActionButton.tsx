import ReactNative  from 'react-native';

const description = Object.getOwnPropertyDescriptor( ReactNative, 'requireNativeComponent' )

if ( typeof description != 'undefined' && !description.writable ) {
  Object.defineProperty( ReactNative, 'requireNativeComponent', {
    value: (function () {
      const cache = {}
      const _requireNativeComponent = ReactNative.requireNativeComponent

      return function requireNativeComponent( nativeComponent ) {

        if ( !cache[ nativeComponent ] ) {
          cache[ nativeComponent ] = _requireNativeComponent( nativeComponent )
        }

        return cache[ nativeComponent ]
      }
    })(), writable: true
  } )
}

import { requireNativeComponent } from "react-native";
export default requireNativeComponent("CampaignFloatingActionButton");
