//
//  FilmsTableView.swift
//  MVC
//
//  Created by admin on 23/12/2021.
//

import UIKit

class FilmsTableView: UITableViewController {
    var films :[FilmDetails] = []
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        StarWarsModel.getAllFilms(completionHandler: { // passing what becomes "completionHandler" in the 'getAllFilms' function definition in StarWarsModel.swift
                   data, response, error in
                       do {
                           // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                           if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                               if let results = jsonResult["results"] as? NSArray {
                                   for film in results {
                                       let filmDict = film as! NSDictionary
                                       self.films.append(FilmDetails(title:filmDict["title"]! as! String, ReleaseData: filmDict["release_date"]! as! String, director: filmDict["director"]! as! String, OpeningCrawl: filmDict["opening_crawl"]! as! String) )
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
        films.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = films[indexPath.row].title
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "ToFilmsDetails", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! FilmDetailsVC
        destination.filmDetails = films[index]
    }
}
