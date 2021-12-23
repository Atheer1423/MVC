//
//  PeopleDetalVC.swift
//  MVC
//
//  Created by admin on 23/12/2021.
//

import UIKit

class PeopleDetailsVC: UIViewController {
 
    @IBOutlet weak var MassLabel: UILabel!
    @IBOutlet weak var BYLabel: UILabel!
    @IBOutlet weak var GenderLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    var personDetails : PersonDetails?
    override func viewDidLoad() {
        super.viewDidLoad()
       
        NameLabel.text = "Name: \( personDetails!.name)"
        GenderLabel.text = "Gender: \( personDetails!.gender)"
        BYLabel.text = "Birth year: \( personDetails!.BY)"
        MassLabel.text = "Mass: \( personDetails!.mass) "
       
    }
    


}
