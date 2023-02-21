import UIKit

class ListViewController: UIViewController  {
    
    private let activeChats = Bundle.main.decode([Chat].self,
                                                 from: "activeChats.json")
    private let waitingChats = Bundle.main.decode([Chat].self,
                                                  from: "waitingChats.json")
    
    private lazy var listCollectionView: UICollectionView = {
        let layout = createCompositionalLayout()
        let collectionView = UICollectionView(
            frame: view.bounds,
            collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.CustomColor.collectionViewBackground.color
        return collectionView
    }()
    
    private lazy var dataSource: UICollectionViewDiffableDataSource<ListSection, Chat> = {
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
            WaitingChatCell.self, forCellWithReuseIdentifier: WaitingChatCell.reuseID)
        listCollectionView.register(
            ActiveChatCell.self, forCellWithReuseIdentifier: ActiveChatCell.reuseID)
        
        listCollectionView.register(
            SectionHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: SectionHeader.identifier)
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

// MARK: - UICollectionViewDiffableDataSource

extension ListViewController {
    
    private func configure<T: ConfiguringCell>(cellType: T.Type, with value: Chat,
                                               for indexPath: IndexPath) -> T {
        guard let cell = listCollectionView.dequeueReusableCell(
            withReuseIdentifier: cellType.reuseID, for: indexPath) as? T else {
            fatalError("Unable to deque the cell")
        }
        cell.configure(with: value)
        return cell
    }
    
    private func createDataSource() -> UICollectionViewDiffableDataSource<ListSection, Chat> {
        let dataSource = UICollectionViewDiffableDataSource<ListSection, Chat>(
            collectionView: listCollectionView) { (
                collectionView, indexPath, chat) -> UICollectionViewCell? in
                guard let section = ListSection(rawValue: indexPath.section) else {
                    fatalError("Unknown section kind")
                }
                switch section {
                case .activeChat:
                    return self.configure(
                        cellType: ActiveChatCell.self, with: chat, for: indexPath)
                case .waitingChat:
                    return self.configure(
                        cellType: WaitingChatCell.self, with: chat, for: indexPath)
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
            guard let section = ListSection(rawValue: indexPath.section) else {
                fatalError("Unknown section kind")
            }
            sectionHeader.configure(
                title: section.description(), font: .laoSangamMN20(),
                textColor: .lightGray)
            return sectionHeader
        }
        return dataSource
    }
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<ListSection, Chat>()
        snapshot.appendSections([.waitingChat, .activeChat])
        snapshot.appendItems(waitingChats, toSection: .waitingChat)
        snapshot.appendItems(activeChats, toSection: .activeChat)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

// MARK: - UICollectionViewCompositionalLayout

extension ListViewController {
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { (
            sectionIndex, layoutEnvironment) in
            
            guard let section = ListSection(rawValue: sectionIndex) else {
                fatalError("Unknown section kind")
            }
            switch section {
            case .activeChat:
                return self.createActiveChatSection()
            case .waitingChat:
                return self.createWaitingChatSection()
            }
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config
        return layout
    }
    
    private func createActiveChatSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(78))
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 16, leading: 20,
            bottom: 0, trailing: 20)
        
        let sectionHeader = createSectionHeader()
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
    private func createWaitingChatSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(88),
            heightDimension: .absolute(88))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(
            top: 0, leading: 0, bottom: 8, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 16, leading: 20,
            bottom: 0, trailing: 20)
        
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

