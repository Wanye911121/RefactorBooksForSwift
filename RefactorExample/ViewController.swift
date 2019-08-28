//
//  ViewController.swift
//  RefactorExample
//
//  Created by 张鹏宇 on 2019/8/28.
//  Copyright © 2019 Wanye1121. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let cutomer = Customer(name: "zpy")
        cutomer.addRental(arg: Rental(movie: Movie(title: "zzz", priceCode: Movie.REGULAR), daysRented: 1))
        cutomer.addRental(arg: Rental(movie: Movie(title: "lll", priceCode: Movie.NEW_RELEASE), daysRented: 4))
        print("\(cutomer.getName()) statement: \(cutomer.statement())")
    }


}

