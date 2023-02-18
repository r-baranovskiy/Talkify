import UIKit

extension ListViewController {
    func createDataSource() -> UICollectionViewDiffableDataSource<ListSection, Chat> {
        let dataSource = UICollectionViewDiffableDataSource<ListSection, Chat>(
            collectionView: listCollectionView) { (
                collectionView, indexPath, chat) -> UICollectionViewCell? in
                guard let section = ListSection(rawValue: indexPath.section) else {
                    fatalError("Unknown section kind")
                }
                
                switch section {
                case .activeChats:
                    let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: "cell", for: indexPath)
                    cell.backgroundColor = .blue
                    return cell
                case .waitingChat:
                    let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: "celltwo", for: indexPath)
                    cell.backgroundColor = .blue
                    return cell
                }
            }
        return dataSource
    }
    
    func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<ListSection, Chat>()
        snapshot.appendSections([.activeChats])
        snapshot.appendItems(activeChats, toSection: .activeChats)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}
