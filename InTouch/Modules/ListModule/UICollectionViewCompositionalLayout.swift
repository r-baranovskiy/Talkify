import UIKit

extension ListViewController {
    
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { (
            sectionIndex, layoutEnvironment) in
        
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(84))
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: groupSize, subitems: [item])
            group.contentInsets = NSDirectionalEdgeInsets(
                top: 0, leading: 0, bottom: 8, trailing: 0)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(
                top: 16, leading: 20,
                bottom: 0, trailing: 20)
            
            return section
        }
        return layout
    }
}
