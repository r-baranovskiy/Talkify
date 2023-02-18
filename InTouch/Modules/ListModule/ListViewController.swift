import UIKit

class ListViewController: UIViewController  {
    
    private lazy var listCollectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: view.bounds,
            collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = UIColor.CustomColor.collectionViewBackground.color
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureListCollectionView()
        configureSearchBar()
        view.addSubview(listCollectionView)
    }
    
    private func configureListCollectionView() {
        listCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        listCollectionView.register(
            UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        listCollectionView.delegate = self
        listCollectionView.dataSource = self
    }
    
    private func configureSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
}

// MARK: - UISearchBarDelegate

extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
