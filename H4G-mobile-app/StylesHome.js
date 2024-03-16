import { StyleSheet } from 'react-native';

const blue1 = 'rgb(47, 53, 66)';
const blue2 = '(rgba(11, 23, 47, 0.26))';
const orange1 = 'rgb(255, 199, 55)';
const StylesHome = StyleSheet.create({
    container: {
        height: '100%',

        backgroundColor: blue1,
    },
    Status: {
        alignContent: 'center',
        alignItems: 'center',
        justifyContent: 'center',
        flexDirection: 'column',
        width: '100%',
    },
    StatusText: {
        fontSize: 20,
        fontWeight: 'bold',
        textAlign: 'center',
        color: 'white',
        fontWeight: '100',
    },
    ScrollView: {
        paddingLeft: 30,
    },
    StatusIcon:
    {
        width: 150,
        alignSelf: 'center',
    },
    BackCircle: {
        width: 250,
        height: 250,
        borderRadius: 10000,
        backgroundColor: blue2,
        position: 'absolute',
        alignSelf: 'center',
        verticalAlign: 'center',
        alignItems: 'center',
        justifyContent: 'center',
    },
    IconCircleWrapper: {
        width: 200,
        height: 200,
        alignSelf: 'center',
        verticalAlign: 'center',
        alignItems: 'center',
        justifyContent: 'center',
        marginBottom: 20,
    },
    AlertIcon: {

        position: 'absolute',
        top: 0,
        right: 10,

        width: 70,
        height: 70,
    },
    StatusTitle: {
        fontSize: 25,
        fontWeight: '200',
        textAlign: 'center',
        marginTop: 20,
        color: 'white',
    },
    descriptionWrapper: {
        width: '70%',
        marginTop: 20,
        marginBottom: 20,
    },
    timeBox: {
        color: 'black',
        backgroundColor: orange1,
        padding: 10,
        borderRadius: 10,
        marginBottom: 20,
    },
    timeBoxText: {
        color: blue1,
        fontSize: 20,
    },
    proximas: {
        marginTop: 20,
        textAlign: 'right',
        fontSize: 18,
        marginRight: 20,
        color: 'white',
    },

});

export default StylesHome;