//
//  PhotoCameraAlert.swift
//  CalendarMySchedule
//
//  Created by Aleksey Alyonin on 26.12.2022.
//

import UIKit

extension UIViewController {
    
    func alertPhotoOrCamera(completionHandle: @escaping(UIImagePickerController.SourceType)->Void){
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Camera", style: .default){ _ in
            let camera = UIImagePickerController.SourceType.camera
            completionHandle(camera)
        }
        
        let photoLibrary = UIAlertAction(title: "Photo Library", style: .default){ _ in
            let photoLibrary = UIImagePickerController.SourceType.photoLibrary
            completionHandle(photoLibrary)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.negativeWidthConstraint()
        alertController.addAction(camera)
        alertController.addAction(photoLibrary)
        alertController.addAction(cancel)

        present(alertController, animated: true)
        
    }
    
}
