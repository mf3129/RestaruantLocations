//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Makan Fofana on 1/5/19.
//  Copyright © 2019 Makan Fofana. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    
    var restaurant = Restaurant()
    
    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var nameLabels: UILabel!
    @IBOutlet weak var typeLabels: UILabel!
    @IBOutlet weak var locationLabels: UILabel!
    
    
    
    var restaurantImageName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantImageView.image = UIImage(named: restaurantImageName)
        navigationItem.largeTitleDisplayMode = .never
        // Do any additional setup after loading the view.
        nameLabels.text = restaurant.name
        typeLabels.text = restaurant.type
        locationLabels.text = restaurant.location
        
        navigationItem.largeTitleDisplayMode = .never
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
