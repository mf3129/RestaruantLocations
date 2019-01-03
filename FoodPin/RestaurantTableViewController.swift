

import UIKit

class RestaurantTableViewController: UITableViewController {

    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "caskpubkitchen"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    var restaurantVisited = Array(repeating: false, count: 21)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.cellLayoutMarginsFollowReadableWidth = true

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
        
        // Configure the cell...
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
    
        // cell.accessoryType =  restaurantVisited[indexPath.row] ? .checkmark : .none
        cell.heartImageView.isHidden = restaurantVisited[indexPath.row] ? false : true
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        
        if let popoverController = optionMenu.popoverPresentationController {
            if let cell = tableView.cellForRow(at: indexPath) {
                popoverController.sourceView = cell
                popoverController.sourceRect = cell.bounds
            }
        }
        
        
         //ALERT ACTION 1
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        optionMenu.addAction(cancelAction)
        
        
        
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            
            let alertMessage = UIAlertController(title: "Service Unavialable", message: "Sorry the call feature is not available yet. Please retry later", preferredStyle: .alert)
            
            alertMessage.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alertMessage, animated: true, completion: nil)
            
        }
        
        
        //ALERT ACTION 2
        let callAction = UIAlertAction(title: "Call " + "123-000\(indexPath.row)", style: .default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        
         //ALERT ACTION 3
        let checkActionTitle = (restaurantVisited[indexPath.row]) ? "Undo Check In" : "Check In"
        
        let checkInAction = UIAlertAction(title: checkActionTitle, style: .default, handler: { (action:UIAlertAction!) -> Void in
            
            let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
            self.restaurantVisited[indexPath.row] = (self.restaurantVisited[indexPath.row]) ? false : true
            
            })
        
        optionMenu.addAction(checkInAction)
        
        present(optionMenu, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
            
                        self.restaurantNames.remove(at: indexPath.row)
                        self.restaurantLocations.remove(at: indexPath.row)
                        self.restaurantImages.remove(at: indexPath.row)
                        self.restaurantTypes.remove(at: indexPath.row)
                        self.restaurantVisited.remove(at: indexPath.row)
            
                        tableView.deleteRows(at: [indexPath], with: .fade)
            
                        completionHandler(true)
        }
        
        
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceView, completionHandle) in
            
            let defaultText = "Just checking in at " + self.restaurantNames[indexPath.row]
            
            //let activityController =  UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            
            let activityController: UIActivityViewController
            
            if let imageToShare = UIImage(named: self.restaurantImages[indexPath.row]) {
                activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
            } else {
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
            
            //PopoverView Controller For The iPad
            if let popoverController = activityController.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath) {
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
                }
            }
            
            self.present(activityController, animated: true, completion: nil)
            completionHandle(true)
            
        }
        
        deleteAction.backgroundColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        deleteAction.image = UIImage(named: "delete")
        
        shareAction.backgroundColor = UIColor(red: 254.0/255.0, green: 149.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        shareAction.image = UIImage(named: "share")
        
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction,  shareAction])
        
        return swipeConfiguration

    }
    
    
    
    
    
    //Deletion Of The Cell
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//
//        if editingStyle == .delete {
//            restaurantNames.remove(at: indexPath.row)
//            restaurantLocations.remove(at: indexPath.row)
//            restaurantImages.remove(at: indexPath.row)
//            restaurantTypes.remove(at: indexPath.row)
//            restaurantVisited.remove(at: indexPath.row)
//                }
//
//            tableView.deleteRows(at: [indexPath], with: .fade)
//
//        print("\(restaurantNames.count)")
//            for name in restaurantNames {
//                print(name)
//            }
//    }
    
    

}
