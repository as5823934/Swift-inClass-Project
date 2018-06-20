//
//  PhotoCategory.swift
//  PhotoGallery
//
//  Created by ping tseng tsai on 2018-05-30.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import Foundation

struct  PhotoCategory {
    var CategoryImageName: String
    var title: String
    var imageNames: [String]
    
    
    static func fetch() -> [PhotoCategory] {
        var categories = [PhotoCategory]()
        let phtotData = PhotosLibrary.downloadPhotosData()
        
        for (categoryName, dict) in phtotData {
            if let dict = dict as? [String : Any] {
                let categoryImageName = dict["categoryImageName"] as! String
                if let imageNames = dict["imageNames"] as? [String] {
                    let newCategory = PhotoCategory(CategoryImageName: categoryImageName, title: categoryName, imageNames: imageNames)
                    categories.append(newCategory)
                }
            }
        }
        return categories
    }
}

class PhotosLibrary
{
    static func downloadPhotosData() -> [String : Any]
    {
        return [
            
            "Car" : [
                "categoryImageName" : "car",
                "imageNames" : PhotosLibrary.generateImage(categoryPrefix: "c", numberOfImages: 6),
            ],
            "Family" : [
                "categoryImageName" : "family",
                "imageNames" : PhotosLibrary.generateImage(categoryPrefix: "f", numberOfImages: 5),
            ],
            "Foods" : [
                "categoryImageName" : "foods",
                "imageNames" : PhotosLibrary.generateImage(categoryPrefix: "fo", numberOfImages: 7),
            ],
            "Travel" : [
                "categoryImageName" : "travel",
                "imageNames" : PhotosLibrary.generateImage(categoryPrefix: "t", numberOfImages: 5),
            ],
            "Nature" : [
                "categoryImageName" : "nature",
                "imageNames" : PhotosLibrary.generateImage(categoryPrefix: "n", numberOfImages: 5),
            ]
        ]
    }
    
    private class func generateImage(categoryPrefix: String, numberOfImages: Int) -> [String] {
        var imageNames = [String]()
        
        for i in 1...numberOfImages {
            imageNames.append("\(categoryPrefix)\(i)")
        }
        
        return imageNames
    }
}

