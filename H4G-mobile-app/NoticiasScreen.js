import { React, useState } from 'react';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { NavigationContainer } from '@react-navigation/native';
import { View, Text, ScrollView } from 'react-native';
import StyleNoticias from './StylesNoticias';
import Header2 from './Header2';

import Noticia from './Noticia';

export default function NoticiasScreen() {

    const loadedComponents = [
        { id: '1', type: 1, title: 'Incendio en Valencia', description: "Un incendio en Valencia ha dejado a 10 personas sin hogar" },
        { id: '2', type: 2, title: 'Inundaciones en el delta del Ebro', description: "Las inundaciones en el delta del Ebro han dejado a 20 personas sin hogar" },
        { id: '3', type: 1, title: 'Halladas diez personas...', description: "Halladas diez personas sin vida en un piso de Barcelona" },
        { id: '4', type: 3, title: 'Terrible nevada en Orense', description: "Un terrible incendio en Orense ha dejado a 10 personas sin hogar" },
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

        if(text === ''){
            setFilteredComponents(loadedComponents);
        }
    };

    return (
    
        <View style={StyleNoticias.container}>
            <Header2 name={"Noticias"} filterMethod={searchFilter} />
            <ScrollView>
                {filteredComponents.map((item) => (
                    <Noticia
                        key={item.id}
                        id={item.id}
                        tipo={item.type}
                        title={item.title}
                        description={item.description}
                    />
                ))}
            </ScrollView>

        </View>
    );

}