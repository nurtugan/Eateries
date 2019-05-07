//
//  EateryDetailViewController.swift
//  Eateries
//
//  Created by Nurtugan on 2/12/19.
//  Copyright © 2019 Nurtugan Nuraly. All rights reserved.
//

import UIKit

class EateryDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var mapButton: UIButton!
    
    var restaurant: Restaurant?
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        guard let svc = segue.source as? RateViewController else { return }
        guard let rating = svc.restRate else { return }
        rateButton.setImage(UIImage(named: rating), for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.hidesBarsOnSwipe = false
        
        // Self-sizing cells
        tableView.estimatedRowHeight = 38
        tableView.rowHeight = UITableView.automaticDimension
        // ends...
        
        // Frames to buttons
        let buttons = [rateButton, mapButton]
        
        for button in buttons {
            guard let button = button else { break }
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.white.cgColor
        }
        
//        rateButton.layer.cornerRadius = 5
//        rateButton.layer.borderWidth = 1
//        rateButton.layer.borderColor = UIColor.white.cgColor
//
//        mapButton.layer.cornerRadius = 5
//        mapButton.layer.borderWidth = 1
//        mapButton.layer.borderColor = UIColor.white.cgColor
        // ends...
        
        self.title = restaurant!.name
        navigationItem.largeTitleDisplayMode = .never
        
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(data: restaurant!.image! as Data)
        
//        tableView.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
//        tableView.separatorColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateryDetailTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.keyLabel.text = "Name:"
            cell.valueLabel.text = restaurant!.name
        case 1:
            cell.keyLabel.text = "Type:"
            cell.valueLabel.text = restaurant!.type
        case 2:
            cell.keyLabel.text = "Address:"
            cell.valueLabel.text = restaurant!.location
        case 3:
            cell.keyLabel.text = "Have I been here?"
            cell.valueLabel.text = restaurant!.isVisited ? "Yes" : "No"
        default:
            break
        }
//        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mapSegue" {
            let dvc = segue.destination as! MapViewController
            dvc.restaurant = self.restaurant
        }
    }
    

}
