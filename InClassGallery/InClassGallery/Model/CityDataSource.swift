//
//  CityDataSource.swift
//  InClassGallery
//
//  Created by ping tseng tsai on 2018-06-04.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import Foundation

struct CityDataSource {
    var cities = [City]()
    var citiesByOrder = [City]()
    var provinces = [String]()
    var alphabets = [String]()
    
    init() {
        cities.append(City(id: 0, name: "Edmonton", province: "Alberta"))
        cities.append(City(id: 1, name: "Calgary", province: "Alberta"))
        cities.append(City(id: 2, name: "Vancouver", province: "British Columbia"))
        cities.append(City(id: 3, name: "Burnaby", province: "British Columbia"))
        cities.append(City(id: 4, name: "Richmond", province: "British Columbia"))
        cities.append(City(id: 5, name: "Surrey", province: "British Columbia"))
        cities.append(City(id: 6, name: "Toronto", province: "Ontario"))
        cities.append(City(id: 7, name: "Ottawa", province: "Ontario"))
        
        for city in cities {
            if !provinces.contains(city.province) {
                provinces.append(city.province)
            }
            
            let firstString = String(city.name[city.name.startIndex])
            if !alphabets.contains(firstString) {
                alphabets.append(firstString)
            }
        }
        alphabets = alphabets.sorted()
    }
    
    
    func numberOfSections(_ category: Int) -> Int {
        if category == 0 {
            return provinces.count
        } else {
            return alphabets.count
        }
    }
    
    func numberOfCitiesInSection(_ section: Int, _ category: Int) -> Int {
        let citiesInProvince = citiesForProvince(section, category)
        return citiesInProvince.count
    }
    
    func cellForItemAt(_ indexPath: IndexPath, _ category: Int) -> City {
        let citiesInProvince = citiesForProvince(indexPath.section, category)
        return citiesInProvince[indexPath.item]
    }
    
    func headerTitle(_ indexPath: IndexPath, _ category: Int) -> String {
        if category == 0 {
            return provinces[indexPath.section]
        } else {
            return alphabets[indexPath.section]
        }
    }
    
    mutating func deleteItemsAtIndexPaths(_ indexPaths: [IndexPath], _ category: Int){
        // TODO - changing data source
        var indices = [Int]()
        for indexPath in indexPaths {
            indices.append(absoluteIndexForIndexPath(indexPath, category))
        }
        var newCities = [City]()
        for (index, city) in cities.enumerated() {
            if !indices.contains(index) {
                newCities.append(city)
            }
        }
        cities = newCities
    }
    
    private func absoluteIndexForIndexPath(_ indexPath: IndexPath, _ category: Int) -> Int {
        var index = 0
        for i in 0..<indexPath.section {
            index += numberOfCitiesInSection(i, category)
        }
        index += indexPath.item
        return index
    }
    
    private func citiesForProvince(_ index: Int, _ category: Int) -> [City] {
        if category == 0 {
            let province = provinces[index]
            let citiesInProvince = cities.filter { $0.province == province }
            return citiesInProvince
        } else {
            let alphabet = alphabets[index]
            let citiesInProvince = cities.filter { String($0.name[$0.name.startIndex]) == alphabet }
            return citiesInProvince
        }
    }
}
