

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    
    var restaurants:[Restaurant] = [        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong           Kong", image: "cafedeadend", isVisited: false),
                                            Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei", isVisited: false),
                                            Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha", isVisited: false),
                                            Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl", isVisited: false),
                                            Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster", isVisited: false),
                                            Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkeerestaurant", isVisited: false),
                                            Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier", isVisited: false),
                                            Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", image: "bourkestreetbakery", isVisited: false),
                                            Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "haighschocolate", isVisited: false),
                                            Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palominoespresso", isVisited: false),
                                            Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate", isVisited: false),
                                            Restaurant(name: "Traif", type: "American", location: "New York", image: "traif", isVisited: false),
                                            Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "grahamavenuemeats", isVisited: false),
                                            Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "wafflewolf", isVisited: false),
                                            Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves", isVisited: false),
                                            Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore", isVisited: false),
                                            Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "confessional", isVisited: false),
                                            Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "barrafina", isVisited: false),
                                            Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia", isVisited: false),
                                            Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak", isVisited: false),
                                            Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "caskpubkitchen", isVisited: false)]
    
    var restaurantVisited = Array(repeating: false, count: 21)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.cellLayoutMarginsFollowReadableWidth = true
        
        navigationController?.navigationBar.prefersLargeTitles = true

    }

    // MARK: - TableView Datasource Methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
        
        // Configure the cell...
        cell.nameLabel.text = restaurants[indexPath.row].name
        cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)
        cell.locationLabel.text = restaurants[indexPath.row].location
        cell.typeLabel.text = restaurants[indexPath.row].type
        
    
        // cell.accessoryType =  restaurantVisited[indexPath.row] ? .checkmark : .none
        cell.heartImageView.isHidden = restaurants[indexPath.row].isVisited ? false : true
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
//        
//        if let popoverController = optionMenu.popoverPresentationController {
//            if let cell = tableView.cellForRow(at: indexPath) {
//                popoverController.sourceView = cell
//                popoverController.sourceRect = cell.bounds
//            }
//        }
//
//
//         //ALERT ACTION 1
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//
//        optionMenu.addAction(cancelAction)
//
//
//
//        let callActionHandler = { (action:UIAlertAction!) -> Void in
//
//            let alertMessage = UIAlertController(title: "Service Unavialable", message: "Sorry the call feature is not available yet. Please retry later", preferredStyle: .alert)
//
//            alertMessage.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//
//            self.present(alertMessage, animated: true, completion: nil)
//
//        }
//
//
//        //ALERT ACTION 2
//        let callAction = UIAlertAction(title: "Call " + "123-000\(indexPath.row)", style: .default, handler: callActionHandler)
//        optionMenu.addAction(callAction)
//
//
//         //ALERT ACTION 3
//        let checkActionTitle = (restaurantVisited[indexPath.row]) ? "Undo Check In" : "Check In"
//
//        let checkInAction = UIAlertAction(title: checkActionTitle, style: .default, handler: { (action:UIAlertAction!) -> Void in
//
//            let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
//            self.restaurantVisited[indexPath.row] = (self.restaurantVisited[indexPath.row]) ? false : true
//
//            cell.heartImageView.isHidden = self.restaurantVisited[indexPath.row] ? false : true
//            })
//
//        optionMenu.addAction(checkInAction)
//
//        present(optionMenu, animated: true, completion: nil)
//
//        tableView.deselectRow(at: indexPath, animated: true)
//
//    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
            
                        self.restaurants.remove(at: indexPath.row)
            
                        tableView.deleteRows(at: [indexPath], with: .fade)
            
                        completionHandler(true)
        }
        
        
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceView, completionHandle) in
            
            let defaultText = "Just checking in at " + self.restaurants[indexPath.row].name
            
            //let activityController =  UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            
            let activityController: UIActivityViewController
            
            if let imageToShare = UIImage(named: self.restaurants[indexPath.row].image) {
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
    
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
        
        let checkInAction = UIContextualAction(style: .normal, title: "Check In") { (action, sourceView, completionHandle) in
    
            self.restaurantVisited[indexPath.row] = (self.restaurantVisited[indexPath.row]) ? false : true
            
            cell.heartImageView.isHidden = self.restaurantVisited[indexPath.row] ? false : true
            
        }
    
        if cell.heartImageView.isHidden == false {
            checkInAction.image = UIImage(named: "undo")
            cell.heartImageView.isHidden = true
        } else {
            checkInAction.image = UIImage(named: "tick")
        }
        
        checkInAction.backgroundColor = UIColor.blue
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [checkInAction])
        return swipeConfiguration
        
        }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationVC = segue.destination as! RestaurantDetailViewController
                    destinationVC.restaurantImageName = restaurants[indexPath.row].image
                    destinationVC.nameLabel = restaurants[indexPath.row].name
                    destinationVC.typeLabel = restaurants[indexPath.row].type
                    destinationVC.locationLabel = restaurants[indexPath.row].location
                
                }
            }
            
        }
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
    
    


