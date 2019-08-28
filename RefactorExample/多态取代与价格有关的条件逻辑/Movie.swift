//
//  Movie.swift
//  RefactorExample
//
//  Created by 张鹏宇 on 2019/8/28.
//  Copyright © 2019 Wanye1121. All rights reserved.
//

import UIKit

class Movie {
    var price: Price?
    var title: String?
    
    static let CHILDRENS = 2
    static let REGULAR = 0
    static let NEW_RELEASE = 1
    
    init(title: String, priceCode: Int) {
        setPriceCode(arg: priceCode)
        self.title = title
    }

    func getPriceCode() -> Int {
        return price?.getPriceCode() ?? 0
    }
    
    func setPriceCode(arg: Int) {
        switch arg {
        case Movie.REGULAR:
            price = RegularPrice()
        case Movie.CHILDRENS:
            price = ChildrenPrice()
        case Movie.NEW_RELEASE:
            price = NewReleasePrice()
        default:
            break
        }
    }
    
    func getTitle() -> String {
        guard let title = self.title  else {
            return ""
        }
        return title
    }
    
    func getCharge(daysRented: Int) -> Double {
        return price?.getCharge(daysRented: daysRented) ?? 0
    }
    
    func getFrequentRenterPoint(daysRented: Int) -> Int {
        if getPriceCode() == Movie.NEW_RELEASE && daysRented > 1{
            return 2
        } else {
            return 1
        }
    }
}
