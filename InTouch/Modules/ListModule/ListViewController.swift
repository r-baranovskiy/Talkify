import UIKit

class ListViewController: UIViewController  {
    
    let activeChats: [Chat] = [
        Chat(username: "Ruslan", userImage: UIImage(named: "img1")!,
             lastMessge: "How are you?"),
        Chat(username: "Nastya", userImage: UIImage(named: "img2")!,
             lastMessge: "Where are you?"),
        Chat(username: "Olya", userImage: UIImage(named: "img3")!,
             lastMessge: "What are you doing?"),
        Chat(username: "Vlad", userImage: UIImage(named: "img3")!,
             lastMessge: "When will we meet?")
    ]
    
    lazy var listCollectionView: UICollectionView = {
        let layout = createCompositionalLayout()
        let collectionView = UICollectionView(
            frame: view.bounds,
            collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.CustomColor.collectionViewBackground.color
        return collectionView
    }()
    
    lazy var dataSource: UICollectionViewDiffableDataSource<ListSection, Chat> = {
        let dataSource = createDataSource()
        return dataSource
    }()
    
    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(listCollectionView)
        configureListCollectionView()
        reloadData()
        configureSearchBar()
    }
    
    // MARK: - Appearance
    
    private func configureListCollectionView() {
        listCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        listCollectionView.register(
            UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
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
