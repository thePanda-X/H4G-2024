import { React, useState, useEffect } from 'react';
import { View, Text, StyleSheet, Image } from 'react-native';


import IncendioIcon from './assets/Fuego.png';
import TerremotoIcon from './assets/icons8-ajustes-144.png';
import InundacionIcon from './assets/Agua.png';
import NevadasIcon from './assets/icons8-ajustes-144.png';
import VolcanIcon from './assets/icons8-ajustes-144.png';
import HuracanIcon from './assets/icons8-ajustes-144.png';


const CardComponent = ({ tipoCatastrofe, text }) => {


    const [imagenAlerta, setImagenAlerta] = useState(IncendioIcon);

    useEffect(() => {
        if (tipoCatastrofe === "Incendio") setImagenAlerta(IncendioIcon);
        if (tipoCatastrofe === "Terremoto") setImagenAlerta(TerremotoIcon);
        if (tipoCatastrofe === "Inundacion") setImagenAlerta(InundacionIcon);
        if (tipoCatastrofe === "Nevadas") setImagenAlerta(NevadasIcon);
        if (tipoCatastrofe === "Volcan") setImagenAlerta(VolcanIcon);

    }, []);


    return (
        <View style={CardStyles.card}>
            <Image style={CardStyles.image} source={imagenAlerta}></Image>
            <Text style={CardStyles.text}>{text}</Text>
        </View>
    );
}

const CardStyles = StyleSheet.create({
    card: {
        backgroundColor: '#0B172F',
        borderColor: 'black',
        borderWidth: 1,
        borderRadius: 15,
        borderColor: '#858585',
        alignContent: 'center',
        justifyContent: 'center',
        margin: 10,
        flexDirection: 'column',
        height: 115,
        aspectRatio: 1,

    },
    text: {
        marginTop: 10,
        fontWeight: '100',
        fontSize: 18,
        textAlign: 'center',
        textAlign: 'center',
        color: 'white',
    },
    image: {
        width: 48,
        height: 48,
        alignSelf: 'center',
    },
});

export default CardComponent;
