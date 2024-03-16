import React from 'react';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { NavigationContainer } from '@react-navigation/native';
import { Image } from 'react-native';

// Import your screens
import HomeScreen from './HomeScreen';
import NoticiasScreen from './NoticiasScreen';
import MapScreen from './MapScreen';

// import the icons
import HomeIconFilled from './assets/HouseFilled.png';
import HomeIconOutline from './assets/houseOutline.png';
import NoticiasIconFilled from './assets/bellFilled.png';
import NoticiasIconOutline from './assets/bellOutline.png';
import MapIconFilled from './assets/mapFilled.png';
import MapIconOutline from './assets/mapOutline.png';

const Tab = createBottomTabNavigator();

const customTabBarStyle = {
  backgroundColor: '#0B172F',
  height: 80,
  width: '80%',
  bottom: '3%',
  borderRadius: 22,
  position: 'absolute',
  left: '10%',
  borderTopColor: "#0B172F",
};

export default function App() {

  const iconWidth = 35;
  const iconHeight = 35;
  return (
    <NavigationContainer>
      <Tab.Navigator
        screenOptions={{
          tabBarStyle: customTabBarStyle,
          tabBarActiveTintColor: '#fff',
          tabBarInactiveTintColor: '#fff',
        }}
        initialRouteName="Home"
      >
        <Tab.Screen
          name="Mapa"
          component={MapScreen}
          options={{
            headerShown: false,
            tabBarShowLabel: false,
            tabBarIcon: ({ size, focused, color }) => {
              return (
                <Image
                  style={{
                    width: iconWidth,
                    height: iconHeight,
                    top: 15,
                  }}
                  source={focused ? MapIconFilled : MapIconOutline}
                />
              );
            },
          }}
        />
        <Tab.Screen name="Home" component={HomeScreen} options={{
          headerShown: false,
          tabBarShowLabel: false,
          tabBarIcon: ({ size, focused, color }) => {
            return (
              <Image
                style={{
                  width: iconWidth,
                  height: iconHeight,
                  top: 15,
                }}
                source={focused ? HomeIconFilled : HomeIconOutline}
              />
            );
          },
        }} />
        <Tab.Screen
          name="Noticias"
          component={NoticiasScreen}
          options={{
            headerShown: false,
            tabBarShowLabel: false,
            tabBarIcon: ({ size, focused, color }) => {
              return (
                <Image
                  style={{
                    width: iconWidth,
                    height: iconHeight,
                    top: 15,
                  }}
                  source={focused ? NoticiasIconFilled : NoticiasIconOutline}
                />
              );
            },
          }}
        />
      </Tab.Navigator>
    </NavigationContainer>
  );
}
