//
//  ViewController.swift
//  MVC
//
//  Created by admin on 23/12/2021.
//

import UIKit

class ViewController: UITableViewController {
    var people:[PersonDetails] = []
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        StarWarsModel.getAllPeople(completionHandler: { // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
                   data, response, error in
                       do {
                           // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                           if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                               if let results = jsonResult["results"] as? NSArray {
                                   for person in results {
                                       let personDict = person as! NSDictionary
                                       self.people.append(PersonDetails(name: personDict["name"] as! String, gender: personDict["gender"] as! String, BY: personDict["birth_year"] as! String, mass: personDict["mass"] as! String ))
                                   }
                               }
                           }
                           DispatchQueue.main.async {
                               self.tableView.reloadData()
                           }
                       } catch {
                           print("Something went wrong")
                       }
               })    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = people[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "ToPeopleDetails", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! PeopleDetailsVC
        destination.personDetails = people[index]
    }

}

struct PersonDetails {
    var name :String
    var gender : String
    var BY :String
    var mass:String
}

struct FilmDetails {
    var title :String
    var ReleaseData : String
    var director :String
    var OpeningCrawl:String
}

