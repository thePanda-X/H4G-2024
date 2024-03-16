import React from 'react';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { NavigationContainer } from '@react-navigation/native';
import { View, Text } from 'react-native';

export default function NoticiasScreen() {

    const locationName = "Madrid, Spain";


    return (
        <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>

            <View>
                <View>

                </View>
                <View>
                    <Text>{locationName}</Text>
                </View>
            </View>
            <Text>Home!</Text>
        </View>
    );

}