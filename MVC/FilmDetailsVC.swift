//
//  FilmDetailsVC.swift
//  MVC
//
//  Created by admin on 23/12/2021.
//

import UIKit

class FilmDetailsVC: UIViewController {
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var ReleaseDataLabel: UILabel!
    @IBOutlet weak var DirectorLabel: UILabel!
    @IBOutlet weak var OpeningCrawl: UILabel!
    var filmDetails:FilmDetails?
    override func viewDidLoad() {
        super.viewDidLoad()
        TitleLabel.text = "Title: \((String(describing: filmDetails!.title) )) "
        ReleaseDataLabel.text = "Release data: \(String(describing: filmDetails!.ReleaseData))"
        DirectorLabel.text = "Director: \(String(describing: filmDetails!.director))"
        OpeningCrawl.text = "Opening crwl: \(String(describing: filmDetails!.OpeningCrawl))"
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
