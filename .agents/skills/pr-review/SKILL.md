---
name: pr-review
description: Post pull request review comments using the gh CLI, annotating
  feedback directly on the relevant files and lines in the PR diff.
---

# PR Review Comments

Post review feedback directly to GitHub pull requests using the gh CLI. Comments are placed inline on the exact file and line where the issue lives, the same way a human reviewer would leave them.

## When to Use This Skill

When reviewing a pull request and the feedback should be posted as actual GitHub review comments rather than just printed to the terminal.

## Workflow

### Step 1: Identify the PR

If a PR number or URL was provided, use that. Otherwise, detect from the current branch:

```bash
gh pr view --json number,headRefOid -q '.number, .headRefOid'
```

You need both the PR number and the latest commit SHA for posting comments.

### Step 2: Read the Diff

Get the full diff to understand what changed and map line numbers:

```bash
gh pr diff <number>
```

This gives you the unified diff. The line numbers in review comments refer to the diff hunk positions, not the absolute file line numbers. Pay attention to this distinction.

### Step 3: Gather Context

If you need to understand more about specific files beyond what the diff shows:

```bash
gh pr view <number> --json files -q '.files[].path'
git show HEAD:<filepath>
```

### Step 4: Post the Review

Post all comments as a single review using `gh api`. This is better than posting individual comments because it groups them into one notification for the author.

```bash
gh api repos/{owner}/{repo}/pulls/<number>/reviews \
  -f commit_id="<sha>" \
  -f event="<event>" \
  -f body="<summary>" \
  -f 'comments=[
    {
      "path": "pkg/controller/reconciler.go",
      "line": 42,
      "body": "This error from `client.Get` is silently dropped. If the get fails mid-reconciliation, the controller will proceed with a zero-value object and write a bad status update. Propagate the error and requeue instead."
    },
    {
      "path": "pkg/controller/reconciler.go",
      "line": 87,
      "body": "Worth adding a context timeout here. If the upstream API hangs, this goroutine blocks forever and the controller workqueue backs up."
    }
  ]'
```

The `event` field determines the review action:

- `COMMENT` for neutral feedback
- `APPROVE` to approve the PR
- `REQUEST_CHANGES` to formally request changes

The `body` field is the top-level review summary. Keep it short, one or two sentences on the overall assessment. The real feedback lives in the inline comments.

### Line Number Mapping

GitHub's review comment API uses the line number in the new version of the file (the `+` side of the diff), not the diff hunk position. When commenting on a deleted line, use `side: "LEFT"` and the line number from the old file.

For multi-line comments, use `start_line` and `line` together to highlight a range:

```json
{
  "path": "deploy/base/deployment.yaml",
  "start_line": 30,
  "line": 35,
  "body": "These resource limits are very generous for a sidecar container. 2Gi memory and 1 CPU for something that just proxies traffic will waste capacity on every node."
}
```

### Writing Comments

Comments should read like they came from a human reviewer.

Write in plain prose. Explain what the problem is, why it matters operationally, and suggest what to do instead. If a code snippet makes the suggestion clearer, include one, but don't force a before/after block on every comment.

Don't use emojis, severity labels, or templated formats in the comment body. No "**Problem:**" or "**Suggestion:**" prefixes. Just talk.

Keep each comment focused on one thing. If a single line has two separate issues, post two comments.

The top-level review body should be a brief honest assessment, not a recap of all the inline comments. Something like "A few reliability concerns around error handling in the reconciler, and the deployment manifests need resource tuning. Nothing structural." is fine.

### Handling Large Reviews

If there are more than 15-20 comments, that's a signal the PR is too large or has systemic issues. In that case, focus the inline comments on the most important problems and use the top-level review body to describe the broader pattern. Something like "There's a consistent pattern of unchecked errors throughout the controller. I've called out a few specific instances inline, but this applies to most of the error paths in the new code."
