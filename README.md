# Jenkins Multi-Branch Pipeline Lab

A hands-on Jenkins Multibranch Pipeline repository containing small services for practicing branch discovery, branch-specific Jenkinsfiles, CI validation, Docker builds, and deployment automation.

## Application branches

| Branch | Stack |
|---|---|
| `python-flask` | Python + Flask |
| `fastapi-python` | Python + FastAPI |
| `java-service` | Java |
| `java-spring` | Java + Spring Boot |
| `go-gin` | Go + Gin |
| `node-express` | Node.js + Express |
| `typescript-express` | TypeScript + Express |
| `php-laravel` | PHP |
| `ruby-sinatra` | Ruby + Sinatra |
| `rust-actix` | Rust + Actix |
| `dotnet-webapi` | .NET Web API |

The GitHub default branch is currently `java-service`; Jenkins Multibranch should discover the other application branches from the same repository.

## How Multibranch works

```text
GitHub repository
      |
      +-- application branch ---- Jenkinsfile
      |
      v
Jenkins Multibranch Pipeline
      |
      +-- branch discovery
      +-- isolated branch jobs
      +-- checkout
      +-- verify/build/test
      +-- Docker build
```

## Jenkins setup

Create a **Multibranch Pipeline** job, add this GitHub repository as the branch source, enable branch discovery, and keep the script path as `Jenkinsfile`.

Configure a GitHub webhook for push events so Jenkins can discover/build branches without frequent polling.

## Pipeline conventions

- Fail on genuine build or test errors.
- Do not hide missing or failing tests with `|| echo`.
- Build Docker only after validation succeeds.
- Store secrets in Jenkins Credentials, never in source.
- Keep each branch's Jenkinsfile aligned with its application stack.

## Learning sequence

Start with `python-flask`, then compare `java-spring`, `node-express`, `go-gin`, and `dotnet-webapi`. Finally create the Multibranch job and observe one Jenkins child job per discovered branch.

## Security

Use least-privilege GitHub credentials, protect Jenkins with HTTPS/restricted access, and never publish credentials or tokens in pipeline code.