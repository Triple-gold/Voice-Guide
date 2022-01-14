//
//  LocationListViewController.swift
//  Voice Guide
//
//  Created by YU FU YAM on 14/1/2022.
//

import UIKit

class LocationListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var tableView:UITableView!
    
    var info = ["Chungking Mansions", "Hong Kong Clock Tower","Tian Tan Buddha",
                "Wong Tai Sin Temple", "Hong Kong Disneyland", "Lan Kwai Fong", "Tai O Fishing Village",  "Avenue Of Stars", "Cheung Shan Monastery", "Tang Kwong U Ancestral Hall", "Island House","Rock Carving on Kau Sai Chau"]
    
    var locationNumber: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Hong Kong Location"
        self.view.backgroundColor = UIColor.white
        tableView = UITableView(frame:CGRect(x:0, y:0, width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height))
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    // table cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "CellIdentifier")
        cell.textLabel?.text = info[indexPath.row]
        return cell
    }
    
    // table cell Chick Hadnle
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            locationNumber = 1;
            performSegue(withIdentifier: "goLocationDetail", sender: locationNumber)
            break
        case 1:
            locationNumber = 2;
            performSegue(withIdentifier: "goLocationDetail", sender: locationNumber)
            break
        case 2:
            locationNumber = 3;
            performSegue(withIdentifier: "goLocationDetail", sender: locationNumber)
            break
        case 3:
            locationNumber = 4;
            performSegue(withIdentifier: "goLocationDetail", sender: locationNumber)
            break
        case 4:
            locationNumber = 5;
            performSegue(withIdentifier: "goLocationDetail", sender: locationNumber)
            break
        case 5:
            locationNumber = 6;
            performSegue(withIdentifier: "goLocationDetail", sender: locationNumber)
            break
        case 6:
            locationNumber = 7;
            performSegue(withIdentifier: "goLocationDetail", sender: locationNumber)
            break
        case 7:
            locationNumber = 8;
            performSegue(withIdentifier: "goLocationDetail", sender: locationNumber)
            break
        case 8:
            locationNumber = 9;
            performSegue(withIdentifier: "goLocationDetail", sender: locationNumber)
            break
        case 9:
            locationNumber = 10;
            performSegue(withIdentifier: "goLocationDetail", sender: locationNumber)
            break
        case 10:
            locationNumber = 11;
            performSegue(withIdentifier: "goLocationDetail", sender: locationNumber)
            break
        case 11:
            locationNumber = 12;
            performSegue(withIdentifier: "goLocationDetail", sender: locationNumber)
            break
        default:
            break
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goLocationDetail"{
            let controller = segue.destination as! LocationDetailViewController
            controller.locationNumber = sender as? Int
        }
    }
}

