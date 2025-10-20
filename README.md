## CI/CD Workflows

This repository uses **GitHub Actions** for continuous integration and deployment.  
The following workflows are defined under `.github/workflows/`:

| Workflow | File | Description |
|-----------|------|-------------|
| Build | `.github/workflows/build.yml` | Builds the project and verifies dependencies. |
| Test | `.github/workflows/test.yml` | Runs automated tests to ensure code quality. |
| Deploy | `.github/workflows/deploy.yml` | Deploys the application to the production environment. |

Each workflow runs automatically on every push or pull request to the main branch.
