# Publishing packages

## Creating the project

To create a DUB compatible project, the easiest way is to use the dub executable. [`$ dub init myproject`](../cli-reference/dub-init.md) will create a new folder `myproject` that contains the recommended skeleton and a basic `dub.json` or `dub.sdl` file. Running [`$ dub`](../cli-reference/dub.md) from this directory will build and run the empty project.

You should then adjust the package recipe (`dub.json` / `dub.sdl`) to fit the project. Especially the [authors], [copyright], [license] and [description] fields should be properly filled out before publishing. For details about the format of this file, see the [recipe page](../dub-reference/recipe.md).

## Registering with the registry

If you want to publish your project, simply put the contents into a repository and push it to [GitHub](https://github.com/), [GitLab](https://gitlab.com/) or [Bitbucket](https://bitbucket.org/). You can then [register an account](https://code.dlang.org/register) on DUB and register the package using your GitHub/GitLab/Bitbucket user name (or organization) and the project name. Anyone who adds the name of your project as a dependency to his/her package recipe will automatically have the contents of your git repository available to his/her project.

## Version tags

The repository will be monitored for changes and new version tags. To add a new version, just create a [git tag](todo-link-git-tag.md) with a name of the form `v1.2.3`, where `1.2.3` should be changed to the actual version number, following the [SemVer specification](https://semver.org). About twice per hour, the repository will be queried for new tags and any detected version will be made available on the registry.

Furthermore, all named branches will be available as special rolling versions of the form `~master` (in case of the git "master" branch). However, those should never directly be used to refer to dependencies. Use those only in dub.selections.json (see [dub-select(1)](../cli-reference/dub-select.md)) or for version overrides (see [dub-add-override(1)](../cli-reference/dub-add-override.md)).

## Private repositories

The [DUB registry](https://github.com/dlang/dub-registry) project can also be used as a private service. The settings file can be configured with credentials for a private repository hosting service instance, so that packages are fetched from the LAN, or from a private cloud based repository. Once a private instance is set up, all DUB clients need to be configured to make use of it by adding a `"registryUrls": ["http://dubregistry.example.com/"]` field with the appropriate URL(s) to your [dub settings file](../dub-reference/settings.md).

## Package Scoring

Search results are sorted by relevance. Relevance is a combined metric of the package score and the full-text search score, see [searchPackages(query)](https://github.com/dlang/dub-registry/blob/01cc896df7a5fa48cf65/source/dubregistry/dbcontroller.d#L239-L258). At the moment the package score is a number between `0.0` and `5.0` based on the following metrics:

- Recent downloads (~50% weight)
- Repo stars (~25% weight)
- Repo watchers (~25% weight)
- Repo forks (~25% weight)
- Repo open issues (~-25% weight)

Each of those metrics is log-scaled relative to their average before they are combined and capped with a non-linear tanh. See [computeScore()](https://github.com/dlang/dub-registry/blob/01cc896df7a5fa48cf65/source/dubregistry/registry.d#L576-L617) for more details. We appreciate any support in improving the package score. 