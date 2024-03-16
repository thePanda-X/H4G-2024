import React, { useEffect, useState } from 'react';
import { View, TextInput, Button, FlatList, Text, TouchableOpacity, ScrollView } from 'react-native';
import Header2 from './Header2';
import StylesMapScreen from './StylesMapScreen';

import SavedLocation from './SavedLocation';


const SearchComponent = () => {

    const loadedComponents = [
        { id: '1', title: 'Madrid', status: 0, time: 0, hazzard: 'Incendio' },
        { id: '2', title: 'Barcelona', status: 1, time: 9, hazzard: 'Inundacion' },
        { id: '3', title: 'Sevilla', status: 0, time: 0, hazzard: 'Incendio' },
        { id: '4', title: 'Málaga', status: 0, time: 0, hazzard: 'Incendio' },
    ];

    const [filteredComponents, setFilteredComponents] = useState(loadedComponents);

    const searchFilter = (text) => {
        if (text) {
            const newData = loadedComponents.filter((item) => {
                //ignore case and accent
                const itemData = item.title.toUpperCase();
                const textData = text.toUpperCase();

                return itemData.indexOf(textData) > -1;
            });
            setFilteredComponents(newData);
        } else {
            setFilteredComponents(loadedComponents);
        }
    };

    return (
        <View style={StylesMapScreen.container}>
            <Header2 name={"Mis Regiones"} filterMethod={searchFilter} />
            <ScrollView>
                {filteredComponents.map((item) => (
                    <SavedLocation
                        key={item.id}
                        id={item.id}
                        title={item.title}
                        status={item.status}
                        time={item.time}
                        hazzard={item.hazzard}
                    />
                ))}
            </ScrollView>

        </View>
    );
};

export default SearchComponent;
