import React from 'react';
import { View, Image, Text, StyleSheet, TouchableHighlight } from 'react-native';

import ajustes from './assets/Puntos.png';

const Header = ({ isLogout = "true", onGoBack = () => { console.log("default go back method") }, userObject }) => {

    return (
        <View style={styles.header}>
            <TouchableHighlight style={{ borderRadius: 5, }} underlayColor='rgba(20,20,20,0.05)' onPress={() => { onGoBack(); }}>
                <View style={styles.leftContent}>
                    <Image source={ajustes} style={styles.sideImage} />
                </View>
            </TouchableHighlight>

            <TouchableHighlight style={{ borderRadius: 5, }} underlayColor='rgba(20,20,20,0.05)' onPress={() => { /* Handle right press */ }}>
                <View style={styles.rightContent}>
                    <Text style={styles.sideText}>Navarra</Text>
                </View>
            </TouchableHighlight>
        </View>
    );
};


const styles = StyleSheet.create({
    header: {
        flexDirection: 'row',
        justifyContent: 'space-between',
        alignItems: 'center',
        paddingTop: 20,
        backgroundColor: 'transparent',
        marginTop: 20,
        height: '14%',
        margin:20,
    },
    leftContent: {
        flexDirection: 'column',
        alignItems: 'center',
        backgroundColor: 'transparent',
    },
    rightContent: {
        flexDirection: 'column',
        alignItems: 'center',
        backgroundColor: 'transparent',
    },
    sideImage: {
        width: 40,
        height: 40,
        alignSelf: 'center',
        tintColor: '#fff',
    },
    sideText: {
        fontSize: 24,
        textAlign: 'center',
        backgroundColor: 'transparent',
        color: '#fff',
    },
    logoImage: {
        width: 80,
        height: 80,
        marginBottom: 20, // Adjust spacing
    }
});

export default Header;
