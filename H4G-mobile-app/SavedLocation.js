import { React, useRef, useState, useEffect } from 'react';
import { View, Image, Text, StyleSheet, TouchableHighlight, Animated, TouchableOpacity, TextInput, TouchableWithoutFeedback } from 'react-native';

import iconWarning from './assets/Alerta.png';
import iconCheck from './assets/Check.png';

const SavedLocation = ({ id, title, status, time, hazzard }) => {

    if (status === 1) {
        //mal
        return (
            <View style={[styles.container]}>
                <Image source={iconWarning} style={styles.image} />
                <View style={styles.right}>
                    <Text style={styles.title}>{title}</Text>
                    <Text style={styles.status}>{hazzard} en {time} dias</Text>
                </View>
            </View >
        );
    } else {
        //bien  
        return (
            <View style={[styles.container, { backgroundColor: 'rgba(11, 23, 47, 0.26)', }]}>
                <Image source={iconCheck} style={[styles.image, { tintColor: '#fff', height: 60, width: 50, marginRight: 10 }]} />
                <View style={styles.right}>
                    <Text style={[styles.title, { color: 'white' }]}>{title}</Text>
                    <Text style={[styles.status, { color: '#FFC737' }]}>Sin incidentes</Text>
                </View>
            </View>
        );

    }

};

const styles = StyleSheet.create({
    container: {
        zIndex: 1,
        flexDirection: 'row',
        padding: 30,
        justifyContent: 'space-between',
        backgroundColor: "#FFC737",
        width: '85%',
        height: 90,
        borderRadius: 16,
        alignSelf: 'center',
        margin: 10
    },

    image: {
        width: 60, // 'auto
        height: 60,
        alignSelf: 'center',
        tintColor: '#0B172F',
    },


    left: {
        flex: 1,
        justifyContent: 'center'
    },
    right: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'flex-start',
        marginLeft: 10,

    },
    title: {
        fontSize: 30,
        textAlign: 'center',
        letterSpacing: 2,
    },
    status: {
        paddingTop: 5,
        fontSize: 16,
        color: '#666',
        textAlign: 'center',
    },
    time: {
        fontSize: 16,
        color: '#666'
    }
});


export default SavedLocation;