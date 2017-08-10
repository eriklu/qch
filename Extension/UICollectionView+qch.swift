import UIKit

extension UICollectionView {
    static func qch_buildFlowlayoutCollectView(itemSize: CGSize, minimumLineSpacing: CGFloat = 10,
        minimumInteritemSpacing: CGFloat = 10) -> UICollectionView {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = minimumLineSpacing
        flowLayout.minimumInteritemSpacing = minimumInteritemSpacing
        flowLayout.itemSize = itemSize
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.backgroundColor = .white
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false

        return cv

    }
}
