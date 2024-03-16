import React from 'react';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { NavigationContainer } from '@react-navigation/native';
import { View, Text, Image, ScrollView } from 'react-native';
import Header from './Header.js';

import StylesHome from './StylesHome.js';

import ajustesIcon from './assets/icons8-ajustes-144.png';
import InundacionIcon from './assets/Agua.png';
import IncendioIcon from './assets/Fuego.png';
import alerta from './assets/Alerta.png'

import CardComponent from './CardComponent.js';

export default function HomeScreen() {

    const locationName = "Madrid, Spain";

    const contentsForCard = [

        {
            tipoCatastrofe: "Inundacion",
            text: "25 Abr",
        },
        {
            tipoCatastrofe: "Inundacion",
            text: "27 Abr",
        },
        {
            tipoCatastrofe: "Incendio",
            text: "24 Abr",
        },
        {
            tipoCatastrofe: "Incendio",
            text: "25 Abr",
        },
        {
            tipoCatastrofe: "Inundacion",
            text: "27 Abr",
        },

    ]

    return (
        <View style={StylesHome.container}>
            <Header />
            <View style={StylesHome.Status}>
                <View style={StylesHome.IconCircleWrapper}>
                    <View style={StylesHome.BackCircle}></View>
                    <Image source={InundacionIcon} style={StylesHome.StatusIcon} />
                    <Image source={alerta} style={StylesHome.AlertIcon} />
                </View>
                <Text style={StylesHome.StatusTitle}>INUNDACIÓN</Text>
                <View style={StylesHome.descriptionWrapper}>
                    <Text style={StylesHome.StatusText}>Se esperan fuertes lluvias y potenciales inundaciones en:</Text>
                </View>
                <View style={StylesHome.timeBox}>
                    <Text style={StylesHome.timeBoxText}>14d 19h</Text>
                </View>
            </View>
            <Text style={StylesHome.proximas}>Próximas Alertas</Text>
            <ScrollView horizontal={true} showsHorizontalScrollIndicator={false} style={StylesHome.ScrollView}>
                {
                    contentsForCard.map((item, index) => {
                        return (
                            <CardComponent key={index} tipoCatastrofe={item.tipoCatastrofe} text={item.text} />
                        );
                    })
                }
            </ScrollView>
        </View>
    );

}

