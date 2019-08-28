//
//  Movie.swift
//  RefactorExample
//
//  Created by 张鹏宇 on 2019/8/28.
//  Copyright © 2019 Wanye1121. All rights reserved.
//

import UIKit

class Movie: NSObject {
    var priceCode: Int?
    var title: String?
    
    static let CHILDRENS = 2
    static let REGULAR = 0
    static let NEW_RELEASE = 1
    
    init(title: String, priceCode: Int) {
        self.priceCode = priceCode
        self.title = title
    }

    func getPriceCode() -> Int {
        guard let priceCode = self.priceCode  else {
            return 0
        }
        return priceCode
    }
    
    func setPriceCode(arg: Int) {
        self.priceCode = arg
    }
    
    func getTitle() -> String {
        guard let title = self.title  else {
            return ""
        }
        return title
    }
}
