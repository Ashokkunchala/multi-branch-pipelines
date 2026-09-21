# Jenkins Multibranch Setup Runbook

## 1. Create the Jenkins job

Create:

**New Item -> Multibranch Pipeline**

Use the repository:

`https://github.com/Ashokkunchala/multi-branch-pipelines.git`

Set the script path to:

`Jenkinsfile`

## 2. Credentials

For a public repository, no GitHub credential is required for read-only discovery.

For a private repository, use a Jenkins credential with the minimum repository read permissions required.

Never put a GitHub token inside a Jenkinsfile.

## 3. Branch discovery

Enable branch discovery for the repository source.

Recommended lab behavior:

- discover branches
- build branches containing a Jenkinsfile
- remove orphaned branch jobs after a retention period

This repository intentionally contains different application stacks per branch, so each branch's Jenkinsfile controls its own build.

## 4. Webhook

Configure a GitHub repository webhook pointing to Jenkins.

Use the GitHub push event.

Webhooks are preferable to aggressive polling because Jenkins can react immediately to branch changes.

## 5. Jenkins requirements

The Jenkins agent used for these examples needs the runtime required by the selected branch.

Examples:

- Python 3 + pip
- Node.js + npm
- JDK + javac
- Maven for Spring
- Go
- PHP
- Ruby + Bundler
- Rust + Cargo
- .NET SDK
- Docker CLI/daemon access

Do not install every runtime on the Jenkins controller in production. Prefer labeled build agents or containers.

## 6. Pipeline lifecycle

Every standardized branch follows this general pattern:

```text
Checkout
   |
Build / Install
   |
Test
   |
Docker Build
   |
Cleanup
```

A failed build or test stops the pipeline. Test failures are not intentionally converted into successful builds.

## 7. Security

For production Jenkins:

- run Jenkins behind HTTPS
- restrict administrative access
- use least-privilege credentials
- never echo secrets
- do not expose Docker daemon access unnecessarily
- use dedicated agents instead of running arbitrary builds on the controller
- keep Jenkins plugins updated
- configure build retention

## 8. Troubleshooting

### Branch does not appear

Run:

**Scan Multibranch Pipeline Now**

Then check the branch source and Jenkinsfile path.

### Branch appears but does not build

Open the branch job and inspect the branch indexing log.

Common causes:

- Jenkinsfile syntax error
- missing runtime on the agent
- missing Docker access
- incorrect credentials

### Docker build fails

Verify:

```bash
docker version
docker info
```

The Jenkins agent must have permission to use Docker.

### Python build fails

Verify:

```bash
python3 --version
python3 -m pip --version
```

### Node build fails

Verify:

```bash
node --version
npm --version
```

### Java build fails

Verify:

```bash
java -version
javac -version
```
