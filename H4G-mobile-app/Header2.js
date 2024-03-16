import { React, useRef, useState, useEffect } from 'react';
import { View, Image, Text, StyleSheet, TouchableHighlight, Animated, TouchableOpacity, TextInput, TouchableWithoutFeedback } from 'react-native';

import ajustes from './assets/Puntos.png';
import lupa from './assets/Lupa.png';

const Header2 = ({ name, filterMethod }) => {

    const [textInputShown, setTextInputShown] = useState(false);
    const AnimatedTextInput = useRef(new Animated.Value(0)).current;
    const textInput = useRef(null);


    useEffect(() => {
        Animated.timing(AnimatedTextInput, {
            toValue: textInputShown ? 1 : 0,
            duration: 500,
            useNativeDriver: false,
        }).start();

        //focus on text input
        if (textInputShown && textInput.current) {
            textInput.current.focus();
        }


    }, [textInputShown]);


    const animatedTextStyle = {
        width: AnimatedTextInput.interpolate({
            inputRange: [0, 1],
            outputRange: [0, 315],
        }),
        paddingLeft: AnimatedTextInput.interpolate({
            inputRange: [0, 1],
            outputRange: [0, 15],
        }),
    };
    const animatedImageStyle = {
        tintColor: AnimatedTextInput.interpolate({
            inputRange: [0, 1],
            outputRange: ['#fff', '#000']
        })
    };

    const animatedTittle = {
        color: AnimatedTextInput.interpolate({
            inputRange: [0, 1],
            outputRange: ['#fff', '#000']
        })
    }


    return (
        <>
            <View style={styles.header}>

                <TouchableHighlight style={{ borderRadius: 5, }} underlayColor='rgba(20,20,20,0.05)' onPress={() => { }}>
                    <View style={styles.leftContent}>
                        <Image source={ajustes} style={styles.sideImage} />
                    </View>
                </TouchableHighlight>

                <Animated.Text style={[styles.title, animatedTittle]}>{name}</Animated.Text>

                <TouchableOpacity style={{ borderRadius: 5, }} underlayColor='rgba(20,20,20,0.05)' disabled={textInputShown} onPress={() => { setTextInputShown(true) }}>
                    <Animated.Image source={lupa} style={[styles.sideImage2, animatedImageStyle]} />
                    < Animated.View style={[styles.textWrapper, animatedTextStyle]}>
                        {textInputShown && <TextInput style={styles.textStyle}
                            onBlur={() => { setTextInputShown(false) }}
                            ref={textInput}
                            placeholder="Buscar..."
                            onChangeText={(text) => { filterMethod(text) }}
                        />}
                    </Animated.View>

                </TouchableOpacity>
            </View >
        </>
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
        margin: 20,
        marginBottom: 0,
        //align center vertically
        verticalAlign: 'middle',
        alignItems: 'center',


    },
    leftContent: {
        flexDirection: 'column',
        alignItems: 'center',
        backgroundColor: 'transparent',
    },
    title: {
        fontSize: 24,
        textAlign: 'center',
        backgroundColor: 'transparent',
        color: '#fff',
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
    sideImage2: {
        width: 30,
        height: 30,
        alignSelf: 'center',
        tintColor: '#fff',
        zIndex: 1,
        marginRight: 10,
        marginTop: 5,
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
    },
    textStyle: {
        width: '100%'
    },
    textWrapper: {
        position: 'absolute',
        backgroundColor: 'white',
        justifyContent: 'center',
        alignItems: 'center',
        alignSelf: 'center',
        verticalAlign: 'middle',
        alignItems: 'center',
        justifyContent: 'center',
        borderRadius: 22,
        height: 40,
        right: 0,
        fontSize: 20,
    },
});

export default Header2;
