//
//  CloudKitSharing.swift
//  Carity
//
//  Created by Muhammad Yusuf on 13/06/23.
//

import Foundation
import CloudKit
import SwiftUI

struct CloudSharingView: UIViewControllerRepresentable {
  let share: CKShare
  let container: CKContainer
  let patient: Patient

  func makeCoordinator() -> CloudSharingCoordinator {
    CloudSharingCoordinator(patient: patient)
  }

  func makeUIViewController(context: Context) -> UICloudSharingController {
      share[CKShare.SystemFieldKey.title] = patient.description
    let controller = UICloudSharingController(share: share, container: container)
    controller.modalPresentationStyle = .formSheet
    controller.delegate = context.coordinator
    return controller
  }

  func updateUIViewController(_ uiViewController: UICloudSharingController, context: Context) {
  }
}

final class CloudSharingCoordinator: NSObject, UICloudSharingControllerDelegate {
  let stack = CoreDataStack.shared
  let patient: Patient
  init(patient: Patient) {
    self.patient = patient
  }

  func itemTitle(for csc: UICloudSharingController) -> String? {
    patient.description
  }

  func cloudSharingController(_ csc: UICloudSharingController, failedToSaveShareWithError error: Error) {
    print("Failed to save share: \(error)")
  }

  func cloudSharingControllerDidSaveShare(_ csc: UICloudSharingController) {
    print("Saved the share")
  }

  func cloudSharingControllerDidStopSharing(_ csc: UICloudSharingController) {
    if !stack.isOwner(object: patient) {
      stack.delete(patient)
    }
  }
}

