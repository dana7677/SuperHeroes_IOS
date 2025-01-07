//
//  ViewController.swift
//  SuperHeroes
//
//  Created by Tardes on 18/12/24.
//

import UIKit

class MainViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UISearchBarDelegate,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var list:[DataHero] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
            collectionView.dataSource = self
            collectionView.delegate = self
                
                let searchController = UISearchController(searchResultsController: nil)
                searchController.searchBar.delegate = self
                navigationItem.searchController = searchController
                
                findSuperheroBy(name: "a")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell",for: indexPath) as! SuperHeroViewCell
        let nameHero = list[indexPath.item]
        cell.render(nameHero)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           
        
        
        
                var columns = 2
                // Assign number of columns depending on device
                // Esto sirve para Setear las diferentes caracteristicas del dispositivo en función del tipo.
                switch UIDevice.current.userInterfaceIdiom {
                case .phone:
                    columns = 2
                case .pad:
                    columns = 5
                default:
                    columns = 2
                }
        
        
        
           let spacing = (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).minimumInteritemSpacing
           let screenWidth = collectionView.frame.size.width
           let leftSpace = screenWidth - spacing * CGFloat(columns + 1)
           let width = leftSpace / CGFloat(columns) //some width
           let height = width * 1.33 //ratio
           return CGSize(width: width, height: height)
       }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController
        let indexPath = collectionView.indexPathsForSelectedItems![0]
        let superhero = list[indexPath.row]
        detailViewController.superHeroe = superhero
        collectionView.deselectItem(at: indexPath, animated: true)
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
                        self.collectionView.reloadData()
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

