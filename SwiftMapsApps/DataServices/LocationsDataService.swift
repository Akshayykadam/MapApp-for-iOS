//
//  LocationsDataService.swift
//  MapTest
//
//  Created by Nick Sarno on 11/26/21.
//

import Foundation
import MapKit

class LocationsDataService {
    
    static let locations: [Location] = [
        Location(
            name: "Shaniwar Wada",
            cityName: "Pune",
            coordinates: CLLocationCoordinate2D(latitude: 18.51980, longitude: 73.85537),
            description: "Shaniwar Wada is a historical fortification in the city of Pune, India. Built in 1732, it was the great seat of the Peshwas of the Maratha Empire until 1818. Following the rise of the Maratha Empire, the palace became the center of Indian politics in the 18th century. The fort itself was largely destroyed in 1828 by an unexplained fire, but the surviving structures are now maintained as a tourist site.",
            imageNames: [
                "ShaniwarWada",
                "ShaniwarWada_2",
                "ShaniwarWada_1",
                
            ],
            link: "https://en.wikipedia.org/wiki/Shaniwar_Wada"),
        
        Location(
            name: "Aga Khan Palace",
            cityName: "Pune",
            coordinates: CLLocationCoordinate2D(latitude: 18.55248, longitude: 73.90147),
            description: "Built by Sultan Muhammed Shah Aga Khan III in 1892, this palace holds significant historical importance as it served as a prison for Mahatma Gandhi and his wife during the Indian independence movement.",
            imageNames: [
                "AgaKhanPalace",
                "AgaKhanPalace_1",
                "AgaKhanPalace_3",

            ],
            link: "https://en.wikipedia.org/wiki/Aga_Khan_Palace"),
        
        Location(
            name: "Sinhagad Fort",
            cityName: "Pune",
            coordinates: CLLocationCoordinate2D(latitude: 18.36593, longitude: 73.75557),
            description: "Located atop a hill, Sinhagad Fort offers breathtaking views of the surrounding landscape. It's a popular trekking destination and a place of historical importance due to its association with Maratha history.",
            imageNames: [
                "SinhagadFort_1",
                "SinhagadFort",
                "SinhagadFort_2",
            ],
            link: "https://en.wikipedia.org/wiki/Sinhagad"),
        
        Location(
            name: "Dagdusheth Ganapati",
            cityName: "Pune",
            coordinates: CLLocationCoordinate2D(latitude: 18.51650, longitude: 73.85608),
            description: "Dedicated to Lord Ganesha, this temple is one of the most revered in Pune. It's particularly famous for its elaborate celebrations during the Ganesh Chaturthi festival.",
            imageNames: [
                "DagdushethTemple",
                "DagdushethTemple_1",
            ],
            link: "https://en.wikipedia.org/wiki/Dagadusheth_Halwai_Ganapati_Temple"),
        
        Location(
            name: "Shinde Chhatri",
            cityName: "Pune",
            coordinates: CLLocationCoordinate2D(latitude: 18.49167, longitude: 73.89722),
            description: "This memorial dedicated to Mahadji Shinde, a commander in the Maratha army, is renowned for its architecture and intricate carvings. It's a peaceful spot for reflection and offers insights into Pune's rich history",
            imageNames: [
                "ShindeChhatri",
                "ShindeChhatri_1",
                "ShindeChhatri_3",
            ],
            link: "https://en.wikipedia.org/wiki/Shinde_Chhatri"),
        
        Location(
            name: "Raja Dinkar Kelkar Museum",
            cityName: "Pune",
            coordinates: CLLocationCoordinate2D(latitude: 18.51072, longitude: 73.85441),
            description: "Founded by Dr. Dinkar G. Kelkar in memory of his son, this museum houses an impressive collection of artifacts and cultural items, including ancient Indian utensils, musical instruments, and sculptures.",
            imageNames: [
                "KelkarMuseum",
                "KelkarMuseum_1",
                "KelkarMuseum_2",
            ],
            link: "https://en.wikipedia.org/wiki/Raja_Dinkar_Kelkar_Museum"),
    ]
    
}
