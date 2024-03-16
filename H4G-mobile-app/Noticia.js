import { React, useRef, useState, useEffect } from 'react';
import { View, Image, Text, StyleSheet, TouchableHighlight, Animated, TouchableOpacity, TextInput, TouchableWithoutFeedback } from 'react-native';

import iconWarning from './assets/Alerta.png';
import iconFire from './assets/fire.png';
import iconFlood from './assets/flood.png';
import iconSnow from './assets/snow.png';


const Noticia = ({ id, tipo, title, description }) => {

    const [icon, setIcon] = useState(iconFire);
    const [desc, setDesc] = useState(description);
    const [tit, setTit] = useState(title);


    useEffect(() => {
        if (tipo === 1) {
            setIcon(iconFire);
        }
        if (tipo === 2) {
            setIcon(iconFlood);
        }
        if (tipo === 3) {
            setIcon(iconSnow);
        }


        // shorten the tittle if it is too long
        if (title.length > 15) {
            setTit(title.substring(0, 15) + "...");
        }

        // shorten the description if it is too long
        if (description.length > 60) {
            setDesc(description.substring(0, 60) + "...");
        }
    }, []);


    return (
        <View style={[styles.container]}>
            <Image source={icon} style={styles.image} />
            <View style={styles.right}>
                <Text style={styles.title}> {tit}</Text>
                <Text style={styles.status}> {desc}</Text>
            </View>
        </View >
    );
};

const styles = StyleSheet.create({
    container: {
        flexDirection: 'row',
        alignItems: 'center',
        backgroundColor: 'rgba(11, 23, 47, 0.26)',
        alignSelf: 'center',
        padding: 10,
        marginVertical: 5,
        borderRadius: 10,
        width: '85%',
    },
    image: {
        marginTop: 10,
        marginBottom: 10,
        width: 50,
        height: 70,
        borderRadius: 50,
    },
    right: {
        paddingLeft: 10,
        flexDirection: 'column',
        flex: 1,
    },
    title: {
        fontSize: 30,
        color: 'white',
        paddingBottom: 10,
    },
    status: {
        fontSize: 16,
        color: 'gray',
    },
});

export default Noticia;