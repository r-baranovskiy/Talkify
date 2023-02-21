import UIKit

final class PeopleViewController: UIViewController {
    
    private let users = Bundle.main.decode([ChatUser].self, from: "users.json")
    
    // MARK: - UI Constaints
    
    private lazy var peopleCollectionView: UICollectionView = {
        let layout = createCompositionalLayout()
        let collectionView = UICollectionView(
            frame: view.bounds,
            collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.CustomColor.collectionViewBackground.color
        return collectionView
    }()
    
    private lazy var dataSource: UICollectionViewDiffableDataSource<PeopleSection, ChatUser> = {
        let dataSource = createDataSource()
        return dataSource
    }()
    
    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(peopleCollectionView)
        
        configureSearchBar()
        reloadData()
        configurePeopleCollectionView()
    }
    
    // MARK: - Appearance
    
    private func configureSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    private func configurePeopleCollectionView() {
        peopleCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        peopleCollectionView.register(UICollectionViewCell.self,
                                      forCellWithReuseIdentifier: "cell")
        
        peopleCollectionView.register(
            SectionHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: SectionHeader.identifier)
    }
}

// MARK: - UISearchBarDelegate

extension PeopleViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

// MARK: - UICollectionViewCompositionalLayout

extension PeopleViewController {
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { (
            sectionIndex, layoutEnvironment) in
            
            guard let section = PeopleSection(rawValue: sectionIndex) else {
                fatalError("Unknown section kind")
            }
            switch section {
            case .users:
                return self.createUsersSection()
            }
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config
        return layout
    }
    
    private func createUsersSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(0.6))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(15)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 15
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 16, leading: 15, bottom: 0, trailing: 15)
        
        let sectionHeader = createSectionHeader()
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
    
    private func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let sectionHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: sectionHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        
        return sectionHeader
    }
}
// MARK: - UICollectionViewDiffableDataSource

extension PeopleViewController {
    private func createDataSource() -> UICollectionViewDiffableDataSource<PeopleSection, ChatUser> {
        let dataSource = UICollectionViewDiffableDataSource<PeopleSection, ChatUser>(
            collectionView: peopleCollectionView) { (
                collectionView, indexPath, user) -> UICollectionViewCell? in
                guard let section = PeopleSection(rawValue: indexPath.section) else {
                    fatalError("Unknown section kind")
                }
                switch section {
                case .users:
                    let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: "cell", for: indexPath)
                    cell.backgroundColor = .green
                    return cell
                }
            }
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            guard let sectionHeader = collectionView
                .dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: SectionHeader.identifier,
                    for: indexPath) as? SectionHeader else {
                fatalError("Cannot create header")
            }
            guard let section = PeopleSection(rawValue: indexPath.section) else {
                fatalError("Unknown section kind")
            }
            let items = self.dataSource.snapshot().itemIdentifiers(inSection: .users)
            sectionHeader.configure(
                title: section.description(usersCount: items.count),
                font: .systemFont(ofSize: 36, weight: .light), textColor: .label)
            return sectionHeader
        }
        return dataSource
    }
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<PeopleSection, ChatUser>()
        snapshot.appendSections([.users])
        snapshot.appendItems(users, toSection: .users)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}
