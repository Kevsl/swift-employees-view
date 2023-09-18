import UIKit

class ImageView: UIView {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        addSubview(imageView)
        
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setImage(fromURL imageURL: URL) {
      
        let session = URLSession.shared
        
        let task = session.dataTask(with: imageURL) { [weak self] (data, response, error) in
            if error == nil, let data = data {
                
                if let image = UIImage(data: data) {
                
                    DispatchQueue.main.async {
                        self?.imageView.image = image
                    }
                }
            } else {
                print("Error downloading image: \(error?.localizedDescription ?? "Unknown error")")
            }
        }

        task.resume()
    }
}
