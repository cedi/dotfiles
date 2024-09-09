return {
  -- Additional schemas available in Telescope picker
  schemas = {
    {
      name = "Flux GitRepository",
      uri = "https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/gitrepository-source-v1.json",
    },
    {
      name = "Kubernetes",
      uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master-standalone/all.json"
    },
    { name = "GitHub Workflow", uri = "https://json.schemastore.org/github-workflow" },
    { name = "GitHub Action",   uri = "https://json.schemastore.org/github-action" },
    {
      name = "Azure Pipeline",
      uri = "https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json",
    },
    {
      name = "Ansible Task",
      uri =
      "https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/tasks",
    },
    {
      name = "Ansible Playbook",
      uri =
      "https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/playbook",
    },
    { name = "PrettierRC", uri = "https://json.schemastore.org/prettierrc" },
    { name = "Kustomize",  uri = "https://json.schemastore.org/kustomization" },
    { name = "Helm Chart", uri = "https://json.schemastore.org/chart" },
    { name = "Dependabot", uri = "https://json.schemastore.org/dependabot-v2" },
    {
      name = "GitLab CI",
      uri = "https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json",
    },
    {
      name = "OpenAPI Spec",
      uri = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json",
    },
    {
      name = "Docker Compose",
      uri = "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json",
    },
    {
      name = "Argo Workflow",
      uri = "https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json",
    },
  },

  -- Pass any additional options that will be merged in the final LSP config
  -- Defaults: https://github.com/someone-stole-my-name/yaml-companion.nvim/blob/main/lua/yaml-companion/config.lua
  lspconfig = {
    settings = {
      redhat = { telemetry = { enabled = false } },
      yaml = {
        validate = true,
        schemaStore = {
          enable = false,
          url = "",
        },
        schemas = {
          ["https://json.schemastore.org/github-workflow"] = ".github/workflows/*",
          ["https://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
          ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
            "azure-pipelines*.{yml,yaml}",
            ".pipelines/*.{yml,yaml}",
          },
          ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/tasks"] =
          "roles/tasks/*.{yml,yaml}",
          ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/playbook"] =
          "*play*.{yml,yaml}",
          ["https://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
          ["https://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
          ["https://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
          ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
          ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] =
          "*gitlab-ci*.{yml,yaml}",
          ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] =
          "*api*.{yml,yaml}",
          ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
          "*docker-compose*.{yml,yaml}",
          ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] =
          "*flow*.{yml,yaml}",
        },
      },
    },
  },
}
