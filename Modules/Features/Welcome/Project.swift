import ProjectDescription
import ProjectDescriptionHelpers

@MainActor let project = TargetBuilder.buildTarget(forModule: .internal(.feature(.welcome)))
