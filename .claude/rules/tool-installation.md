# Tool Installation Directive

When a task requires installing a CLI tool, language runtime, or any developer
dependency **locally**, always install it via **mise**. Never use curl-piped
install scripts (`curl ... | bash`), Homebrew, `go install`, global
`npm`/`pip`/`pipx`, or other system package managers for local tool installs.

## How

- Add the tool to the project's `.mise.toml` with `mise use <tool>@<version>`,
  then invoke it through mise (`mise exec -- <tool> ...`).
- Pin an explicit version that matches the existing style of the file (this repo
  pins exact versions, not `latest`), so the toolchain stays reproducible and
  renovate can bump it.
- This covers ad-hoc tools needed mid-task (e.g. `bun`, `yq`, a one-off linter),
  not just the project's primary runtimes.
- If the tool genuinely isn't available in any mise backend, stop and ask the
  user how to proceed rather than falling back to another installer.

## Why

The user keeps every local tool under mise for reproducibility and a clean
machine. Side-loading via curl/brew/global-npm pollutes the environment and
breaks that guarantee.
