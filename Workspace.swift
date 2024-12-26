import ProjectDescription
import ProjectDescriptionHelpers

private let modules = Module.allCases.map { Path.relativeToRoot($0.path) }

let workspace = Workspace(
    name: Constants.Strings.appName,
    projects: [ "." ] + modules
)
