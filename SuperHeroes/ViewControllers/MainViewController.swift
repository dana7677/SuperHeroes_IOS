//
//  ViewController.swift
//  SuperHeroes
//
//  Created by Tardes on 18/12/24.
//

import UIKit

class MainViewController: UIViewController,UITableViewDataSource,UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var list:[DataHero] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
                
                let searchController = UISearchController(searchResultsController: nil)
                searchController.searchBar.delegate = self
                navigationItem.searchController = searchController
                
                findSuperheroBy(name: "a")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath) as! SuperHeroViewCell
        let nameHero = list[indexPath.item]
        cell.render(nameHero)
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let detailViewController = segue.destination as! DetailViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let superhero = list[indexPath.row]
            detailViewController.superHeroe = superhero
            tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
           if let query = searchBar.text {
               findSuperheroBy(name: query)
           } else {
               findSuperheroBy(name: "a")
           }
    }

    
    func findSuperheroBy(name: String) {
            Task {
                do {
                    list = try await SuperHeroeProvider.findSuperheroesBy(name: name)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print(error)
                }
            }
        }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        findSuperheroBy(name: "a")
    }

}

