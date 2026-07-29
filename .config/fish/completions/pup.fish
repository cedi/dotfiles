# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_pup_global_optspecs
	string join \n o/output= y/yes agent no-agent read-only org= h/help V/version
end

function __fish_pup_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_pup_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_pup_using_subcommand
	set -l cmd (__fish_pup_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c pup -n "__fish_pup_needs_command" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_needs_command" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_needs_command" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_needs_command" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_needs_command" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_needs_command" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_needs_command" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_needs_command" -s V -l version -d 'Print version'
complete -c pup -n "__fish_pup_needs_command" -f -a "acp" -d 'Start a local ACP server that proxies to Datadog Bits AI'
complete -c pup -n "__fish_pup_needs_command" -f -a "agent" -d 'Schema and guide for the datadog-agent daemon and AI coding assistants'
complete -c pup -n "__fish_pup_needs_command" -f -a "agentless-scanning" -d 'Manage Agentless Scanning configurations'
complete -c pup -n "__fish_pup_needs_command" -f -a "alias" -d 'Create shortcuts for pup commands'
complete -c pup -n "__fish_pup_needs_command" -f -a "api" -d 'Make authenticated requests directly to the Datadog API'
complete -c pup -n "__fish_pup_needs_command" -f -a "api-keys" -d 'Manage API keys'
complete -c pup -n "__fish_pup_needs_command" -f -a "apm" -d 'Manage APM services and entities'
complete -c pup -n "__fish_pup_needs_command" -f -a "app-builder" -d 'Manage App Builder applications'
complete -c pup -n "__fish_pup_needs_command" -f -a "app-keys" -d 'Manage application keys'
complete -c pup -n "__fish_pup_needs_command" -f -a "audit-logs" -d 'Query audit logs'
complete -c pup -n "__fish_pup_needs_command" -f -a "audit" -d 'Query audit logs'
complete -c pup -n "__fish_pup_needs_command" -f -a "auth" -d 'OAuth2 authentication commands'
complete -c pup -n "__fish_pup_needs_command" -f -a "authn-mappings" -d 'Manage AuthN mappings for federated identity providers'
complete -c pup -n "__fish_pup_needs_command" -f -a "bits" -d 'Ask Datadog Bits AI a question in natural language'
complete -c pup -n "__fish_pup_needs_command" -f -a "cases" -d 'Manage case management cases and projects'
complete -c pup -n "__fish_pup_needs_command" -f -a "change-requests" -d 'Manage change requests'
complete -c pup -n "__fish_pup_needs_command" -f -a "cicd" -d 'Manage CI/CD visibility'
complete -c pup -n "__fish_pup_needs_command" -f -a "cloud" -d 'Manage cloud integrations'
complete -c pup -n "__fish_pup_needs_command" -f -a "code-coverage" -d 'Query code coverage data'
complete -c pup -n "__fish_pup_needs_command" -f -a "completions" -d 'Generate shell completions'
complete -c pup -n "__fish_pup_needs_command" -f -a "containers" -d 'Query running containers and container images'
complete -c pup -n "__fish_pup_needs_command" -f -a "costs" -d 'Manage cost and billing data'
complete -c pup -n "__fish_pup_needs_command" -f -a "csm-threats" -d 'Manage CSM Threats agent policies and rules'
complete -c pup -n "__fish_pup_needs_command" -f -a "dashboards" -d 'Manage dashboards'
complete -c pup -n "__fish_pup_needs_command" -f -a "data-deletion" -d 'Manage data deletion requests'
complete -c pup -n "__fish_pup_needs_command" -f -a "data-governance" -d 'Manage data governance'
complete -c pup -n "__fish_pup_needs_command" -f -a "datasets" -d 'Manage datasets'
complete -c pup -n "__fish_pup_needs_command" -f -a "dbm" -d 'Search Database Monitoring query samples'
complete -c pup -n "__fish_pup_needs_command" -f -a "ddsql" -d 'Query Datadog data using DDSQL (Datadog SQL)'
complete -c pup -n "__fish_pup_needs_command" -f -a "debugger" -d 'Manage Live Debugger'
complete -c pup -n "__fish_pup_needs_command" -f -a "deployment-gates" -d 'Manage Deployment Gates'
complete -c pup -n "__fish_pup_needs_command" -f -a "docs" -d 'Ask the Datadog Docs AI a question'
complete -c pup -n "__fish_pup_needs_command" -f -a "downtime" -d 'Manage monitor downtimes'
complete -c pup -n "__fish_pup_needs_command" -f -a "error-tracking" -d 'Manage error tracking'
complete -c pup -n "__fish_pup_needs_command" -f -a "events" -d 'Manage Datadog events'
complete -c pup -n "__fish_pup_needs_command" -f -a "extension" -d 'Manage pup extensions'
complete -c pup -n "__fish_pup_needs_command" -f -a "feature-flags" -d 'Manage feature flags'
complete -c pup -n "__fish_pup_needs_command" -f -a "fleet" -d 'Manage Fleet Automation'
complete -c pup -n "__fish_pup_needs_command" -f -a "format" -d 'Render JSON through pup\'s formatter'
complete -c pup -n "__fish_pup_needs_command" -f -a "fmt" -d 'Render JSON through pup\'s formatter'
complete -c pup -n "__fish_pup_needs_command" -f -a "hamr" -d 'Manage High Availability Multi-Region (HAMR)'
complete -c pup -n "__fish_pup_needs_command" -f -a "idp" -d 'Internal Developer Portal — agent-native context layer'
complete -c pup -n "__fish_pup_needs_command" -f -a "incidents" -d 'Manage incidents'
complete -c pup -n "__fish_pup_needs_command" -f -a "infrastructure" -d 'Manage infrastructure monitoring'
complete -c pup -n "__fish_pup_needs_command" -f -a "integrations" -d 'Manage third-party integrations'
complete -c pup -n "__fish_pup_needs_command" -f -a "investigations" -d 'Manage Bits AI investigations'
complete -c pup -n "__fish_pup_needs_command" -f -a "kafka" -d '[Experimental] Inspect Kafka clusters via Datadog'
complete -c pup -n "__fish_pup_needs_command" -f -a "llm-obs" -d 'Manage LLM Observability projects, experiments, and datasets'
complete -c pup -n "__fish_pup_needs_command" -f -a "logs" -d 'Search and analyze logs'
complete -c pup -n "__fish_pup_needs_command" -f -a "logs-restriction" -d 'Manage log restriction queries for role-based access control'
complete -c pup -n "__fish_pup_needs_command" -f -a "metrics" -d 'Query and manage metrics'
complete -c pup -n "__fish_pup_needs_command" -f -a "misc" -d 'Miscellaneous API operations'
complete -c pup -n "__fish_pup_needs_command" -f -a "monitors" -d 'Manage monitors'
complete -c pup -n "__fish_pup_needs_command" -f -a "network" -d 'Manage network monitoring'
complete -c pup -n "__fish_pup_needs_command" -f -a "notebooks" -d 'Manage notebooks'
complete -c pup -n "__fish_pup_needs_command" -f -a "obs-pipelines" -d 'Manage observability pipelines'
complete -c pup -n "__fish_pup_needs_command" -f -a "on-call" -d 'Manage teams and on-call operations'
complete -c pup -n "__fish_pup_needs_command" -f -a "organizations" -d 'Manage organization settings'
complete -c pup -n "__fish_pup_needs_command" -f -a "processes" -d 'List and search running processes'
complete -c pup -n "__fish_pup_needs_command" -f -a "product-analytics" -d 'Send product analytics events'
complete -c pup -n "__fish_pup_needs_command" -f -a "profiling" -d 'Datadog Continuous Profiler (not supported in pup yet)'
complete -c pup -n "__fish_pup_needs_command" -f -a "reference-tables" -d 'Manage reference tables for log enrichment'
complete -c pup -n "__fish_pup_needs_command" -f -a "rum" -d 'Manage Real User Monitoring (RUM)'
complete -c pup -n "__fish_pup_needs_command" -f -a "runbooks" -d 'Execute and manage local operational runbooks'
complete -c pup -n "__fish_pup_needs_command" -f -a "scorecards" -d 'Manage service scorecards'
complete -c pup -n "__fish_pup_needs_command" -f -a "security" -d 'Manage security monitoring'
complete -c pup -n "__fish_pup_needs_command" -f -a "service-catalog" -d 'Manage service catalog'
complete -c pup -n "__fish_pup_needs_command" -f -a "skills" -d 'Manage agent skills, subagents, and extensions for AI coding assistants'
complete -c pup -n "__fish_pup_needs_command" -f -a "slos" -d 'Manage Service Level Objectives'
complete -c pup -n "__fish_pup_needs_command" -f -a "software-catalog" -d 'Manage the Datadog Software Catalog'
complete -c pup -n "__fish_pup_needs_command" -f -a "static-analysis" -d 'Manage static analysis'
complete -c pup -n "__fish_pup_needs_command" -f -a "status-pages" -d 'Manage status pages'
complete -c pup -n "__fish_pup_needs_command" -f -a "symdb" -d 'Query the Symbol Database (SymDB)'
complete -c pup -n "__fish_pup_needs_command" -f -a "synthetics" -d 'Manage synthetic monitoring'
complete -c pup -n "__fish_pup_needs_command" -f -a "tags" -d 'Manage host tags'
complete -c pup -n "__fish_pup_needs_command" -f -a "test-optimization" -d 'Manage Test Optimization settings and flaky tests'
complete -c pup -n "__fish_pup_needs_command" -f -a "traces" -d 'Search and aggregate APM traces'
complete -c pup -n "__fish_pup_needs_command" -f -a "usage" -d 'Query usage and billing information'
complete -c pup -n "__fish_pup_needs_command" -f -a "users" -d 'Manage users and access'
complete -c pup -n "__fish_pup_needs_command" -f -a "version" -d 'Print version information'
complete -c pup -n "__fish_pup_needs_command" -f -a "workflows" -d 'Manage Datadog workflows'
complete -c pup -n "__fish_pup_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand acp; and not __fish_seen_subcommand_from serve help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand acp; and not __fish_seen_subcommand_from serve help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand acp; and not __fish_seen_subcommand_from serve help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand acp; and not __fish_seen_subcommand_from serve help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand acp; and not __fish_seen_subcommand_from serve help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand acp; and not __fish_seen_subcommand_from serve help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand acp; and not __fish_seen_subcommand_from serve help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand acp; and not __fish_seen_subcommand_from serve help" -f -a "serve" -d 'Start an ACP server that delegates to Datadog Bits AI'
complete -c pup -n "__fish_pup_using_subcommand acp; and not __fish_seen_subcommand_from serve help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand acp; and __fish_seen_subcommand_from serve" -l port -d 'Port to listen on' -r
complete -c pup -n "__fish_pup_using_subcommand acp; and __fish_seen_subcommand_from serve" -l host -d 'Host address to bind to' -r
complete -c pup -n "__fish_pup_using_subcommand acp; and __fish_seen_subcommand_from serve" -l agent-id -d 'Datadog Bits AI agent ID to proxy (auto-discovered if omitted)' -r
complete -c pup -n "__fish_pup_using_subcommand acp; and __fish_seen_subcommand_from serve" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand acp; and __fish_seen_subcommand_from serve" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand acp; and __fish_seen_subcommand_from serve" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand acp; and __fish_seen_subcommand_from serve" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand acp; and __fish_seen_subcommand_from serve" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand acp; and __fish_seen_subcommand_from serve" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand acp; and __fish_seen_subcommand_from serve" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand acp; and __fish_seen_subcommand_from help" -f -a "serve" -d 'Start an ACP server that delegates to Datadog Bits AI'
complete -c pup -n "__fish_pup_using_subcommand acp; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand agent; and not __fish_seen_subcommand_from schema guide help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand agent; and not __fish_seen_subcommand_from schema guide help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand agent; and not __fish_seen_subcommand_from schema guide help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand agent; and not __fish_seen_subcommand_from schema guide help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand agent; and not __fish_seen_subcommand_from schema guide help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand agent; and not __fish_seen_subcommand_from schema guide help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand agent; and not __fish_seen_subcommand_from schema guide help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand agent; and not __fish_seen_subcommand_from schema guide help" -f -a "schema" -d 'Output command schema as JSON'
complete -c pup -n "__fish_pup_using_subcommand agent; and not __fish_seen_subcommand_from schema guide help" -f -a "guide" -d 'Display the datadog-agent (Datadog-Agent) operational reference'
complete -c pup -n "__fish_pup_using_subcommand agent; and not __fish_seen_subcommand_from schema guide help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand agent; and __fish_seen_subcommand_from schema" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand agent; and __fish_seen_subcommand_from schema" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand agent; and __fish_seen_subcommand_from schema" -l compact -d 'Output minimal schema (names + flags only)'
complete -c pup -n "__fish_pup_using_subcommand agent; and __fish_seen_subcommand_from schema" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand agent; and __fish_seen_subcommand_from schema" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand agent; and __fish_seen_subcommand_from schema" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand agent; and __fish_seen_subcommand_from schema" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand agent; and __fish_seen_subcommand_from schema" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand agent; and __fish_seen_subcommand_from guide" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand agent; and __fish_seen_subcommand_from guide" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand agent; and __fish_seen_subcommand_from guide" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand agent; and __fish_seen_subcommand_from guide" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand agent; and __fish_seen_subcommand_from guide" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand agent; and __fish_seen_subcommand_from guide" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand agent; and __fish_seen_subcommand_from guide" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand agent; and __fish_seen_subcommand_from help" -f -a "schema" -d 'Output command schema as JSON'
complete -c pup -n "__fish_pup_using_subcommand agent; and __fish_seen_subcommand_from help" -f -a "guide" -d 'Display the datadog-agent (Datadog-Agent) operational reference'
complete -c pup -n "__fish_pup_using_subcommand agent; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and not __fish_seen_subcommand_from aws azure gcp help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and not __fish_seen_subcommand_from aws azure gcp help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and not __fish_seen_subcommand_from aws azure gcp help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and not __fish_seen_subcommand_from aws azure gcp help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and not __fish_seen_subcommand_from aws azure gcp help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and not __fish_seen_subcommand_from aws azure gcp help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and not __fish_seen_subcommand_from aws azure gcp help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and not __fish_seen_subcommand_from aws azure gcp help" -f -a "aws" -d 'Manage AWS agentless scan options and on-demand tasks'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and not __fish_seen_subcommand_from aws azure gcp help" -f -a "azure" -d 'Manage Azure agentless scan options'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and not __fish_seen_subcommand_from aws azure gcp help" -f -a "gcp" -d 'Manage GCP agentless scan options'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and not __fish_seen_subcommand_from aws azure gcp help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from aws" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from aws" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from aws" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from aws" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from aws" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from aws" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from aws" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from aws" -f -a "list" -d 'List AWS scan options'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from aws" -f -a "get" -d 'Get AWS scan options for an account'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from aws" -f -a "create" -d 'Activate AWS scan options from JSON'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from aws" -f -a "update" -d 'Update AWS scan options for an account'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from aws" -f -a "delete" -d 'Delete AWS scan options for an account'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from aws" -f -a "on-demand" -d 'Manage AWS on-demand scan tasks'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from aws" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from azure" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from azure" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from azure" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from azure" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from azure" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from azure" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from azure" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from azure" -f -a "list" -d 'List Azure scan options'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from azure" -f -a "get" -d 'Get Azure scan options for a subscription'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from azure" -f -a "create" -d 'Activate Azure scan options from JSON'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from azure" -f -a "update" -d 'Update Azure scan options for a subscription'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from azure" -f -a "delete" -d 'Delete Azure scan options for a subscription'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from azure" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from gcp" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from gcp" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from gcp" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from gcp" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from gcp" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from gcp" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from gcp" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from gcp" -f -a "list" -d 'List GCP scan options'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from gcp" -f -a "get" -d 'Get GCP scan options for a project'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from gcp" -f -a "create" -d 'Activate GCP scan options from JSON'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from gcp" -f -a "update" -d 'Update GCP scan options for a project'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from gcp" -f -a "delete" -d 'Delete GCP scan options for a project'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from gcp" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from help" -f -a "aws" -d 'Manage AWS agentless scan options and on-demand tasks'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from help" -f -a "azure" -d 'Manage Azure agentless scan options'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from help" -f -a "gcp" -d 'Manage GCP agentless scan options'
complete -c pup -n "__fish_pup_using_subcommand agentless-scanning; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand alias; and not __fish_seen_subcommand_from list set delete import help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand alias; and not __fish_seen_subcommand_from list set delete import help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand alias; and not __fish_seen_subcommand_from list set delete import help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand alias; and not __fish_seen_subcommand_from list set delete import help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand alias; and not __fish_seen_subcommand_from list set delete import help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand alias; and not __fish_seen_subcommand_from list set delete import help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand alias; and not __fish_seen_subcommand_from list set delete import help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand alias; and not __fish_seen_subcommand_from list set delete import help" -f -a "list" -d 'List your aliases'
complete -c pup -n "__fish_pup_using_subcommand alias; and not __fish_seen_subcommand_from list set delete import help" -f -a "set" -d 'Create a shortcut for a pup command'
complete -c pup -n "__fish_pup_using_subcommand alias; and not __fish_seen_subcommand_from list set delete import help" -f -a "delete" -d 'Delete set aliases'
complete -c pup -n "__fish_pup_using_subcommand alias; and not __fish_seen_subcommand_from list set delete import help" -f -a "import" -d 'Import aliases from a YAML file'
complete -c pup -n "__fish_pup_using_subcommand alias; and not __fish_seen_subcommand_from list set delete import help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from set" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from set" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from set" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from set" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from set" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from set" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from set" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from delete" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from delete" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from delete" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from delete" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from delete" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from delete" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from import" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from import" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from import" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from import" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from import" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from import" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from import" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from help" -f -a "list" -d 'List your aliases'
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from help" -f -a "set" -d 'Create a shortcut for a pup command'
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete set aliases'
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from help" -f -a "import" -d 'Import aliases from a YAML file'
complete -c pup -n "__fish_pup_using_subcommand alias; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand api" -s X -l method -d 'HTTP method (default: GET)' -r
complete -c pup -n "__fish_pup_using_subcommand api" -s F -l field -d 'Add a typed field: int, bool, null, or string (repeatable). For POST/PUT/PATCH: JSON body field. For GET/DELETE: query parameter' -r
complete -c pup -n "__fish_pup_using_subcommand api" -s H -l header -d 'Add a custom HTTP request header (repeatable)' -r
complete -c pup -n "__fish_pup_using_subcommand api" -l input -d 'Read request body from file, or use "-" for stdin' -r
complete -c pup -n "__fish_pup_using_subcommand api" -s f -l raw-field -d 'Add a raw string field, no type coercion (repeatable). For POST/PUT/PATCH: JSON body field. For GET/DELETE: query parameter' -r
complete -c pup -n "__fish_pup_using_subcommand api" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand api" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand api" -s i -l include -d 'Include HTTP response status line and headers in output'
complete -c pup -n "__fish_pup_using_subcommand api" -l silent -d 'Do not print the response body'
complete -c pup -n "__fish_pup_using_subcommand api" -l verbose -d 'Show full request URL and response headers'
complete -c pup -n "__fish_pup_using_subcommand api" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand api" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand api" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand api" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand api" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and not __fish_seen_subcommand_from list get create delete help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand api-keys; and not __fish_seen_subcommand_from list get create delete help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand api-keys; and not __fish_seen_subcommand_from list get create delete help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and not __fish_seen_subcommand_from list get create delete help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and not __fish_seen_subcommand_from list get create delete help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and not __fish_seen_subcommand_from list get create delete help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and not __fish_seen_subcommand_from list get create delete help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and not __fish_seen_subcommand_from list get create delete help" -f -a "list" -d 'List API keys'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and not __fish_seen_subcommand_from list get create delete help" -f -a "get" -d 'Get API key details'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and not __fish_seen_subcommand_from list get create delete help" -f -a "create" -d 'Create new API key'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and not __fish_seen_subcommand_from list get create delete help" -f -a "delete" -d 'Delete an API key (DESTRUCTIVE)'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and not __fish_seen_subcommand_from list get create delete help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from get" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from get" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from get" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from get" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from get" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from create" -l name -d 'API key name (required)' -r
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from create" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from create" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from create" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from create" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from create" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from create" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from delete" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from delete" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from delete" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from delete" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from delete" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from delete" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from help" -f -a "list" -d 'List API keys'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get API key details'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create new API key'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete an API key (DESTRUCTIVE)'
complete -c pup -n "__fish_pup_using_subcommand api-keys; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand apm; and not __fish_seen_subcommand_from services entities dependencies flow-map troubleshooting service-remapping service-config service-library-config help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand apm; and not __fish_seen_subcommand_from services entities dependencies flow-map troubleshooting service-remapping service-config service-library-config help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand apm; and not __fish_seen_subcommand_from services entities dependencies flow-map troubleshooting service-remapping service-config service-library-config help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand apm; and not __fish_seen_subcommand_from services entities dependencies flow-map troubleshooting service-remapping service-config service-library-config help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand apm; and not __fish_seen_subcommand_from services entities dependencies flow-map troubleshooting service-remapping service-config service-library-config help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand apm; and not __fish_seen_subcommand_from services entities dependencies flow-map troubleshooting service-remapping service-config service-library-config help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand apm; and not __fish_seen_subcommand_from services entities dependencies flow-map troubleshooting service-remapping service-config service-library-config help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand apm; and not __fish_seen_subcommand_from services entities dependencies flow-map troubleshooting service-remapping service-config service-library-config help" -f -a "services" -d 'Manage APM services'
complete -c pup -n "__fish_pup_using_subcommand apm; and not __fish_seen_subcommand_from services entities dependencies flow-map troubleshooting service-remapping service-config service-library-config help" -f -a "entities" -d 'Manage APM entities'
complete -c pup -n "__fish_pup_using_subcommand apm; and not __fish_seen_subcommand_from services entities dependencies flow-map troubleshooting service-remapping service-config service-library-config help" -f -a "dependencies" -d 'Manage service dependencies'
complete -c pup -n "__fish_pup_using_subcommand apm; and not __fish_seen_subcommand_from services entities dependencies flow-map troubleshooting service-remapping service-config service-library-config help" -f -a "flow-map" -d 'View service flow map'
complete -c pup -n "__fish_pup_using_subcommand apm; and not __fish_seen_subcommand_from services entities dependencies flow-map troubleshooting service-remapping service-config service-library-config help" -f -a "troubleshooting" -d 'Troubleshoot APM instrumentation issues'
complete -c pup -n "__fish_pup_using_subcommand apm; and not __fish_seen_subcommand_from services entities dependencies flow-map troubleshooting service-remapping service-config service-library-config help" -f -a "service-remapping" -d 'Manage APM service remapping rules'
complete -c pup -n "__fish_pup_using_subcommand apm; and not __fish_seen_subcommand_from services entities dependencies flow-map troubleshooting service-remapping service-config service-library-config help" -f -a "service-config" -d 'View APM service instance configuration'
complete -c pup -n "__fish_pup_using_subcommand apm; and not __fish_seen_subcommand_from services entities dependencies flow-map troubleshooting service-remapping service-config service-library-config help" -f -a "service-library-config" -d 'View APM service library configuration'
complete -c pup -n "__fish_pup_using_subcommand apm; and not __fish_seen_subcommand_from services entities dependencies flow-map troubleshooting service-remapping service-config service-library-config help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from services" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from services" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from services" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from services" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from services" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from services" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from services" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from services" -f -a "list" -d 'List APM services'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from services" -f -a "stats" -d 'List services with performance statistics'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from services" -f -a "operations" -d 'List operations for a service'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from services" -f -a "resources" -d 'List resources (endpoints) for a service operation'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from services" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from entities" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from entities" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from entities" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from entities" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from entities" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from entities" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from entities" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from entities" -f -a "list" -d 'Query APM entities'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from entities" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from dependencies" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from dependencies" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from dependencies" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from dependencies" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from dependencies" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from dependencies" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from dependencies" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from dependencies" -f -a "list" -d 'List service dependencies'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from dependencies" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from flow-map" -l query -d 'Query filter (required)' -r
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from flow-map" -l limit -d 'Max nodes' -r
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from flow-map" -l from -d 'Start time' -r
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from flow-map" -l to -d 'End time' -r
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from flow-map" -l env -d 'Environment filter' -r
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from flow-map" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from flow-map" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from flow-map" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from flow-map" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from flow-map" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from flow-map" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from flow-map" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from troubleshooting" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from troubleshooting" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from troubleshooting" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from troubleshooting" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from troubleshooting" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from troubleshooting" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from troubleshooting" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from troubleshooting" -f -a "list" -d 'List instrumentation errors for a host'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from troubleshooting" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-remapping" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-remapping" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-remapping" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-remapping" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-remapping" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-remapping" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-remapping" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-remapping" -f -a "list" -d 'List all service remapping rules'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-remapping" -f -a "create" -d 'Create a service remapping rule'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-remapping" -f -a "get" -d 'Get a service remapping rule by ID'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-remapping" -f -a "update" -d 'Update a service remapping rule'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-remapping" -f -a "delete" -d 'Delete a service remapping rule'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-remapping" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-config" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-config" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-config" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-config" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-config" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-config" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-config" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-config" -f -a "get" -d 'Get service instance configuration'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-config" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-library-config" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-library-config" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-library-config" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-library-config" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-library-config" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-library-config" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-library-config" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-library-config" -f -a "get" -d 'Get library configuration for a service'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from service-library-config" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from help" -f -a "services" -d 'Manage APM services'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from help" -f -a "entities" -d 'Manage APM entities'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from help" -f -a "dependencies" -d 'Manage service dependencies'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from help" -f -a "flow-map" -d 'View service flow map'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from help" -f -a "troubleshooting" -d 'Troubleshoot APM instrumentation issues'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from help" -f -a "service-remapping" -d 'Manage APM service remapping rules'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from help" -f -a "service-config" -d 'View APM service instance configuration'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from help" -f -a "service-library-config" -d 'View APM service library configuration'
complete -c pup -n "__fish_pup_using_subcommand apm; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and not __fish_seen_subcommand_from list get create update delete delete-batch publish unpublish help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand app-builder; and not __fish_seen_subcommand_from list get create update delete delete-batch publish unpublish help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand app-builder; and not __fish_seen_subcommand_from list get create update delete delete-batch publish unpublish help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and not __fish_seen_subcommand_from list get create update delete delete-batch publish unpublish help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and not __fish_seen_subcommand_from list get create update delete delete-batch publish unpublish help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and not __fish_seen_subcommand_from list get create update delete delete-batch publish unpublish help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and not __fish_seen_subcommand_from list get create update delete delete-batch publish unpublish help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and not __fish_seen_subcommand_from list get create update delete delete-batch publish unpublish help" -f -a "list" -d 'List App Builder applications'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and not __fish_seen_subcommand_from list get create update delete delete-batch publish unpublish help" -f -a "get" -d 'Get App Builder application details'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and not __fish_seen_subcommand_from list get create update delete delete-batch publish unpublish help" -f -a "create" -d 'Create a new App Builder application'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and not __fish_seen_subcommand_from list get create update delete delete-batch publish unpublish help" -f -a "update" -d 'Update an App Builder application'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and not __fish_seen_subcommand_from list get create update delete delete-batch publish unpublish help" -f -a "delete" -d 'Delete an App Builder application (DESTRUCTIVE)'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and not __fish_seen_subcommand_from list get create update delete delete-batch publish unpublish help" -f -a "delete-batch" -d 'Delete multiple App Builder applications (DESTRUCTIVE)'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and not __fish_seen_subcommand_from list get create update delete delete-batch publish unpublish help" -f -a "publish" -d 'Publish an App Builder application'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and not __fish_seen_subcommand_from list get create update delete delete-batch publish unpublish help" -f -a "unpublish" -d 'Unpublish an App Builder application'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and not __fish_seen_subcommand_from list get create update delete delete-batch publish unpublish help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from list" -l query -d 'Filter apps by query string' -r
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from get" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from get" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from get" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from get" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from get" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from create" -l file -d 'JSON file with app data (required)' -r
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from create" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from create" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from create" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from create" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from create" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from create" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from update" -l file -d 'JSON file with app data (required)' -r
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from update" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from update" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from update" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from update" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from update" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from update" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from update" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from delete" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from delete" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from delete" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from delete" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from delete" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from delete" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from delete-batch" -l app-ids -d 'Comma-separated list of app IDs' -r
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from delete-batch" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from delete-batch" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from delete-batch" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from delete-batch" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from delete-batch" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from delete-batch" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from delete-batch" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from publish" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from publish" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from publish" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from publish" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from publish" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from publish" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from publish" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from unpublish" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from unpublish" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from unpublish" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from unpublish" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from unpublish" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from unpublish" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from unpublish" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from help" -f -a "list" -d 'List App Builder applications'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get App Builder application details'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a new App Builder application'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from help" -f -a "update" -d 'Update an App Builder application'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete an App Builder application (DESTRUCTIVE)'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from help" -f -a "delete-batch" -d 'Delete multiple App Builder applications (DESTRUCTIVE)'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from help" -f -a "publish" -d 'Publish an App Builder application'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from help" -f -a "unpublish" -d 'Unpublish an App Builder application'
complete -c pup -n "__fish_pup_using_subcommand app-builder; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and not __fish_seen_subcommand_from list get create update delete help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand app-keys; and not __fish_seen_subcommand_from list get create update delete help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand app-keys; and not __fish_seen_subcommand_from list get create update delete help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and not __fish_seen_subcommand_from list get create update delete help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and not __fish_seen_subcommand_from list get create update delete help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and not __fish_seen_subcommand_from list get create update delete help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and not __fish_seen_subcommand_from list get create update delete help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and not __fish_seen_subcommand_from list get create update delete help" -f -a "list" -d 'List application keys'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and not __fish_seen_subcommand_from list get create update delete help" -f -a "get" -d 'Get application key details'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and not __fish_seen_subcommand_from list get create update delete help" -f -a "create" -d 'Create a new application key'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and not __fish_seen_subcommand_from list get create update delete help" -f -a "update" -d 'Update an application key'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and not __fish_seen_subcommand_from list get create update delete help" -f -a "delete" -d 'Delete an application key (DESTRUCTIVE)'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and not __fish_seen_subcommand_from list get create update delete help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from list" -l page-size -d 'Number of results per page' -r
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from list" -l page-number -d 'Page number to retrieve (0-indexed)' -r
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from list" -l filter -d 'Filter by key name' -r
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from list" -l sort -d 'Sort field (name, -name, created_at, -created_at)' -r
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from list" -l all -d 'List all org keys (requires API keys, not OAuth)'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from get" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from get" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from get" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from get" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from get" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from create" -l name -d 'Application key name (required)' -r
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from create" -l scopes -d 'Comma-separated authorization scopes' -r
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from create" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from create" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from create" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from create" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from create" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from create" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from update" -l name -d 'New name for the application key' -r
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from update" -l scopes -d 'Comma-separated authorization scopes' -r
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from update" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from update" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from update" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from update" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from update" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from update" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from update" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from delete" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from delete" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from delete" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from delete" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from delete" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from delete" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from help" -f -a "list" -d 'List application keys'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get application key details'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a new application key'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from help" -f -a "update" -d 'Update an application key'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete an application key (DESTRUCTIVE)'
complete -c pup -n "__fish_pup_using_subcommand app-keys; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and not __fish_seen_subcommand_from list search help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and not __fish_seen_subcommand_from list search help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and not __fish_seen_subcommand_from list search help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and not __fish_seen_subcommand_from list search help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and not __fish_seen_subcommand_from list search help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and not __fish_seen_subcommand_from list search help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and not __fish_seen_subcommand_from list search help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and not __fish_seen_subcommand_from list search help" -f -a "list" -d 'List recent audit logs'
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and not __fish_seen_subcommand_from list search help" -f -a "search" -d 'Search audit logs'
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and not __fish_seen_subcommand_from list search help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and __fish_seen_subcommand_from list" -l from -d 'Start time' -r
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and __fish_seen_subcommand_from list" -l to -d 'End time' -r
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and __fish_seen_subcommand_from list" -l limit -d 'Maximum results' -r
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and __fish_seen_subcommand_from search" -l query -d 'Search query (required)' -r
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and __fish_seen_subcommand_from search" -l from -d 'Start time' -r
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and __fish_seen_subcommand_from search" -l to -d 'End time' -r
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and __fish_seen_subcommand_from search" -l limit -d 'Maximum results' -r
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and __fish_seen_subcommand_from search" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and __fish_seen_subcommand_from search" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and __fish_seen_subcommand_from search" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and __fish_seen_subcommand_from search" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and __fish_seen_subcommand_from search" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and __fish_seen_subcommand_from search" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and __fish_seen_subcommand_from search" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and __fish_seen_subcommand_from help" -f -a "list" -d 'List recent audit logs'
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and __fish_seen_subcommand_from help" -f -a "search" -d 'Search audit logs'
complete -c pup -n "__fish_pup_using_subcommand audit-logs; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand audit; and not __fish_seen_subcommand_from list search help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand audit; and not __fish_seen_subcommand_from list search help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand audit; and not __fish_seen_subcommand_from list search help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand audit; and not __fish_seen_subcommand_from list search help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand audit; and not __fish_seen_subcommand_from list search help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand audit; and not __fish_seen_subcommand_from list search help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand audit; and not __fish_seen_subcommand_from list search help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand audit; and not __fish_seen_subcommand_from list search help" -f -a "list" -d 'List recent audit logs'
complete -c pup -n "__fish_pup_using_subcommand audit; and not __fish_seen_subcommand_from list search help" -f -a "search" -d 'Search audit logs'
complete -c pup -n "__fish_pup_using_subcommand audit; and not __fish_seen_subcommand_from list search help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand audit; and __fish_seen_subcommand_from list" -l from -d 'Start time' -r
complete -c pup -n "__fish_pup_using_subcommand audit; and __fish_seen_subcommand_from list" -l to -d 'End time' -r
complete -c pup -n "__fish_pup_using_subcommand audit; and __fish_seen_subcommand_from list" -l limit -d 'Maximum results' -r
complete -c pup -n "__fish_pup_using_subcommand audit; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand audit; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand audit; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand audit; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand audit; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand audit; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand audit; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand audit; and __fish_seen_subcommand_from search" -l query -d 'Search query (required)' -r
complete -c pup -n "__fish_pup_using_subcommand audit; and __fish_seen_subcommand_from search" -l from -d 'Start time' -r
complete -c pup -n "__fish_pup_using_subcommand audit; and __fish_seen_subcommand_from search" -l to -d 'End time' -r
complete -c pup -n "__fish_pup_using_subcommand audit; and __fish_seen_subcommand_from search" -l limit -d 'Maximum results' -r
complete -c pup -n "__fish_pup_using_subcommand audit; and __fish_seen_subcommand_from search" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand audit; and __fish_seen_subcommand_from search" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand audit; and __fish_seen_subcommand_from search" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand audit; and __fish_seen_subcommand_from search" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand audit; and __fish_seen_subcommand_from search" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand audit; and __fish_seen_subcommand_from search" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand audit; and __fish_seen_subcommand_from search" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand audit; and __fish_seen_subcommand_from help" -f -a "list" -d 'List recent audit logs'
complete -c pup -n "__fish_pup_using_subcommand audit; and __fish_seen_subcommand_from help" -f -a "search" -d 'Search audit logs'
complete -c pup -n "__fish_pup_using_subcommand audit; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand auth; and not __fish_seen_subcommand_from login logout status refresh list test help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand auth; and not __fish_seen_subcommand_from login logout status refresh list test help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand auth; and not __fish_seen_subcommand_from login logout status refresh list test help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand auth; and not __fish_seen_subcommand_from login logout status refresh list test help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand auth; and not __fish_seen_subcommand_from login logout status refresh list test help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand auth; and not __fish_seen_subcommand_from login logout status refresh list test help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand auth; and not __fish_seen_subcommand_from login logout status refresh list test help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand auth; and not __fish_seen_subcommand_from login logout status refresh list test help" -f -a "login" -d 'Login via OAuth2'
complete -c pup -n "__fish_pup_using_subcommand auth; and not __fish_seen_subcommand_from login logout status refresh list test help" -f -a "logout" -d 'Logout and clear tokens'
complete -c pup -n "__fish_pup_using_subcommand auth; and not __fish_seen_subcommand_from login logout status refresh list test help" -f -a "status" -d 'Check authentication status'
complete -c pup -n "__fish_pup_using_subcommand auth; and not __fish_seen_subcommand_from login logout status refresh list test help" -f -a "refresh" -d 'Refresh access token'
complete -c pup -n "__fish_pup_using_subcommand auth; and not __fish_seen_subcommand_from login logout status refresh list test help" -f -a "list" -d 'List all stored org sessions'
complete -c pup -n "__fish_pup_using_subcommand auth; and not __fish_seen_subcommand_from login logout status refresh list test help" -f -a "test" -d 'Test connection and credentials'
complete -c pup -n "__fish_pup_using_subcommand auth; and not __fish_seen_subcommand_from login logout status refresh list test help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from login" -l scopes -d 'Comma-separated OAuth scopes to request (e.g. dashboards_read,metrics_read). Overrides profile and config file scopes. Unknown scopes are skipped with a warning' -r
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from login" -l site -d 'Datadog site to authenticate against (e.g. datadoghq.eu, us3.datadoghq.com). Overrides DD_SITE env var and config file. Defaults to datadoghq.com' -r
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from login" -l subdomain -d 'Organization subdomain for SAML/SSO login (e.g. mycompany for mycompany.datadoghq.com). Composed against --site, so `--site datad0g.com --subdomain dd` routes to dd.datad0g.com. Whether the consent page narrows to a single org depends on per-tenant SAML routing on the Datadog side; some subdomains still show the org switcher' -r
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from login" -l callback-port -d 'Pin the OAuth callback to one specific port from the DCR redirect allowlist [8000, 8080, 8888, 9000] instead of scanning. Useful when forwarding a single port over SSH. If the chosen port is busy login fails — no fallback. Other values are rejected because the OAuth server will only accept a port that was registered as a redirect URI during Dynamic Client Registration. Falls back to PUP_OAUTH_CALLBACK_PORT if unset' -r
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from login" -l org-uuid -d 'Hint the target org by UUID (sent as `dd_oid`). Skips the org switcher when the existing browser session already matches and pre-routes SAML/SSO routing for first-time logins. The value is persisted with the session so subsequent `pup auth login` invocations re-emit it automatically. The server validates the UUID; malformed values are rejected there' -r
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from login" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from login" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from login" -l read-only -l ro -d 'Request only read-only scopes (excludes write, manage, and org-level scopes). Shorthand: --ro'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from login" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from login" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from login" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from login" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from logout" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from logout" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from logout" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from logout" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from logout" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from logout" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from logout" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from status" -l site -d 'Datadog site to check status for (e.g. datadoghq.eu, us3.datadoghq.com). Overrides DD_SITE env var and config file. Defaults to datadoghq.com' -r
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from status" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from status" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from status" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from status" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from status" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from status" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from status" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from refresh" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from refresh" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from refresh" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from refresh" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from refresh" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from refresh" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from refresh" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from test" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from test" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from test" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from test" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from test" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from test" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from test" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from help" -f -a "login" -d 'Login via OAuth2'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from help" -f -a "logout" -d 'Logout and clear tokens'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from help" -f -a "status" -d 'Check authentication status'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from help" -f -a "refresh" -d 'Refresh access token'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all stored org sessions'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from help" -f -a "test" -d 'Test connection and credentials'
complete -c pup -n "__fish_pup_using_subcommand auth; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and not __fish_seen_subcommand_from list get create update delete help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and not __fish_seen_subcommand_from list get create update delete help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and not __fish_seen_subcommand_from list get create update delete help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and not __fish_seen_subcommand_from list get create update delete help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and not __fish_seen_subcommand_from list get create update delete help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and not __fish_seen_subcommand_from list get create update delete help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and not __fish_seen_subcommand_from list get create update delete help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and not __fish_seen_subcommand_from list get create update delete help" -f -a "list" -d 'List all AuthN mappings'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and not __fish_seen_subcommand_from list get create update delete help" -f -a "get" -d 'Get an AuthN mapping'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and not __fish_seen_subcommand_from list get create update delete help" -f -a "create" -d 'Create an AuthN mapping from JSON'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and not __fish_seen_subcommand_from list get create update delete help" -f -a "update" -d 'Update an AuthN mapping'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and not __fish_seen_subcommand_from list get create update delete help" -f -a "delete" -d 'Delete an AuthN mapping'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and not __fish_seen_subcommand_from list get create update delete help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from get" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from get" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from get" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from get" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from get" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from create" -l file -d 'JSON file with request body (required)' -r
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from create" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from create" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from create" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from create" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from create" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from create" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from update" -l file -d 'JSON file with request body (required)' -r
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from update" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from update" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from update" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from update" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from update" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from update" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from update" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from delete" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from delete" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from delete" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from delete" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from delete" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from delete" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all AuthN mappings'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get an AuthN mapping'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create an AuthN mapping from JSON'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from help" -f -a "update" -d 'Update an AuthN mapping'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete an AuthN mapping'
complete -c pup -n "__fish_pup_using_subcommand authn-mappings; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand bits; and not __fish_seen_subcommand_from ask help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand bits; and not __fish_seen_subcommand_from ask help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand bits; and not __fish_seen_subcommand_from ask help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand bits; and not __fish_seen_subcommand_from ask help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand bits; and not __fish_seen_subcommand_from ask help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand bits; and not __fish_seen_subcommand_from ask help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand bits; and not __fish_seen_subcommand_from ask help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand bits; and not __fish_seen_subcommand_from ask help" -f -a "ask" -d 'Ask Bits AI a natural-language question'
complete -c pup -n "__fish_pup_using_subcommand bits; and not __fish_seen_subcommand_from ask help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand bits; and __fish_seen_subcommand_from ask" -l agent-id -d 'Bits AI agent ID (auto-discovered if omitted)' -r
complete -c pup -n "__fish_pup_using_subcommand bits; and __fish_seen_subcommand_from ask" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand bits; and __fish_seen_subcommand_from ask" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand bits; and __fish_seen_subcommand_from ask" -l no-stream -d 'Collect the full response before printing (disables streaming)'
complete -c pup -n "__fish_pup_using_subcommand bits; and __fish_seen_subcommand_from ask" -s i -l interactive -d 'Start an interactive conversation (Ctrl+D or \'exit\' to quit)'
complete -c pup -n "__fish_pup_using_subcommand bits; and __fish_seen_subcommand_from ask" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand bits; and __fish_seen_subcommand_from ask" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand bits; and __fish_seen_subcommand_from ask" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand bits; and __fish_seen_subcommand_from ask" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand bits; and __fish_seen_subcommand_from ask" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand bits; and __fish_seen_subcommand_from help" -f -a "ask" -d 'Ask Bits AI a natural-language question'
complete -c pup -n "__fish_pup_using_subcommand bits; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand cases; and not __fish_seen_subcommand_from search get create comments timeline archive unarchive assign update-priority update-status projects move update-title update-description jira servicenow help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and not __fish_seen_subcommand_from search get create comments timeline archive unarchive assign update-priority update-status projects move update-title update-description jira servicenow help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and not __fish_seen_subcommand_from search get create comments timeline archive unarchive assign update-priority update-status projects move update-title update-description jira servicenow help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand cases; and not __fish_seen_subcommand_from search get create comments timeline archive unarchive assign update-priority update-status projects move update-title update-description jira servicenow help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand cases; and not __fish_seen_subcommand_from search get create comments timeline archive unarchive assign update-priority update-status projects move update-title update-description jira servicenow help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand cases; and not __fish_seen_subcommand_from search get create comments timeline archive unarchive assign update-priority update-status projects move update-title update-description jira servicenow help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand cases; and not __fish_seen_subcommand_from search get create comments timeline archive unarchive assign update-priority update-status projects move update-title update-description jira servicenow help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand cases; and not __fish_seen_subcommand_from search get create comments timeline archive unarchive assign update-priority update-status projects move update-title update-description jira servicenow help" -f -a "search" -d 'Search cases'
complete -c pup -n "__fish_pup_using_subcommand cases; and not __fish_seen_subcommand_from search get create comments timeline archive unarchive assign update-priority update-status projects move update-title update-description jira servicenow help" -f -a "get" -d 'Get case details'
complete -c pup -n "__fish_pup_using_subcommand cases; and not __fish_seen_subcommand_from search get create comments timeline archive unarchive assign update-priority update-status projects move update-title update-description jira servicenow help" -f -a "create" -d 'Create a new case'
complete -c pup -n "__fish_pup_using_subcommand cases; and not __fish_seen_subcommand_from search get create comments timeline archive unarchive assign update-priority update-status projects move update-title update-description jira servicenow help" -f -a "comments" -d 'Manage comments on a case'
complete -c pup -n "__fish_pup_using_subcommand cases; and not __fish_seen_subcommand_from search get create comments timeline archive unarchive assign update-priority update-status projects move update-title update-description jira servicenow help" -f -a "timeline" -d 'Get the full timeline for a case (comments, attribute updates, etc.)'
complete -c pup -n "__fish_pup_using_subcommand cases; and not __fish_seen_subcommand_from search get create comments timeline archive unarchive assign update-priority update-status projects move update-title update-description jira servicenow help" -f -a "archive" -d 'Archive a case'
complete -c pup -n "__fish_pup_using_subcommand cases; and not __fish_seen_subcommand_from search get create comments timeline archive unarchive assign update-priority update-status projects move update-title update-description jira servicenow help" -f -a "unarchive" -d 'Unarchive a case'
complete -c pup -n "__fish_pup_using_subcommand cases; and not __fish_seen_subcommand_from search get create comments timeline archive unarchive assign update-priority update-status projects move update-title update-description jira servicenow help" -f -a "assign" -d 'Assign a case to a user'
complete -c pup -n "__fish_pup_using_subcommand cases; and not __fish_seen_subcommand_from search get create comments timeline archive unarchive assign update-priority update-status projects move update-title update-description jira servicenow help" -f -a "update-priority" -d 'Update case priority'
complete -c pup -n "__fish_pup_using_subcommand cases; and not __fish_seen_subcommand_from search get create comments timeline archive unarchive assign update-priority update-status projects move update-title update-description jira servicenow help" -f -a "update-status" -d 'Update case status'
complete -c pup -n "__fish_pup_using_subcommand cases; and not __fish_seen_subcommand_from search get create comments timeline archive unarchive assign update-priority update-status projects move update-title update-description jira servicenow help" -f -a "projects" -d 'Manage case projects'
complete -c pup -n "__fish_pup_using_subcommand cases; and not __fish_seen_subcommand_from search get create comments timeline archive unarchive assign update-priority update-status projects move update-title update-description jira servicenow help" -f -a "move" -d 'Move a case to a different project'
complete -c pup -n "__fish_pup_using_subcommand cases; and not __fish_seen_subcommand_from search get create comments timeline archive unarchive assign update-priority update-status projects move update-title update-description jira servicenow help" -f -a "update-title" -d 'Update case title'
complete -c pup -n "__fish_pup_using_subcommand cases; and not __fish_seen_subcommand_from search get create comments timeline archive unarchive assign update-priority update-status projects move update-title update-description jira servicenow help" -f -a "update-description" -d 'Update case description'
complete -c pup -n "__fish_pup_using_subcommand cases; and not __fish_seen_subcommand_from search get create comments timeline archive unarchive assign update-priority update-status projects move update-title update-description jira servicenow help" -f -a "jira" -d 'Manage Jira integrations for cases'
complete -c pup -n "__fish_pup_using_subcommand cases; and not __fish_seen_subcommand_from search get create comments timeline archive unarchive assign update-priority update-status projects move update-title update-description jira servicenow help" -f -a "servicenow" -d 'Manage ServiceNow integrations for cases'
complete -c pup -n "__fish_pup_using_subcommand cases; and not __fish_seen_subcommand_from search get create comments timeline archive unarchive assign update-priority update-status projects move update-title update-description jira servicenow help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from search" -l query -d 'Search query' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from search" -l page-size -d 'Results per page' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from search" -l page-number -d 'Page number (1-indexed)' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from search" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from search" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from search" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from search" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from search" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from search" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from search" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from get" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from get" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from get" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from get" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from get" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from create" -l title -d 'Case title (required)' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from create" -l type-id -d 'Case type UUID (required)' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from create" -l priority -d 'Priority level' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from create" -l description -d 'Case description' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from create" -l project-id -d 'Project UUID to assign the case to (optional)' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from create" -l file -d 'JSON file with request body (required)' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from create" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from create" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from create" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from create" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from create" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from create" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from comments" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from comments" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from comments" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from comments" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from comments" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from comments" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from comments" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from comments" -f -a "list" -d 'List comments on a case'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from comments" -f -a "get" -d 'Get a single comment by ID'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from comments" -f -a "create" -d 'Create a comment on a case'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from comments" -f -a "update" -d 'Update a comment\'s body'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from comments" -f -a "delete" -d 'Delete a comment from a case'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from comments" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from timeline" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from timeline" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from timeline" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from timeline" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from timeline" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from timeline" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from timeline" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from archive" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from archive" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from archive" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from archive" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from archive" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from archive" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from archive" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from unarchive" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from unarchive" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from unarchive" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from unarchive" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from unarchive" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from unarchive" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from unarchive" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from assign" -l user-id -d 'User UUID (required)' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from assign" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from assign" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from assign" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from assign" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from assign" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from assign" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from assign" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-priority" -l priority -d 'New priority (required)' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-priority" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-priority" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-priority" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-priority" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-priority" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-priority" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-priority" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-status" -l status -d 'New status (required)' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-status" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-status" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-status" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-status" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-status" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-status" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-status" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from projects" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from projects" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from projects" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from projects" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from projects" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from projects" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from projects" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from projects" -f -a "list" -d 'List all projects'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from projects" -f -a "get" -d 'Get project details'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from projects" -f -a "create" -d 'Create a new project'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from projects" -f -a "delete" -d 'Delete a project'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from projects" -f -a "update" -d 'Update a project'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from projects" -f -a "notification-rules" -d 'Manage project notification rules'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from projects" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from move" -l project-id -d 'Target project ID (required)' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from move" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from move" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from move" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from move" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from move" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from move" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from move" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-title" -l title -d 'New title (required)' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-title" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-title" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-title" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-title" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-title" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-title" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-title" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-description" -l description -d 'New description (required)' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-description" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-description" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-description" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-description" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-description" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-description" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from update-description" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from jira" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from jira" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from jira" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from jira" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from jira" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from jira" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from jira" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from jira" -f -a "create-issue" -d 'Create a Jira issue for a case'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from jira" -f -a "link" -d 'Link a Jira issue to a case'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from jira" -f -a "unlink" -d 'Unlink a Jira issue from a case'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from jira" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from servicenow" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from servicenow" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from servicenow" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from servicenow" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from servicenow" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from servicenow" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from servicenow" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from servicenow" -f -a "create-ticket" -d 'Create a ServiceNow ticket for a case'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from servicenow" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from help" -f -a "search" -d 'Search cases'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get case details'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a new case'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from help" -f -a "comments" -d 'Manage comments on a case'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from help" -f -a "timeline" -d 'Get the full timeline for a case (comments, attribute updates, etc.)'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from help" -f -a "archive" -d 'Archive a case'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from help" -f -a "unarchive" -d 'Unarchive a case'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from help" -f -a "assign" -d 'Assign a case to a user'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from help" -f -a "update-priority" -d 'Update case priority'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from help" -f -a "update-status" -d 'Update case status'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from help" -f -a "projects" -d 'Manage case projects'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from help" -f -a "move" -d 'Move a case to a different project'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from help" -f -a "update-title" -d 'Update case title'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from help" -f -a "update-description" -d 'Update case description'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from help" -f -a "jira" -d 'Manage Jira integrations for cases'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from help" -f -a "servicenow" -d 'Manage ServiceNow integrations for cases'
complete -c pup -n "__fish_pup_using_subcommand cases; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and not __fish_seen_subcommand_from create get update create-branch decisions help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand change-requests; and not __fish_seen_subcommand_from create get update create-branch decisions help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand change-requests; and not __fish_seen_subcommand_from create get update create-branch decisions help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and not __fish_seen_subcommand_from create get update create-branch decisions help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and not __fish_seen_subcommand_from create get update create-branch decisions help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and not __fish_seen_subcommand_from create get update create-branch decisions help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and not __fish_seen_subcommand_from create get update create-branch decisions help" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and not __fish_seen_subcommand_from create get update create-branch decisions help" -f -a "create" -d 'Create a change request'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and not __fish_seen_subcommand_from create get update create-branch decisions help" -f -a "get" -d 'Get a change request'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and not __fish_seen_subcommand_from create get update create-branch decisions help" -f -a "update" -d 'Update a change request'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and not __fish_seen_subcommand_from create get update create-branch decisions help" -f -a "create-branch" -d 'Create a branch for a change request'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and not __fish_seen_subcommand_from create get update create-branch decisions help" -f -a "decisions" -d 'Manage change request decisions'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and not __fish_seen_subcommand_from create get update create-branch decisions help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from create" -l file -d 'JSON file with request body (required)' -r
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from create" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from create" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from create" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from create" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from create" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from create" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from get" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from get" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from get" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from get" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from get" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from update" -l file -d 'JSON file with request body (required)' -r
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from update" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from update" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from update" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from update" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from update" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from update" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from update" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from create-branch" -l file -d 'JSON file with request body (required)' -r
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from create-branch" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from create-branch" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from create-branch" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from create-branch" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from create-branch" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from create-branch" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from create-branch" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from decisions" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from decisions" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from decisions" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from decisions" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from decisions" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from decisions" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from decisions" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from decisions" -f -a "delete" -d 'Delete a decision'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from decisions" -f -a "update" -d 'Update a decision'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from decisions" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a change request'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get a change request'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from help" -f -a "update" -d 'Update a change request'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from help" -f -a "create-branch" -d 'Create a branch for a change request'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from help" -f -a "decisions" -d 'Manage change request decisions'
complete -c pup -n "__fish_pup_using_subcommand change-requests; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand cicd; and not __fish_seen_subcommand_from pipelines tests events dora flaky-tests help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand cicd; and not __fish_seen_subcommand_from pipelines tests events dora flaky-tests help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand cicd; and not __fish_seen_subcommand_from pipelines tests events dora flaky-tests help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand cicd; and not __fish_seen_subcommand_from pipelines tests events dora flaky-tests help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand cicd; and not __fish_seen_subcommand_from pipelines tests events dora flaky-tests help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand cicd; and not __fish_seen_subcommand_from pipelines tests events dora flaky-tests help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand cicd; and not __fish_seen_subcommand_from pipelines tests events dora flaky-tests help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand cicd; and not __fish_seen_subcommand_from pipelines tests events dora flaky-tests help" -f -a "pipelines" -d 'Manage CI pipelines'
complete -c pup -n "__fish_pup_using_subcommand cicd; and not __fish_seen_subcommand_from pipelines tests events dora flaky-tests help" -f -a "tests" -d 'Query CI test events'
complete -c pup -n "__fish_pup_using_subcommand cicd; and not __fish_seen_subcommand_from pipelines tests events dora flaky-tests help" -f -a "events" -d 'Query CI/CD events'
complete -c pup -n "__fish_pup_using_subcommand cicd; and not __fish_seen_subcommand_from pipelines tests events dora flaky-tests help" -f -a "dora" -d 'Manage DORA metrics'
complete -c pup -n "__fish_pup_using_subcommand cicd; and not __fish_seen_subcommand_from pipelines tests events dora flaky-tests help" -f -a "flaky-tests" -d 'Manage flaky tests'
complete -c pup -n "__fish_pup_using_subcommand cicd; and not __fish_seen_subcommand_from pipelines tests events dora flaky-tests help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from pipelines" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from pipelines" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from pipelines" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from pipelines" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from pipelines" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from pipelines" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from pipelines" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from pipelines" -f -a "list" -d 'List CI pipelines'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from pipelines" -f -a "get" -d 'Get pipeline details'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from pipelines" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from tests" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from tests" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from tests" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from tests" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from tests" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from tests" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from tests" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from tests" -f -a "list" -d 'List CI test events'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from tests" -f -a "search" -d 'Search CI test events'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from tests" -f -a "aggregate" -d 'Aggregate CI test events'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from tests" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from events" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from events" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from events" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from events" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from events" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from events" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from events" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from events" -f -a "search" -d 'Search CI/CD events'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from events" -f -a "aggregate" -d 'Aggregate CI/CD events'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from events" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from dora" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from dora" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from dora" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from dora" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from dora" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from dora" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from dora" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from dora" -f -a "patch-deployment" -d 'Patch a DORA deployment'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from dora" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from flaky-tests" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from flaky-tests" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from flaky-tests" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from flaky-tests" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from flaky-tests" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from flaky-tests" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from flaky-tests" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from flaky-tests" -f -a "search" -d 'Search flaky tests'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from flaky-tests" -f -a "update" -d 'Update flaky tests'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from flaky-tests" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from help" -f -a "pipelines" -d 'Manage CI pipelines'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from help" -f -a "tests" -d 'Query CI test events'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from help" -f -a "events" -d 'Query CI/CD events'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from help" -f -a "dora" -d 'Manage DORA metrics'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from help" -f -a "flaky-tests" -d 'Manage flaky tests'
complete -c pup -n "__fish_pup_using_subcommand cicd; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand cloud; and not __fish_seen_subcommand_from aws gcp azure oci help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand cloud; and not __fish_seen_subcommand_from aws gcp azure oci help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand cloud; and not __fish_seen_subcommand_from aws gcp azure oci help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand cloud; and not __fish_seen_subcommand_from aws gcp azure oci help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand cloud; and not __fish_seen_subcommand_from aws gcp azure oci help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand cloud; and not __fish_seen_subcommand_from aws gcp azure oci help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand cloud; and not __fish_seen_subcommand_from aws gcp azure oci help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand cloud; and not __fish_seen_subcommand_from aws gcp azure oci help" -f -a "aws" -d 'Manage AWS integrations'
complete -c pup -n "__fish_pup_using_subcommand cloud; and not __fish_seen_subcommand_from aws gcp azure oci help" -f -a "gcp" -d 'Manage GCP integrations'
complete -c pup -n "__fish_pup_using_subcommand cloud; and not __fish_seen_subcommand_from aws gcp azure oci help" -f -a "azure" -d 'Manage Azure integrations'
complete -c pup -n "__fish_pup_using_subcommand cloud; and not __fish_seen_subcommand_from aws gcp azure oci help" -f -a "oci" -d 'Manage OCI integrations'
complete -c pup -n "__fish_pup_using_subcommand cloud; and not __fish_seen_subcommand_from aws gcp azure oci help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from aws" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from aws" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from aws" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from aws" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from aws" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from aws" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from aws" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from aws" -f -a "list" -d 'List AWS integrations'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from aws" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from gcp" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from gcp" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from gcp" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from gcp" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from gcp" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from gcp" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from gcp" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from gcp" -f -a "list" -d 'List GCP integrations'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from gcp" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from azure" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from azure" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from azure" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from azure" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from azure" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from azure" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from azure" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from azure" -f -a "list" -d 'List Azure integrations'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from azure" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from oci" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from oci" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from oci" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from oci" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from oci" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from oci" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from oci" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from oci" -f -a "tenancies" -d 'Manage OCI tenancy configurations'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from oci" -f -a "products" -d 'Manage OCI products'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from oci" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from help" -f -a "aws" -d 'Manage AWS integrations'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from help" -f -a "gcp" -d 'Manage GCP integrations'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from help" -f -a "azure" -d 'Manage Azure integrations'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from help" -f -a "oci" -d 'Manage OCI integrations'
complete -c pup -n "__fish_pup_using_subcommand cloud; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and not __fish_seen_subcommand_from branch-summary commit-summary help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and not __fish_seen_subcommand_from branch-summary commit-summary help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and not __fish_seen_subcommand_from branch-summary commit-summary help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and not __fish_seen_subcommand_from branch-summary commit-summary help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and not __fish_seen_subcommand_from branch-summary commit-summary help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and not __fish_seen_subcommand_from branch-summary commit-summary help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and not __fish_seen_subcommand_from branch-summary commit-summary help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and not __fish_seen_subcommand_from branch-summary commit-summary help" -f -a "branch-summary" -d 'Get branch coverage summary'
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and not __fish_seen_subcommand_from branch-summary commit-summary help" -f -a "commit-summary" -d 'Get commit coverage summary'
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and not __fish_seen_subcommand_from branch-summary commit-summary help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and __fish_seen_subcommand_from branch-summary" -l repo -d 'Repository name (required)' -r
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and __fish_seen_subcommand_from branch-summary" -l branch -d 'Branch name (required)' -r
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and __fish_seen_subcommand_from branch-summary" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and __fish_seen_subcommand_from branch-summary" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and __fish_seen_subcommand_from branch-summary" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and __fish_seen_subcommand_from branch-summary" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and __fish_seen_subcommand_from branch-summary" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and __fish_seen_subcommand_from branch-summary" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and __fish_seen_subcommand_from branch-summary" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and __fish_seen_subcommand_from commit-summary" -l repo -d 'Repository name (required)' -r
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and __fish_seen_subcommand_from commit-summary" -l commit -d 'Commit SHA (required)' -r
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and __fish_seen_subcommand_from commit-summary" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and __fish_seen_subcommand_from commit-summary" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and __fish_seen_subcommand_from commit-summary" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and __fish_seen_subcommand_from commit-summary" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and __fish_seen_subcommand_from commit-summary" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and __fish_seen_subcommand_from commit-summary" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and __fish_seen_subcommand_from commit-summary" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and __fish_seen_subcommand_from help" -f -a "branch-summary" -d 'Get branch coverage summary'
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and __fish_seen_subcommand_from help" -f -a "commit-summary" -d 'Get commit coverage summary'
complete -c pup -n "__fish_pup_using_subcommand code-coverage; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand completions" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand completions" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand completions" -l install -d 'Install completions to the default location for the shell'
complete -c pup -n "__fish_pup_using_subcommand completions" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand completions" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand completions" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand completions" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand completions" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand containers; and not __fish_seen_subcommand_from list images help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand containers; and not __fish_seen_subcommand_from list images help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand containers; and not __fish_seen_subcommand_from list images help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand containers; and not __fish_seen_subcommand_from list images help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand containers; and not __fish_seen_subcommand_from list images help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand containers; and not __fish_seen_subcommand_from list images help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand containers; and not __fish_seen_subcommand_from list images help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand containers; and not __fish_seen_subcommand_from list images help" -f -a "list" -d 'List running containers'
complete -c pup -n "__fish_pup_using_subcommand containers; and not __fish_seen_subcommand_from list images help" -f -a "images" -d 'Manage container images'
complete -c pup -n "__fish_pup_using_subcommand containers; and not __fish_seen_subcommand_from list images help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand containers; and __fish_seen_subcommand_from list" -l filter-tags -d 'Comma-separated list of tags to filter containers by' -r
complete -c pup -n "__fish_pup_using_subcommand containers; and __fish_seen_subcommand_from list" -l group-by -d 'Comma-separated list of tags to group containers by' -r
complete -c pup -n "__fish_pup_using_subcommand containers; and __fish_seen_subcommand_from list" -l sort -d 'Attribute to sort containers by' -r
complete -c pup -n "__fish_pup_using_subcommand containers; and __fish_seen_subcommand_from list" -l page-size -d 'Maximum number of results returned' -r
complete -c pup -n "__fish_pup_using_subcommand containers; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand containers; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand containers; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand containers; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand containers; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand containers; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand containers; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand containers; and __fish_seen_subcommand_from images" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand containers; and __fish_seen_subcommand_from images" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand containers; and __fish_seen_subcommand_from images" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand containers; and __fish_seen_subcommand_from images" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand containers; and __fish_seen_subcommand_from images" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand containers; and __fish_seen_subcommand_from images" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand containers; and __fish_seen_subcommand_from images" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand containers; and __fish_seen_subcommand_from images" -f -a "list" -d 'List container images'
complete -c pup -n "__fish_pup_using_subcommand containers; and __fish_seen_subcommand_from images" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand containers; and __fish_seen_subcommand_from help" -f -a "list" -d 'List running containers'
complete -c pup -n "__fish_pup_using_subcommand containers; and __fish_seen_subcommand_from help" -f -a "images" -d 'Manage container images'
complete -c pup -n "__fish_pup_using_subcommand containers; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand costs; and not __fish_seen_subcommand_from datadog ccm oci-configs anomalies help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand costs; and not __fish_seen_subcommand_from datadog ccm oci-configs anomalies help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand costs; and not __fish_seen_subcommand_from datadog ccm oci-configs anomalies help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand costs; and not __fish_seen_subcommand_from datadog ccm oci-configs anomalies help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand costs; and not __fish_seen_subcommand_from datadog ccm oci-configs anomalies help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand costs; and not __fish_seen_subcommand_from datadog ccm oci-configs anomalies help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand costs; and not __fish_seen_subcommand_from datadog ccm oci-configs anomalies help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand costs; and not __fish_seen_subcommand_from datadog ccm oci-configs anomalies help" -f -a "datadog" -d 'Manage Datadog cost and billing data (projected costs, attribution, cloud cost configs)'
complete -c pup -n "__fish_pup_using_subcommand costs; and not __fish_seen_subcommand_from datadog ccm oci-configs anomalies help" -f -a "ccm" -d 'Manage Cloud Cost Management features (custom costs, budgets, commitments, tags)'
complete -c pup -n "__fish_pup_using_subcommand costs; and not __fish_seen_subcommand_from datadog ccm oci-configs anomalies help" -f -a "oci-configs" -d 'Manage OCI (Oracle Cloud Infrastructure) cost configs'
complete -c pup -n "__fish_pup_using_subcommand costs; and not __fish_seen_subcommand_from datadog ccm oci-configs anomalies help" -f -a "anomalies" -d 'Manage Cloud Cost Management anomalies'
complete -c pup -n "__fish_pup_using_subcommand costs; and not __fish_seen_subcommand_from datadog ccm oci-configs anomalies help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from datadog" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from datadog" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from datadog" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from datadog" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from datadog" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from datadog" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from datadog" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from datadog" -f -a "projected" -d 'Get projected end-of-month costs'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from datadog" -f -a "by-org" -d 'Get costs by organization'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from datadog" -f -a "attribution" -d 'Get cost attribution by tags'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from datadog" -f -a "aws-config" -d 'Manage AWS CUR cloud cost configs'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from datadog" -f -a "azure-config" -d 'Manage Azure UC cloud cost configs'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from datadog" -f -a "gcp-config" -d 'Manage GCP usage cost configs'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from datadog" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from ccm" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from ccm" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from ccm" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from ccm" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from ccm" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from ccm" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from ccm" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from ccm" -f -a "custom-costs" -d 'Manage custom cost files'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from ccm" -f -a "tag-descriptions" -d 'Manage tag descriptions'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from ccm" -f -a "tag-metadata" -d 'Query tag metadata and coverage analytics'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from ccm" -f -a "tags" -d 'List cost tags'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from ccm" -f -a "tag-keys" -d 'Manage cost tag keys'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from ccm" -f -a "budgets" -d 'Manage cost budgets'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from ccm" -f -a "commitments" -d 'Query commitment programs (reserved instances, savings plans)'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from ccm" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from oci-configs" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from oci-configs" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from oci-configs" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from oci-configs" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from oci-configs" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from oci-configs" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from oci-configs" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from oci-configs" -f -a "list" -d 'List OCI cost configs'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from oci-configs" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from anomalies" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from anomalies" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from anomalies" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from anomalies" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from anomalies" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from anomalies" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from anomalies" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from anomalies" -f -a "list" -d 'List detected cost anomalies'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from anomalies" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from help" -f -a "datadog" -d 'Manage Datadog cost and billing data (projected costs, attribution, cloud cost configs)'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from help" -f -a "ccm" -d 'Manage Cloud Cost Management features (custom costs, budgets, commitments, tags)'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from help" -f -a "oci-configs" -d 'Manage OCI (Oracle Cloud Infrastructure) cost configs'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from help" -f -a "anomalies" -d 'Manage Cloud Cost Management anomalies'
complete -c pup -n "__fish_pup_using_subcommand costs; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and not __fish_seen_subcommand_from agent-policies agent-rules backend-rules policy help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and not __fish_seen_subcommand_from agent-policies agent-rules backend-rules policy help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and not __fish_seen_subcommand_from agent-policies agent-rules backend-rules policy help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and not __fish_seen_subcommand_from agent-policies agent-rules backend-rules policy help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and not __fish_seen_subcommand_from agent-policies agent-rules backend-rules policy help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and not __fish_seen_subcommand_from agent-policies agent-rules backend-rules policy help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and not __fish_seen_subcommand_from agent-policies agent-rules backend-rules policy help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and not __fish_seen_subcommand_from agent-policies agent-rules backend-rules policy help" -f -a "agent-policies" -d 'Manage CSM Threats agent policies'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and not __fish_seen_subcommand_from agent-policies agent-rules backend-rules policy help" -f -a "agent-rules" -d 'Manage CSM Threats agent rules'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and not __fish_seen_subcommand_from agent-policies agent-rules backend-rules policy help" -f -a "backend-rules" -d 'Manage workload security backend detection rules'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and not __fish_seen_subcommand_from agent-policies agent-rules backend-rules policy help" -f -a "policy" -d 'Manage CSM Threats policy'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and not __fish_seen_subcommand_from agent-policies agent-rules backend-rules policy help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from agent-policies" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from agent-policies" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from agent-policies" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from agent-policies" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from agent-policies" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from agent-policies" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from agent-policies" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from agent-policies" -f -a "list" -d 'List agent policies'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from agent-policies" -f -a "get" -d 'Get an agent policy'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from agent-policies" -f -a "create" -d 'Create an agent policy from JSON'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from agent-policies" -f -a "update" -d 'Update an agent policy'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from agent-policies" -f -a "delete" -d 'Delete an agent policy'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from agent-policies" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from agent-rules" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from agent-rules" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from agent-rules" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from agent-rules" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from agent-rules" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from agent-rules" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from agent-rules" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from agent-rules" -f -a "list" -d 'List agent rules'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from agent-rules" -f -a "get" -d 'Get an agent rule'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from agent-rules" -f -a "create" -d 'Create an agent rule from JSON'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from agent-rules" -f -a "update" -d 'Update an agent rule'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from agent-rules" -f -a "delete" -d 'Delete an agent rule'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from agent-rules" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from backend-rules" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from backend-rules" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from backend-rules" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from backend-rules" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from backend-rules" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from backend-rules" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from backend-rules" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from backend-rules" -f -a "list" -d 'List workload security backend rules'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from backend-rules" -f -a "get" -d 'Get a backend rule'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from backend-rules" -f -a "create" -d 'Create a backend rule from JSON'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from backend-rules" -f -a "update" -d 'Update a backend rule'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from backend-rules" -f -a "delete" -d 'Delete a backend rule'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from backend-rules" -f -a "validate" -d 'Validate a backend rule from JSON'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from backend-rules" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from policy" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from policy" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from policy" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from policy" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from policy" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from policy" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from policy" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from policy" -f -a "download" -d 'Download the CSM threats policy file'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from policy" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from help" -f -a "agent-policies" -d 'Manage CSM Threats agent policies'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from help" -f -a "agent-rules" -d 'Manage CSM Threats agent rules'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from help" -f -a "backend-rules" -d 'Manage workload security backend detection rules'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from help" -f -a "policy" -d 'Manage CSM Threats policy'
complete -c pup -n "__fish_pup_using_subcommand csm-threats; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and not __fish_seen_subcommand_from list get url create update delete widgets annotations help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand dashboards; and not __fish_seen_subcommand_from list get url create update delete widgets annotations help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand dashboards; and not __fish_seen_subcommand_from list get url create update delete widgets annotations help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and not __fish_seen_subcommand_from list get url create update delete widgets annotations help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and not __fish_seen_subcommand_from list get url create update delete widgets annotations help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and not __fish_seen_subcommand_from list get url create update delete widgets annotations help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and not __fish_seen_subcommand_from list get url create update delete widgets annotations help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and not __fish_seen_subcommand_from list get url create update delete widgets annotations help" -f -a "list" -d 'List all dashboards'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and not __fish_seen_subcommand_from list get url create update delete widgets annotations help" -f -a "get" -d 'Get dashboard details'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and not __fish_seen_subcommand_from list get url create update delete widgets annotations help" -f -a "url" -d 'Print dashboard URL, optionally scoped to a live time window'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and not __fish_seen_subcommand_from list get url create update delete widgets annotations help" -f -a "create" -d 'Create a dashboard from JSON file'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and not __fish_seen_subcommand_from list get url create update delete widgets annotations help" -f -a "update" -d 'Update a dashboard from JSON file'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and not __fish_seen_subcommand_from list get url create update delete widgets annotations help" -f -a "delete" -d 'Delete a dashboard'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and not __fish_seen_subcommand_from list get url create update delete widgets annotations help" -f -a "widgets" -d 'Manage saved widgets'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and not __fish_seen_subcommand_from list get url create update delete widgets annotations help" -f -a "annotations" -d 'Manage annotations on dashboard pages'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and not __fish_seen_subcommand_from list get url create update delete widgets annotations help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from get" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from get" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from get" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from get" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from get" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from url" -l from -r
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from url" -l to -r
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from url" -l live -r -f -a "true\t''
false\t''"
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from url" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from url" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from url" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from url" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from url" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from url" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from url" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from create" -l file -r
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from create" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from create" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from create" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from create" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from create" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from create" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from update" -l file -r
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from update" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from update" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from update" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from update" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from update" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from update" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from update" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from delete" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from delete" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from delete" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from delete" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from delete" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from delete" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from widgets" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from widgets" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from widgets" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from widgets" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from widgets" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from widgets" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from widgets" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from widgets" -f -a "list" -d 'Search and list widgets for a given experience type'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from widgets" -f -a "get" -d 'Get a widget by UUID'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from widgets" -f -a "create" -d 'Create a widget from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from widgets" -f -a "update" -d 'Update a widget from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from widgets" -f -a "delete" -d 'Delete a widget by UUID'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from widgets" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from annotations" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from annotations" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from annotations" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from annotations" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from annotations" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from annotations" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from annotations" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from annotations" -f -a "list" -d 'List annotations for a page within a time window'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from annotations" -f -a "get-page" -d 'Get all annotations on a page grouped by widget'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from annotations" -f -a "create" -d 'Create a new annotation from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from annotations" -f -a "update" -d 'Update an existing annotation'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from annotations" -f -a "delete" -d 'Delete an annotation by ID'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from annotations" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all dashboards'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get dashboard details'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from help" -f -a "url" -d 'Print dashboard URL, optionally scoped to a live time window'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a dashboard from JSON file'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from help" -f -a "update" -d 'Update a dashboard from JSON file'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete a dashboard'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from help" -f -a "widgets" -d 'Manage saved widgets'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from help" -f -a "annotations" -d 'Manage annotations on dashboard pages'
complete -c pup -n "__fish_pup_using_subcommand dashboards; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand data-deletion; and not __fish_seen_subcommand_from requests help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand data-deletion; and not __fish_seen_subcommand_from requests help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand data-deletion; and not __fish_seen_subcommand_from requests help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand data-deletion; and not __fish_seen_subcommand_from requests help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand data-deletion; and not __fish_seen_subcommand_from requests help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand data-deletion; and not __fish_seen_subcommand_from requests help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand data-deletion; and not __fish_seen_subcommand_from requests help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand data-deletion; and not __fish_seen_subcommand_from requests help" -f -a "requests" -d 'Manage deletion requests'
complete -c pup -n "__fish_pup_using_subcommand data-deletion; and not __fish_seen_subcommand_from requests help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand data-deletion; and __fish_seen_subcommand_from requests" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand data-deletion; and __fish_seen_subcommand_from requests" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand data-deletion; and __fish_seen_subcommand_from requests" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand data-deletion; and __fish_seen_subcommand_from requests" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand data-deletion; and __fish_seen_subcommand_from requests" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand data-deletion; and __fish_seen_subcommand_from requests" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand data-deletion; and __fish_seen_subcommand_from requests" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand data-deletion; and __fish_seen_subcommand_from requests" -f -a "list" -d 'List data deletion requests'
complete -c pup -n "__fish_pup_using_subcommand data-deletion; and __fish_seen_subcommand_from requests" -f -a "create" -d 'Create a data deletion request from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand data-deletion; and __fish_seen_subcommand_from requests" -f -a "cancel" -d 'Cancel a data deletion request'
complete -c pup -n "__fish_pup_using_subcommand data-deletion; and __fish_seen_subcommand_from requests" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand data-deletion; and __fish_seen_subcommand_from help" -f -a "requests" -d 'Manage deletion requests'
complete -c pup -n "__fish_pup_using_subcommand data-deletion; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand data-governance; and not __fish_seen_subcommand_from scanner help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand data-governance; and not __fish_seen_subcommand_from scanner help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand data-governance; and not __fish_seen_subcommand_from scanner help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand data-governance; and not __fish_seen_subcommand_from scanner help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand data-governance; and not __fish_seen_subcommand_from scanner help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand data-governance; and not __fish_seen_subcommand_from scanner help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand data-governance; and not __fish_seen_subcommand_from scanner help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand data-governance; and not __fish_seen_subcommand_from scanner help" -f -a "scanner" -d 'Manage sensitive data scanner'
complete -c pup -n "__fish_pup_using_subcommand data-governance; and not __fish_seen_subcommand_from scanner help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand data-governance; and __fish_seen_subcommand_from scanner" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand data-governance; and __fish_seen_subcommand_from scanner" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand data-governance; and __fish_seen_subcommand_from scanner" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand data-governance; and __fish_seen_subcommand_from scanner" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand data-governance; and __fish_seen_subcommand_from scanner" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand data-governance; and __fish_seen_subcommand_from scanner" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand data-governance; and __fish_seen_subcommand_from scanner" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand data-governance; and __fish_seen_subcommand_from scanner" -f -a "rules" -d 'Manage scanning rules'
complete -c pup -n "__fish_pup_using_subcommand data-governance; and __fish_seen_subcommand_from scanner" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand data-governance; and __fish_seen_subcommand_from help" -f -a "scanner" -d 'Manage sensitive data scanner'
complete -c pup -n "__fish_pup_using_subcommand data-governance; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand datasets; and not __fish_seen_subcommand_from list get create update delete help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand datasets; and not __fish_seen_subcommand_from list get create update delete help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand datasets; and not __fish_seen_subcommand_from list get create update delete help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand datasets; and not __fish_seen_subcommand_from list get create update delete help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand datasets; and not __fish_seen_subcommand_from list get create update delete help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand datasets; and not __fish_seen_subcommand_from list get create update delete help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand datasets; and not __fish_seen_subcommand_from list get create update delete help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand datasets; and not __fish_seen_subcommand_from list get create update delete help" -f -a "list" -d 'List all datasets'
complete -c pup -n "__fish_pup_using_subcommand datasets; and not __fish_seen_subcommand_from list get create update delete help" -f -a "get" -d 'Get a dataset by ID'
complete -c pup -n "__fish_pup_using_subcommand datasets; and not __fish_seen_subcommand_from list get create update delete help" -f -a "create" -d 'Create a dataset from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand datasets; and not __fish_seen_subcommand_from list get create update delete help" -f -a "update" -d 'Update a dataset from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand datasets; and not __fish_seen_subcommand_from list get create update delete help" -f -a "delete" -d 'Delete a dataset'
complete -c pup -n "__fish_pup_using_subcommand datasets; and not __fish_seen_subcommand_from list get create update delete help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from get" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from get" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from get" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from get" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from get" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from create" -l file -r
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from create" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from create" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from create" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from create" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from create" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from create" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from update" -l file -r
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from update" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from update" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from update" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from update" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from update" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from update" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from update" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from delete" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from delete" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from delete" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from delete" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from delete" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from delete" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all datasets'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get a dataset by ID'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a dataset from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from help" -f -a "update" -d 'Update a dataset from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete a dataset'
complete -c pup -n "__fish_pup_using_subcommand datasets; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand dbm; and not __fish_seen_subcommand_from samples help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand dbm; and not __fish_seen_subcommand_from samples help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand dbm; and not __fish_seen_subcommand_from samples help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand dbm; and not __fish_seen_subcommand_from samples help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand dbm; and not __fish_seen_subcommand_from samples help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand dbm; and not __fish_seen_subcommand_from samples help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand dbm; and not __fish_seen_subcommand_from samples help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand dbm; and not __fish_seen_subcommand_from samples help" -f -a "samples" -d 'Manage DBM query samples'
complete -c pup -n "__fish_pup_using_subcommand dbm; and not __fish_seen_subcommand_from samples help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand dbm; and __fish_seen_subcommand_from samples" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand dbm; and __fish_seen_subcommand_from samples" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand dbm; and __fish_seen_subcommand_from samples" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand dbm; and __fish_seen_subcommand_from samples" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand dbm; and __fish_seen_subcommand_from samples" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand dbm; and __fish_seen_subcommand_from samples" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand dbm; and __fish_seen_subcommand_from samples" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand dbm; and __fish_seen_subcommand_from samples" -f -a "search" -d 'Search DBM query samples'
complete -c pup -n "__fish_pup_using_subcommand dbm; and __fish_seen_subcommand_from samples" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand dbm; and __fish_seen_subcommand_from help" -f -a "samples" -d 'Manage DBM query samples'
complete -c pup -n "__fish_pup_using_subcommand dbm; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and not __fish_seen_subcommand_from table time-series spec schema help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand ddsql; and not __fish_seen_subcommand_from table time-series spec schema help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand ddsql; and not __fish_seen_subcommand_from table time-series spec schema help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and not __fish_seen_subcommand_from table time-series spec schema help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and not __fish_seen_subcommand_from table time-series spec schema help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and not __fish_seen_subcommand_from table time-series spec schema help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and not __fish_seen_subcommand_from table time-series spec schema help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and not __fish_seen_subcommand_from table time-series spec schema help" -f -a "table" -d 'Execute DDSQL query and return columnar table data'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and not __fish_seen_subcommand_from table time-series spec schema help" -f -a "time-series" -d 'Execute DDSQL query and return time series data'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and not __fish_seen_subcommand_from table time-series spec schema help" -f -a "spec" -d 'Print DDSQL reference guidance from the editor tooling'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and not __fish_seen_subcommand_from table time-series spec schema help" -f -a "schema" -d 'Discover DDSQL tables and columns'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and not __fish_seen_subcommand_from table time-series spec schema help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from table" -l query -d 'DDSQL query string, or use --query - to read from stdin' -r
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from table" -l from -d 'Start time (e.g., 1h, 30m, 7d, now, unix timestamp)' -r
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from table" -l to -d 'End time' -r
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from table" -l interval -d 'Aggregation interval in milliseconds (default: 60000)' -r
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from table" -l limit -d 'Maximum number of rows to return' -r
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from table" -l offset -d 'Number of rows to skip (for pagination)' -r
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from table" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from table" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from table" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from table" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from table" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from table" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from table" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from time-series" -l query -d 'DDSQL query string, or use --query - to read from stdin' -r
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from time-series" -l from -d 'Start time' -r
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from time-series" -l to -d 'End time' -r
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from time-series" -l interval -d 'Aggregation interval in milliseconds (default: 60000)' -r
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from time-series" -l limit -d 'Maximum number of rows to return' -r
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from time-series" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from time-series" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from time-series" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from time-series" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from time-series" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from time-series" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from time-series" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from spec" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from spec" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from spec" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from spec" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from spec" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from spec" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from spec" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from schema" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from schema" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from schema" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from schema" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from schema" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from schema" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from schema" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from schema" -f -a "tables" -d 'List DDSQL tables visible to your org'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from schema" -f -a "columns" -d 'Show columns for a DDSQL table'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from schema" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from help" -f -a "table" -d 'Execute DDSQL query and return columnar table data'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from help" -f -a "time-series" -d 'Execute DDSQL query and return time series data'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from help" -f -a "spec" -d 'Print DDSQL reference guidance from the editor tooling'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from help" -f -a "schema" -d 'Discover DDSQL tables and columns'
complete -c pup -n "__fish_pup_using_subcommand ddsql; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand debugger; and not __fish_seen_subcommand_from probes context help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand debugger; and not __fish_seen_subcommand_from probes context help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand debugger; and not __fish_seen_subcommand_from probes context help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand debugger; and not __fish_seen_subcommand_from probes context help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand debugger; and not __fish_seen_subcommand_from probes context help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand debugger; and not __fish_seen_subcommand_from probes context help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand debugger; and not __fish_seen_subcommand_from probes context help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand debugger; and not __fish_seen_subcommand_from probes context help" -f -a "probes" -d 'Manage Live Debugger log probes'
complete -c pup -n "__fish_pup_using_subcommand debugger; and not __fish_seen_subcommand_from probes context help" -f -a "context" -d 'Show service debugger context (environments, probe support, language features)'
complete -c pup -n "__fish_pup_using_subcommand debugger; and not __fish_seen_subcommand_from probes context help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand debugger; and __fish_seen_subcommand_from probes" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand debugger; and __fish_seen_subcommand_from probes" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand debugger; and __fish_seen_subcommand_from probes" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand debugger; and __fish_seen_subcommand_from probes" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand debugger; and __fish_seen_subcommand_from probes" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand debugger; and __fish_seen_subcommand_from probes" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand debugger; and __fish_seen_subcommand_from probes" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand debugger; and __fish_seen_subcommand_from probes" -f -a "list" -d 'List log probes'
complete -c pup -n "__fish_pup_using_subcommand debugger; and __fish_seen_subcommand_from probes" -f -a "get" -d 'Get log probe details'
complete -c pup -n "__fish_pup_using_subcommand debugger; and __fish_seen_subcommand_from probes" -f -a "create" -d 'Create a log probe'
complete -c pup -n "__fish_pup_using_subcommand debugger; and __fish_seen_subcommand_from probes" -f -a "delete" -d 'Delete a log probe'
complete -c pup -n "__fish_pup_using_subcommand debugger; and __fish_seen_subcommand_from probes" -f -a "watch" -d 'Watch probe events (log data + status errors)'
complete -c pup -n "__fish_pup_using_subcommand debugger; and __fish_seen_subcommand_from probes" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand debugger; and __fish_seen_subcommand_from context" -l env -d 'Filter to a specific environment' -r
complete -c pup -n "__fish_pup_using_subcommand debugger; and __fish_seen_subcommand_from context" -l fields -d 'Comma-separated fields: service, language, envs, repo' -r
complete -c pup -n "__fish_pup_using_subcommand debugger; and __fish_seen_subcommand_from context" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand debugger; and __fish_seen_subcommand_from context" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand debugger; and __fish_seen_subcommand_from context" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand debugger; and __fish_seen_subcommand_from context" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand debugger; and __fish_seen_subcommand_from context" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand debugger; and __fish_seen_subcommand_from context" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand debugger; and __fish_seen_subcommand_from context" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand debugger; and __fish_seen_subcommand_from help" -f -a "probes" -d 'Manage Live Debugger log probes'
complete -c pup -n "__fish_pup_using_subcommand debugger; and __fish_seen_subcommand_from help" -f -a "context" -d 'Show service debugger context (environments, probe support, language features)'
complete -c pup -n "__fish_pup_using_subcommand debugger; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and not __fish_seen_subcommand_from gates evaluations rules help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and not __fish_seen_subcommand_from gates evaluations rules help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and not __fish_seen_subcommand_from gates evaluations rules help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and not __fish_seen_subcommand_from gates evaluations rules help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and not __fish_seen_subcommand_from gates evaluations rules help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and not __fish_seen_subcommand_from gates evaluations rules help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and not __fish_seen_subcommand_from gates evaluations rules help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and not __fish_seen_subcommand_from gates evaluations rules help" -f -a "gates" -d 'Manage deployment gates (CRUD)'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and not __fish_seen_subcommand_from gates evaluations rules help" -f -a "evaluations" -d 'Manage deployment gate evaluations'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and not __fish_seen_subcommand_from gates evaluations rules help" -f -a "rules" -d 'Manage deployment gate rules'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and not __fish_seen_subcommand_from gates evaluations rules help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from gates" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from gates" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from gates" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from gates" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from gates" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from gates" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from gates" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from gates" -f -a "list" -d 'List all deployment gates'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from gates" -f -a "get" -d 'Get a deployment gate by ID'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from gates" -f -a "create" -d 'Create a deployment gate from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from gates" -f -a "update" -d 'Update a deployment gate from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from gates" -f -a "delete" -d 'Delete a deployment gate'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from gates" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from evaluations" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from evaluations" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from evaluations" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from evaluations" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from evaluations" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from evaluations" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from evaluations" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from evaluations" -f -a "get" -d 'Get a deployment gates evaluation result by evaluation ID (UUID)'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from evaluations" -f -a "trigger" -d 'Trigger a deployment gates evaluation from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from evaluations" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from rules" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from rules" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from rules" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from rules" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from rules" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from rules" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from rules" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from rules" -f -a "list" -d 'List rules for a deployment gate'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from rules" -f -a "get" -d 'Get a specific deployment rule'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from rules" -f -a "create" -d 'Create a deployment rule from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from rules" -f -a "update" -d 'Update a deployment rule from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from rules" -f -a "delete" -d 'Delete a deployment rule'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from rules" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from help" -f -a "gates" -d 'Manage deployment gates (CRUD)'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from help" -f -a "evaluations" -d 'Manage deployment gate evaluations'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from help" -f -a "rules" -d 'Manage deployment gate rules'
complete -c pup -n "__fish_pup_using_subcommand deployment-gates; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand docs; and not __fish_seen_subcommand_from ask help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand docs; and not __fish_seen_subcommand_from ask help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand docs; and not __fish_seen_subcommand_from ask help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand docs; and not __fish_seen_subcommand_from ask help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand docs; and not __fish_seen_subcommand_from ask help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand docs; and not __fish_seen_subcommand_from ask help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand docs; and not __fish_seen_subcommand_from ask help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand docs; and not __fish_seen_subcommand_from ask help" -f -a "ask" -d 'Ask the Datadog Docs AI a natural-language question'
complete -c pup -n "__fish_pup_using_subcommand docs; and not __fish_seen_subcommand_from ask help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand docs; and __fish_seen_subcommand_from ask" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand docs; and __fish_seen_subcommand_from ask" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand docs; and __fish_seen_subcommand_from ask" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand docs; and __fish_seen_subcommand_from ask" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand docs; and __fish_seen_subcommand_from ask" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand docs; and __fish_seen_subcommand_from ask" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand docs; and __fish_seen_subcommand_from ask" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand docs; and __fish_seen_subcommand_from help" -f -a "ask" -d 'Ask the Datadog Docs AI a natural-language question'
complete -c pup -n "__fish_pup_using_subcommand docs; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand downtime; and not __fish_seen_subcommand_from list get create cancel help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand downtime; and not __fish_seen_subcommand_from list get create cancel help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand downtime; and not __fish_seen_subcommand_from list get create cancel help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand downtime; and not __fish_seen_subcommand_from list get create cancel help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand downtime; and not __fish_seen_subcommand_from list get create cancel help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand downtime; and not __fish_seen_subcommand_from list get create cancel help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand downtime; and not __fish_seen_subcommand_from list get create cancel help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand downtime; and not __fish_seen_subcommand_from list get create cancel help" -f -a "list" -d 'List all downtimes'
complete -c pup -n "__fish_pup_using_subcommand downtime; and not __fish_seen_subcommand_from list get create cancel help" -f -a "get" -d 'Get downtime details'
complete -c pup -n "__fish_pup_using_subcommand downtime; and not __fish_seen_subcommand_from list get create cancel help" -f -a "create" -d 'Create a downtime from JSON file'
complete -c pup -n "__fish_pup_using_subcommand downtime; and not __fish_seen_subcommand_from list get create cancel help" -f -a "cancel" -d 'Cancel a downtime'
complete -c pup -n "__fish_pup_using_subcommand downtime; and not __fish_seen_subcommand_from list get create cancel help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from get" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from get" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from get" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from get" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from get" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from create" -l file -r
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from create" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from create" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from create" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from create" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from create" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from create" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from cancel" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from cancel" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from cancel" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from cancel" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from cancel" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from cancel" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from cancel" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all downtimes'
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get downtime details'
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a downtime from JSON file'
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from help" -f -a "cancel" -d 'Cancel a downtime'
complete -c pup -n "__fish_pup_using_subcommand downtime; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand error-tracking; and not __fish_seen_subcommand_from issues help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand error-tracking; and not __fish_seen_subcommand_from issues help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand error-tracking; and not __fish_seen_subcommand_from issues help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand error-tracking; and not __fish_seen_subcommand_from issues help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand error-tracking; and not __fish_seen_subcommand_from issues help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand error-tracking; and not __fish_seen_subcommand_from issues help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand error-tracking; and not __fish_seen_subcommand_from issues help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand error-tracking; and not __fish_seen_subcommand_from issues help" -f -a "issues" -d 'Manage error issues'
complete -c pup -n "__fish_pup_using_subcommand error-tracking; and not __fish_seen_subcommand_from issues help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand error-tracking; and __fish_seen_subcommand_from issues" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand error-tracking; and __fish_seen_subcommand_from issues" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand error-tracking; and __fish_seen_subcommand_from issues" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand error-tracking; and __fish_seen_subcommand_from issues" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand error-tracking; and __fish_seen_subcommand_from issues" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand error-tracking; and __fish_seen_subcommand_from issues" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand error-tracking; and __fish_seen_subcommand_from issues" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand error-tracking; and __fish_seen_subcommand_from issues" -f -a "search" -d 'Search error issues'
complete -c pup -n "__fish_pup_using_subcommand error-tracking; and __fish_seen_subcommand_from issues" -f -a "get" -d 'Get issue details'
complete -c pup -n "__fish_pup_using_subcommand error-tracking; and __fish_seen_subcommand_from issues" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand error-tracking; and __fish_seen_subcommand_from help" -f -a "issues" -d 'Manage error issues'
complete -c pup -n "__fish_pup_using_subcommand error-tracking; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand events; and not __fish_seen_subcommand_from list search get help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand events; and not __fish_seen_subcommand_from list search get help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand events; and not __fish_seen_subcommand_from list search get help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand events; and not __fish_seen_subcommand_from list search get help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand events; and not __fish_seen_subcommand_from list search get help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand events; and not __fish_seen_subcommand_from list search get help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand events; and not __fish_seen_subcommand_from list search get help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand events; and not __fish_seen_subcommand_from list search get help" -f -a "list" -d 'List recent events'
complete -c pup -n "__fish_pup_using_subcommand events; and not __fish_seen_subcommand_from list search get help" -f -a "search" -d 'Search events'
complete -c pup -n "__fish_pup_using_subcommand events; and not __fish_seen_subcommand_from list search get help" -f -a "get" -d 'Get event details'
complete -c pup -n "__fish_pup_using_subcommand events; and not __fish_seen_subcommand_from list search get help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from list" -l from -d 'Start time (1h, 30m, 7d, Unix timestamp, or RFC3339)' -r
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from list" -l to -d 'End time (now, Unix timestamp, or RFC3339)' -r
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from list" -l filter -d 'Filter query' -r
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from list" -l tags -d 'Filter by tags' -r
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from search" -l query -d 'Search query' -r
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from search" -l from -d 'Start time' -r
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from search" -l to -d 'End time' -r
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from search" -l limit -d 'Maximum results' -r
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from search" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from search" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from search" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from search" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from search" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from search" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from search" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from get" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from get" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from get" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from get" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from get" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from help" -f -a "list" -d 'List recent events'
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from help" -f -a "search" -d 'Search events'
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get event details'
complete -c pup -n "__fish_pup_using_subcommand events; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand extension; and not __fish_seen_subcommand_from list install remove upgrade help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand extension; and not __fish_seen_subcommand_from list install remove upgrade help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand extension; and not __fish_seen_subcommand_from list install remove upgrade help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand extension; and not __fish_seen_subcommand_from list install remove upgrade help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand extension; and not __fish_seen_subcommand_from list install remove upgrade help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand extension; and not __fish_seen_subcommand_from list install remove upgrade help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand extension; and not __fish_seen_subcommand_from list install remove upgrade help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand extension; and not __fish_seen_subcommand_from list install remove upgrade help" -f -a "list" -d 'List installed extensions'
complete -c pup -n "__fish_pup_using_subcommand extension; and not __fish_seen_subcommand_from list install remove upgrade help" -f -a "install" -d 'Install an extension'
complete -c pup -n "__fish_pup_using_subcommand extension; and not __fish_seen_subcommand_from list install remove upgrade help" -f -a "remove" -d 'Remove an installed extension'
complete -c pup -n "__fish_pup_using_subcommand extension; and not __fish_seen_subcommand_from list install remove upgrade help" -f -a "upgrade" -d 'Upgrade an extension to the latest version'
complete -c pup -n "__fish_pup_using_subcommand extension; and not __fish_seen_subcommand_from list install remove upgrade help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from install" -l tag -d 'Install a specific release tag (GitHub only)' -r
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from install" -l name -d 'Extension name (auto-derived from source if omitted)' -r
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from install" -l description -d 'Short description shown in `pup help`' -r
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from install" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from install" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from install" -l local -d 'Install from a local file path'
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from install" -l link -d 'Symlink instead of copy (with --local)'
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from install" -l force -d 'Overwrite an existing extension'
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from install" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from install" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from install" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from install" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from install" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from remove" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from remove" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from remove" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from remove" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from remove" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from remove" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from remove" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from upgrade" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from upgrade" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from upgrade" -l all -d 'Upgrade all installed extensions'
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from upgrade" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from upgrade" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from upgrade" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from upgrade" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from upgrade" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from help" -f -a "list" -d 'List installed extensions'
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from help" -f -a "install" -d 'Install an extension'
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from help" -f -a "remove" -d 'Remove an installed extension'
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from help" -f -a "upgrade" -d 'Upgrade an extension to the latest version'
complete -c pup -n "__fish_pup_using_subcommand extension; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and not __fish_seen_subcommand_from flags environments allocations exposure enable disable help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and not __fish_seen_subcommand_from flags environments allocations exposure enable disable help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and not __fish_seen_subcommand_from flags environments allocations exposure enable disable help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and not __fish_seen_subcommand_from flags environments allocations exposure enable disable help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and not __fish_seen_subcommand_from flags environments allocations exposure enable disable help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and not __fish_seen_subcommand_from flags environments allocations exposure enable disable help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and not __fish_seen_subcommand_from flags environments allocations exposure enable disable help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and not __fish_seen_subcommand_from flags environments allocations exposure enable disable help" -f -a "flags" -d 'Manage feature flag definitions'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and not __fish_seen_subcommand_from flags environments allocations exposure enable disable help" -f -a "environments" -d 'Manage feature flag environments'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and not __fish_seen_subcommand_from flags environments allocations exposure enable disable help" -f -a "allocations" -d 'Manage traffic allocations for a feature flag in an environment'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and not __fish_seen_subcommand_from flags environments allocations exposure enable disable help" -f -a "exposure" -d 'Manage exposure schedules for a feature flag'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and not __fish_seen_subcommand_from flags environments allocations exposure enable disable help" -f -a "enable" -d 'Enable a feature flag in an environment'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and not __fish_seen_subcommand_from flags environments allocations exposure enable disable help" -f -a "disable" -d 'Disable a feature flag in an environment'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and not __fish_seen_subcommand_from flags environments allocations exposure enable disable help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from flags" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from flags" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from flags" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from flags" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from flags" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from flags" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from flags" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from flags" -f -a "list" -d 'List feature flags'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from flags" -f -a "get" -d 'Get a feature flag'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from flags" -f -a "create" -d 'Create a feature flag from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from flags" -f -a "update" -d 'Update a feature flag'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from flags" -f -a "archive" -d 'Archive a feature flag'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from flags" -f -a "unarchive" -d 'Unarchive a feature flag'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from flags" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from environments" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from environments" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from environments" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from environments" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from environments" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from environments" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from environments" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from environments" -f -a "list" -d 'List feature flag environments'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from environments" -f -a "get" -d 'Get a feature flag environment'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from environments" -f -a "create" -d 'Create a feature flag environment from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from environments" -f -a "update" -d 'Update a feature flag environment'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from environments" -f -a "delete" -d 'Delete a feature flag environment'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from environments" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from allocations" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from allocations" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from allocations" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from allocations" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from allocations" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from allocations" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from allocations" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from allocations" -f -a "create" -d 'Create allocations for a feature flag in an environment'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from allocations" -f -a "update" -d 'Update (overwrite) allocations for a feature flag in an environment'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from allocations" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from exposure" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from exposure" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from exposure" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from exposure" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from exposure" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from exposure" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from exposure" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from exposure" -f -a "start" -d 'Start an exposure schedule'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from exposure" -f -a "stop" -d 'Stop an exposure schedule'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from exposure" -f -a "pause" -d 'Pause an exposure schedule'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from exposure" -f -a "resume" -d 'Resume an exposure schedule'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from exposure" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from enable" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from enable" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from enable" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from enable" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from enable" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from enable" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from enable" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from disable" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from disable" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from disable" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from disable" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from disable" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from disable" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from disable" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from help" -f -a "flags" -d 'Manage feature flag definitions'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from help" -f -a "environments" -d 'Manage feature flag environments'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from help" -f -a "allocations" -d 'Manage traffic allocations for a feature flag in an environment'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from help" -f -a "exposure" -d 'Manage exposure schedules for a feature flag'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from help" -f -a "enable" -d 'Enable a feature flag in an environment'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from help" -f -a "disable" -d 'Disable a feature flag in an environment'
complete -c pup -n "__fish_pup_using_subcommand feature-flags; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand fleet; and not __fish_seen_subcommand_from agents deployments schedules clusters tracers instrumented-pods help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand fleet; and not __fish_seen_subcommand_from agents deployments schedules clusters tracers instrumented-pods help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand fleet; and not __fish_seen_subcommand_from agents deployments schedules clusters tracers instrumented-pods help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand fleet; and not __fish_seen_subcommand_from agents deployments schedules clusters tracers instrumented-pods help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand fleet; and not __fish_seen_subcommand_from agents deployments schedules clusters tracers instrumented-pods help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand fleet; and not __fish_seen_subcommand_from agents deployments schedules clusters tracers instrumented-pods help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand fleet; and not __fish_seen_subcommand_from agents deployments schedules clusters tracers instrumented-pods help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand fleet; and not __fish_seen_subcommand_from agents deployments schedules clusters tracers instrumented-pods help" -f -a "agents" -d 'Manage fleet agents'
complete -c pup -n "__fish_pup_using_subcommand fleet; and not __fish_seen_subcommand_from agents deployments schedules clusters tracers instrumented-pods help" -f -a "deployments" -d 'Manage fleet deployments'
complete -c pup -n "__fish_pup_using_subcommand fleet; and not __fish_seen_subcommand_from agents deployments schedules clusters tracers instrumented-pods help" -f -a "schedules" -d 'Manage fleet schedules'
complete -c pup -n "__fish_pup_using_subcommand fleet; and not __fish_seen_subcommand_from agents deployments schedules clusters tracers instrumented-pods help" -f -a "clusters" -d 'Manage fleet clusters'
complete -c pup -n "__fish_pup_using_subcommand fleet; and not __fish_seen_subcommand_from agents deployments schedules clusters tracers instrumented-pods help" -f -a "tracers" -d 'Manage fleet tracers'
complete -c pup -n "__fish_pup_using_subcommand fleet; and not __fish_seen_subcommand_from agents deployments schedules clusters tracers instrumented-pods help" -f -a "instrumented-pods" -d 'Manage fleet instrumented pods'
complete -c pup -n "__fish_pup_using_subcommand fleet; and not __fish_seen_subcommand_from agents deployments schedules clusters tracers instrumented-pods help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from agents" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from agents" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from agents" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from agents" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from agents" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from agents" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from agents" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from agents" -f -a "list" -d 'List fleet agents'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from agents" -f -a "get" -d 'Get fleet agent details'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from agents" -f -a "versions" -d 'List available agent versions'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from agents" -f -a "tracers" -d 'List tracers for a specific agent'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from agents" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from deployments" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from deployments" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from deployments" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from deployments" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from deployments" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from deployments" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from deployments" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from deployments" -f -a "list" -d 'List fleet deployments'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from deployments" -f -a "get" -d 'Get fleet deployment details'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from deployments" -f -a "cancel" -d 'Cancel a fleet deployment'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from deployments" -f -a "configure" -d 'Create a configuration deployment'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from deployments" -f -a "upgrade" -d 'Create an upgrade deployment'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from deployments" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from schedules" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from schedules" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from schedules" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from schedules" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from schedules" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from schedules" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from schedules" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from schedules" -f -a "list" -d 'List fleet schedules'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from schedules" -f -a "get" -d 'Get fleet schedule details'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from schedules" -f -a "create" -d 'Create a fleet schedule'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from schedules" -f -a "update" -d 'Update a fleet schedule'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from schedules" -f -a "delete" -d 'Delete a fleet schedule'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from schedules" -f -a "trigger" -d 'Trigger a fleet schedule'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from schedules" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from clusters" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from clusters" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from clusters" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from clusters" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from clusters" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from clusters" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from clusters" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from clusters" -f -a "list" -d 'List Kubernetes clusters in the fleet'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from clusters" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from tracers" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from tracers" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from tracers" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from tracers" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from tracers" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from tracers" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from tracers" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from tracers" -f -a "list" -d 'List tracers across the fleet'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from tracers" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from instrumented-pods" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from instrumented-pods" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from instrumented-pods" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from instrumented-pods" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from instrumented-pods" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from instrumented-pods" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from instrumented-pods" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from instrumented-pods" -f -a "list" -d 'List instrumented pods in a Kubernetes cluster'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from instrumented-pods" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from help" -f -a "agents" -d 'Manage fleet agents'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from help" -f -a "deployments" -d 'Manage fleet deployments'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from help" -f -a "schedules" -d 'Manage fleet schedules'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from help" -f -a "clusters" -d 'Manage fleet clusters'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from help" -f -a "tracers" -d 'Manage fleet tracers'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from help" -f -a "instrumented-pods" -d 'Manage fleet instrumented pods'
complete -c pup -n "__fish_pup_using_subcommand fleet; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand format" -l input -d 'Read JSON from file, or use "-" (default) for stdin' -r
complete -c pup -n "__fish_pup_using_subcommand format" -l count -d 'Set metadata.count in the agent-mode envelope' -r
complete -c pup -n "__fish_pup_using_subcommand format" -l command -d 'Set metadata.command in the agent-mode envelope' -r
complete -c pup -n "__fish_pup_using_subcommand format" -l next-action -d 'Set metadata.next_action in the agent-mode envelope' -r
complete -c pup -n "__fish_pup_using_subcommand format" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand format" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand format" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand format" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand format" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand format" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand format" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand fmt" -l input -d 'Read JSON from file, or use "-" (default) for stdin' -r
complete -c pup -n "__fish_pup_using_subcommand fmt" -l count -d 'Set metadata.count in the agent-mode envelope' -r
complete -c pup -n "__fish_pup_using_subcommand fmt" -l command -d 'Set metadata.command in the agent-mode envelope' -r
complete -c pup -n "__fish_pup_using_subcommand fmt" -l next-action -d 'Set metadata.next_action in the agent-mode envelope' -r
complete -c pup -n "__fish_pup_using_subcommand fmt" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand fmt" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand fmt" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand fmt" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand fmt" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand fmt" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand fmt" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand hamr; and not __fish_seen_subcommand_from connections help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand hamr; and not __fish_seen_subcommand_from connections help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand hamr; and not __fish_seen_subcommand_from connections help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand hamr; and not __fish_seen_subcommand_from connections help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand hamr; and not __fish_seen_subcommand_from connections help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand hamr; and not __fish_seen_subcommand_from connections help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand hamr; and not __fish_seen_subcommand_from connections help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand hamr; and not __fish_seen_subcommand_from connections help" -f -a "connections" -d 'Manage HAMR organization connections'
complete -c pup -n "__fish_pup_using_subcommand hamr; and not __fish_seen_subcommand_from connections help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand hamr; and __fish_seen_subcommand_from connections" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand hamr; and __fish_seen_subcommand_from connections" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand hamr; and __fish_seen_subcommand_from connections" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand hamr; and __fish_seen_subcommand_from connections" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand hamr; and __fish_seen_subcommand_from connections" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand hamr; and __fish_seen_subcommand_from connections" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand hamr; and __fish_seen_subcommand_from connections" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand hamr; and __fish_seen_subcommand_from connections" -f -a "get" -d 'Get HAMR organization connection'
complete -c pup -n "__fish_pup_using_subcommand hamr; and __fish_seen_subcommand_from connections" -f -a "create" -d 'Create HAMR organization connection'
complete -c pup -n "__fish_pup_using_subcommand hamr; and __fish_seen_subcommand_from connections" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand hamr; and __fish_seen_subcommand_from help" -f -a "connections" -d 'Manage HAMR organization connections'
complete -c pup -n "__fish_pup_using_subcommand hamr; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand idp; and not __fish_seen_subcommand_from assist find owner deps register migrate-schema help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand idp; and not __fish_seen_subcommand_from assist find owner deps register migrate-schema help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand idp; and not __fish_seen_subcommand_from assist find owner deps register migrate-schema help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand idp; and not __fish_seen_subcommand_from assist find owner deps register migrate-schema help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand idp; and not __fish_seen_subcommand_from assist find owner deps register migrate-schema help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand idp; and not __fish_seen_subcommand_from assist find owner deps register migrate-schema help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand idp; and not __fish_seen_subcommand_from assist find owner deps register migrate-schema help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand idp; and not __fish_seen_subcommand_from assist find owner deps register migrate-schema help" -f -a "assist" -d 'Get full context summary with suggested next actions'
complete -c pup -n "__fish_pup_using_subcommand idp; and not __fish_seen_subcommand_from assist find owner deps register migrate-schema help" -f -a "find" -d 'Find entities by name or query'
complete -c pup -n "__fish_pup_using_subcommand idp; and not __fish_seen_subcommand_from assist find owner deps register migrate-schema help" -f -a "owner" -d 'Resolve ownership, team details, and on-call context'
complete -c pup -n "__fish_pup_using_subcommand idp; and not __fish_seen_subcommand_from assist find owner deps register migrate-schema help" -f -a "deps" -d 'Show upstream and downstream service dependencies'
complete -c pup -n "__fish_pup_using_subcommand idp; and not __fish_seen_subcommand_from assist find owner deps register migrate-schema help" -f -a "register" -d 'Register a service definition from a YAML file'
complete -c pup -n "__fish_pup_using_subcommand idp; and not __fish_seen_subcommand_from assist find owner deps register migrate-schema help" -f -a "migrate-schema" -d 'Migrate a service catalog YAML file to v3 schema'
complete -c pup -n "__fish_pup_using_subcommand idp; and not __fish_seen_subcommand_from assist find owner deps register migrate-schema help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from assist" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from assist" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from assist" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from assist" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from assist" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from assist" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from assist" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from find" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from find" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from find" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from find" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from find" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from find" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from find" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from owner" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from owner" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from owner" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from owner" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from owner" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from owner" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from owner" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from deps" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from deps" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from deps" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from deps" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from deps" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from deps" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from deps" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from register" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from register" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from register" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from register" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from register" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from register" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from register" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from migrate-schema" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from migrate-schema" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from migrate-schema" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from migrate-schema" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from migrate-schema" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from migrate-schema" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from migrate-schema" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from help" -f -a "assist" -d 'Get full context summary with suggested next actions'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from help" -f -a "find" -d 'Find entities by name or query'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from help" -f -a "owner" -d 'Resolve ownership, team details, and on-call context'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from help" -f -a "deps" -d 'Show upstream and downstream service dependencies'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from help" -f -a "register" -d 'Register a service definition from a YAML file'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from help" -f -a "migrate-schema" -d 'Migrate a service catalog YAML file to v3 schema'
complete -c pup -n "__fish_pup_using_subcommand idp; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand incidents; and not __fish_seen_subcommand_from list get attachments settings handles postmortem-templates services import help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand incidents; and not __fish_seen_subcommand_from list get attachments settings handles postmortem-templates services import help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand incidents; and not __fish_seen_subcommand_from list get attachments settings handles postmortem-templates services import help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand incidents; and not __fish_seen_subcommand_from list get attachments settings handles postmortem-templates services import help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand incidents; and not __fish_seen_subcommand_from list get attachments settings handles postmortem-templates services import help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand incidents; and not __fish_seen_subcommand_from list get attachments settings handles postmortem-templates services import help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand incidents; and not __fish_seen_subcommand_from list get attachments settings handles postmortem-templates services import help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand incidents; and not __fish_seen_subcommand_from list get attachments settings handles postmortem-templates services import help" -f -a "list" -d 'List all incidents'
complete -c pup -n "__fish_pup_using_subcommand incidents; and not __fish_seen_subcommand_from list get attachments settings handles postmortem-templates services import help" -f -a "get" -d 'Get incident details'
complete -c pup -n "__fish_pup_using_subcommand incidents; and not __fish_seen_subcommand_from list get attachments settings handles postmortem-templates services import help" -f -a "attachments" -d 'Manage incident attachments'
complete -c pup -n "__fish_pup_using_subcommand incidents; and not __fish_seen_subcommand_from list get attachments settings handles postmortem-templates services import help" -f -a "settings" -d 'Manage global incident settings'
complete -c pup -n "__fish_pup_using_subcommand incidents; and not __fish_seen_subcommand_from list get attachments settings handles postmortem-templates services import help" -f -a "handles" -d 'Manage global incident handles'
complete -c pup -n "__fish_pup_using_subcommand incidents; and not __fish_seen_subcommand_from list get attachments settings handles postmortem-templates services import help" -f -a "postmortem-templates" -d 'Manage incident postmortem templates'
complete -c pup -n "__fish_pup_using_subcommand incidents; and not __fish_seen_subcommand_from list get attachments settings handles postmortem-templates services import help" -f -a "services" -d 'Manage incident services'
complete -c pup -n "__fish_pup_using_subcommand incidents; and not __fish_seen_subcommand_from list get attachments settings handles postmortem-templates services import help" -f -a "import" -d 'Import an incident'
complete -c pup -n "__fish_pup_using_subcommand incidents; and not __fish_seen_subcommand_from list get attachments settings handles postmortem-templates services import help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from list" -l query -d 'Filter incidents using Datadog incidents search syntax (e.g., \'state:resolved\', \'severity:SEV-2\', \'state:(active OR stable)\'). Defaults to \'state:active\'.' -r
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from list" -l limit -r
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from get" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from get" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from get" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from get" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from get" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from attachments" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from attachments" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from attachments" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from attachments" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from attachments" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from attachments" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from attachments" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from attachments" -f -a "list" -d 'List incident attachments'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from attachments" -f -a "delete" -d 'Delete an incident attachment'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from attachments" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from settings" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from settings" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from settings" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from settings" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from settings" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from settings" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from settings" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from settings" -f -a "get" -d 'Get global incident settings'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from settings" -f -a "update" -d 'Update global incident settings'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from settings" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from handles" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from handles" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from handles" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from handles" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from handles" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from handles" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from handles" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from handles" -f -a "list" -d 'List global incident handles'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from handles" -f -a "create" -d 'Create global incident handle'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from handles" -f -a "update" -d 'Update global incident handle'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from handles" -f -a "delete" -d 'Delete global incident handle'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from handles" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from postmortem-templates" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from postmortem-templates" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from postmortem-templates" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from postmortem-templates" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from postmortem-templates" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from postmortem-templates" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from postmortem-templates" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from postmortem-templates" -f -a "list" -d 'List postmortem templates'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from postmortem-templates" -f -a "get" -d 'Get postmortem template'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from postmortem-templates" -f -a "create" -d 'Create postmortem template'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from postmortem-templates" -f -a "update" -d 'Update postmortem template'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from postmortem-templates" -f -a "delete" -d 'Delete postmortem template'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from postmortem-templates" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from services" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from services" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from services" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from services" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from services" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from services" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from services" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from services" -f -a "list" -d 'List incident services'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from services" -f -a "get" -d 'Get incident service details'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from services" -f -a "create" -d 'Create an incident service from JSON'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from services" -f -a "update" -d 'Update an incident service'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from services" -f -a "delete" -d 'Delete an incident service'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from services" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from import" -l file -d 'JSON file with request body (required)' -r
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from import" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from import" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from import" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from import" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from import" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from import" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from import" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all incidents'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get incident details'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from help" -f -a "attachments" -d 'Manage incident attachments'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from help" -f -a "settings" -d 'Manage global incident settings'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from help" -f -a "handles" -d 'Manage global incident handles'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from help" -f -a "postmortem-templates" -d 'Manage incident postmortem templates'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from help" -f -a "services" -d 'Manage incident services'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from help" -f -a "import" -d 'Import an incident'
complete -c pup -n "__fish_pup_using_subcommand incidents; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand infrastructure; and not __fish_seen_subcommand_from hosts help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand infrastructure; and not __fish_seen_subcommand_from hosts help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand infrastructure; and not __fish_seen_subcommand_from hosts help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand infrastructure; and not __fish_seen_subcommand_from hosts help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand infrastructure; and not __fish_seen_subcommand_from hosts help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand infrastructure; and not __fish_seen_subcommand_from hosts help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand infrastructure; and not __fish_seen_subcommand_from hosts help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand infrastructure; and not __fish_seen_subcommand_from hosts help" -f -a "hosts" -d 'Manage hosts'
complete -c pup -n "__fish_pup_using_subcommand infrastructure; and not __fish_seen_subcommand_from hosts help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand infrastructure; and __fish_seen_subcommand_from hosts" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand infrastructure; and __fish_seen_subcommand_from hosts" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand infrastructure; and __fish_seen_subcommand_from hosts" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand infrastructure; and __fish_seen_subcommand_from hosts" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand infrastructure; and __fish_seen_subcommand_from hosts" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand infrastructure; and __fish_seen_subcommand_from hosts" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand infrastructure; and __fish_seen_subcommand_from hosts" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand infrastructure; and __fish_seen_subcommand_from hosts" -f -a "list" -d 'List hosts'
complete -c pup -n "__fish_pup_using_subcommand infrastructure; and __fish_seen_subcommand_from hosts" -f -a "get" -d 'Get host details'
complete -c pup -n "__fish_pup_using_subcommand infrastructure; and __fish_seen_subcommand_from hosts" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand infrastructure; and __fish_seen_subcommand_from help" -f -a "hosts" -d 'Manage hosts'
complete -c pup -n "__fish_pup_using_subcommand infrastructure; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand integrations; and not __fish_seen_subcommand_from list jira servicenow slack pagerduty webhooks google-chat ms-teams aws help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand integrations; and not __fish_seen_subcommand_from list jira servicenow slack pagerduty webhooks google-chat ms-teams aws help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand integrations; and not __fish_seen_subcommand_from list jira servicenow slack pagerduty webhooks google-chat ms-teams aws help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand integrations; and not __fish_seen_subcommand_from list jira servicenow slack pagerduty webhooks google-chat ms-teams aws help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand integrations; and not __fish_seen_subcommand_from list jira servicenow slack pagerduty webhooks google-chat ms-teams aws help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand integrations; and not __fish_seen_subcommand_from list jira servicenow slack pagerduty webhooks google-chat ms-teams aws help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand integrations; and not __fish_seen_subcommand_from list jira servicenow slack pagerduty webhooks google-chat ms-teams aws help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand integrations; and not __fish_seen_subcommand_from list jira servicenow slack pagerduty webhooks google-chat ms-teams aws help" -f -a "list" -d 'List all configured integrations'
complete -c pup -n "__fish_pup_using_subcommand integrations; and not __fish_seen_subcommand_from list jira servicenow slack pagerduty webhooks google-chat ms-teams aws help" -f -a "jira" -d 'Manage Jira integration'
complete -c pup -n "__fish_pup_using_subcommand integrations; and not __fish_seen_subcommand_from list jira servicenow slack pagerduty webhooks google-chat ms-teams aws help" -f -a "servicenow" -d 'Manage ServiceNow integration'
complete -c pup -n "__fish_pup_using_subcommand integrations; and not __fish_seen_subcommand_from list jira servicenow slack pagerduty webhooks google-chat ms-teams aws help" -f -a "slack" -d 'Manage Slack integration'
complete -c pup -n "__fish_pup_using_subcommand integrations; and not __fish_seen_subcommand_from list jira servicenow slack pagerduty webhooks google-chat ms-teams aws help" -f -a "pagerduty" -d 'Manage PagerDuty integration'
complete -c pup -n "__fish_pup_using_subcommand integrations; and not __fish_seen_subcommand_from list jira servicenow slack pagerduty webhooks google-chat ms-teams aws help" -f -a "webhooks" -d 'Manage webhooks'
complete -c pup -n "__fish_pup_using_subcommand integrations; and not __fish_seen_subcommand_from list jira servicenow slack pagerduty webhooks google-chat ms-teams aws help" -f -a "google-chat" -d 'Manage Google Chat integration'
complete -c pup -n "__fish_pup_using_subcommand integrations; and not __fish_seen_subcommand_from list jira servicenow slack pagerduty webhooks google-chat ms-teams aws help" -f -a "ms-teams" -d 'Manage Microsoft Teams integration'
complete -c pup -n "__fish_pup_using_subcommand integrations; and not __fish_seen_subcommand_from list jira servicenow slack pagerduty webhooks google-chat ms-teams aws help" -f -a "aws" -d 'Manage AWS integrations'
complete -c pup -n "__fish_pup_using_subcommand integrations; and not __fish_seen_subcommand_from list jira servicenow slack pagerduty webhooks google-chat ms-teams aws help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from jira" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from jira" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from jira" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from jira" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from jira" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from jira" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from jira" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from jira" -f -a "accounts" -d 'Manage Jira accounts'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from jira" -f -a "templates" -d 'Manage Jira issue templates'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from jira" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from servicenow" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from servicenow" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from servicenow" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from servicenow" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from servicenow" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from servicenow" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from servicenow" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from servicenow" -f -a "instances" -d 'Manage ServiceNow instances'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from servicenow" -f -a "templates" -d 'Manage ServiceNow templates'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from servicenow" -f -a "users" -d 'Manage ServiceNow users'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from servicenow" -f -a "assignment-groups" -d 'Manage ServiceNow assignment groups'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from servicenow" -f -a "business-services" -d 'Manage ServiceNow business services'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from servicenow" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from slack" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from slack" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from slack" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from slack" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from slack" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from slack" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from slack" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from slack" -f -a "list" -d 'List Slack channels'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from slack" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from pagerduty" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from pagerduty" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from pagerduty" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from pagerduty" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from pagerduty" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from pagerduty" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from pagerduty" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from pagerduty" -f -a "list" -d 'List PagerDuty services'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from pagerduty" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from webhooks" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from webhooks" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from webhooks" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from webhooks" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from webhooks" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from webhooks" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from webhooks" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from webhooks" -f -a "list" -d 'List webhooks'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from webhooks" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from google-chat" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from google-chat" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from google-chat" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from google-chat" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from google-chat" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from google-chat" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from google-chat" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from google-chat" -f -a "handles" -d 'Manage organization handles'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from google-chat" -f -a "space-get" -d 'Get a space by display name'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from google-chat" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from ms-teams" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from ms-teams" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from ms-teams" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from ms-teams" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from ms-teams" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from ms-teams" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from ms-teams" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from ms-teams" -f -a "handles" -d 'Manage tenant-based handles'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from ms-teams" -f -a "channel-get" -d 'Get a channel by tenant, team, and channel name'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from ms-teams" -f -a "workflows" -d 'Manage Workflows webhook handles'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from ms-teams" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from aws" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from aws" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from aws" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from aws" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from aws" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from aws" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from aws" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from aws" -f -a "cloud-auth" -d 'Manage AWS cloud authentication'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from aws" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all configured integrations'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from help" -f -a "jira" -d 'Manage Jira integration'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from help" -f -a "servicenow" -d 'Manage ServiceNow integration'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from help" -f -a "slack" -d 'Manage Slack integration'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from help" -f -a "pagerduty" -d 'Manage PagerDuty integration'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from help" -f -a "webhooks" -d 'Manage webhooks'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from help" -f -a "google-chat" -d 'Manage Google Chat integration'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from help" -f -a "ms-teams" -d 'Manage Microsoft Teams integration'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from help" -f -a "aws" -d 'Manage AWS integrations'
complete -c pup -n "__fish_pup_using_subcommand integrations; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand investigations; and not __fish_seen_subcommand_from list get trigger help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand investigations; and not __fish_seen_subcommand_from list get trigger help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand investigations; and not __fish_seen_subcommand_from list get trigger help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand investigations; and not __fish_seen_subcommand_from list get trigger help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand investigations; and not __fish_seen_subcommand_from list get trigger help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand investigations; and not __fish_seen_subcommand_from list get trigger help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand investigations; and not __fish_seen_subcommand_from list get trigger help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand investigations; and not __fish_seen_subcommand_from list get trigger help" -f -a "list" -d 'List investigations'
complete -c pup -n "__fish_pup_using_subcommand investigations; and not __fish_seen_subcommand_from list get trigger help" -f -a "get" -d 'Get investigation details'
complete -c pup -n "__fish_pup_using_subcommand investigations; and not __fish_seen_subcommand_from list get trigger help" -f -a "trigger" -d 'Trigger a new investigation'
complete -c pup -n "__fish_pup_using_subcommand investigations; and not __fish_seen_subcommand_from list get trigger help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from list" -l page-limit -d 'Page size' -r
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from list" -l page-offset -d 'Pagination offset' -r
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from list" -l monitor-id -d 'Filter by monitor ID' -r
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from get" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from get" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from get" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from get" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from get" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from trigger" -l type -d 'Investigation type: monitor_alert (required)' -r
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from trigger" -l monitor-id -d 'Monitor ID (required for monitor_alert)' -r
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from trigger" -l event-id -d 'Event ID (required for monitor_alert)' -r
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from trigger" -l event-ts -d 'Event timestamp in milliseconds (required for monitor_alert)' -r
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from trigger" -l file -d 'JSON file with request body' -r
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from trigger" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from trigger" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from trigger" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from trigger" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from trigger" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from trigger" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from trigger" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from help" -f -a "list" -d 'List investigations'
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get investigation details'
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from help" -f -a "trigger" -d 'Trigger a new investigation'
complete -c pup -n "__fish_pup_using_subcommand investigations; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand kafka; and not __fish_seen_subcommand_from topic-configs broker-configs client-configs read-messages subject-schemas help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand kafka; and not __fish_seen_subcommand_from topic-configs broker-configs client-configs read-messages subject-schemas help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand kafka; and not __fish_seen_subcommand_from topic-configs broker-configs client-configs read-messages subject-schemas help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand kafka; and not __fish_seen_subcommand_from topic-configs broker-configs client-configs read-messages subject-schemas help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand kafka; and not __fish_seen_subcommand_from topic-configs broker-configs client-configs read-messages subject-schemas help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand kafka; and not __fish_seen_subcommand_from topic-configs broker-configs client-configs read-messages subject-schemas help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand kafka; and not __fish_seen_subcommand_from topic-configs broker-configs client-configs read-messages subject-schemas help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand kafka; and not __fish_seen_subcommand_from topic-configs broker-configs client-configs read-messages subject-schemas help" -f -a "topic-configs" -d 'Get Kafka topic configuration versions'
complete -c pup -n "__fish_pup_using_subcommand kafka; and not __fish_seen_subcommand_from topic-configs broker-configs client-configs read-messages subject-schemas help" -f -a "broker-configs" -d 'Get Kafka broker configuration versions'
complete -c pup -n "__fish_pup_using_subcommand kafka; and not __fish_seen_subcommand_from topic-configs broker-configs client-configs read-messages subject-schemas help" -f -a "client-configs" -d 'Get Kafka client (producer/consumer) configuration'
complete -c pup -n "__fish_pup_using_subcommand kafka; and not __fish_seen_subcommand_from topic-configs broker-configs client-configs read-messages subject-schemas help" -f -a "read-messages" -d 'Read messages from a Kafka cluster / topic via the Datadog Agent'
complete -c pup -n "__fish_pup_using_subcommand kafka; and not __fish_seen_subcommand_from topic-configs broker-configs client-configs read-messages subject-schemas help" -f -a "subject-schemas" -d 'Get all Schema Registry versions for a subject on a cluster'
complete -c pup -n "__fish_pup_using_subcommand kafka; and not __fish_seen_subcommand_from topic-configs broker-configs client-configs read-messages subject-schemas help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from topic-configs" -l kafka-cluster-id -d 'Kafka cluster ID' -r
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from topic-configs" -l topic -d 'Kafka topic name' -r
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from topic-configs" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from topic-configs" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from topic-configs" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from topic-configs" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from topic-configs" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from topic-configs" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from topic-configs" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from broker-configs" -l kafka-cluster-id -d 'Kafka cluster ID' -r
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from broker-configs" -l broker-id -d 'Broker ID' -r
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from broker-configs" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from broker-configs" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from broker-configs" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from broker-configs" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from broker-configs" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from broker-configs" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from broker-configs" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from client-configs" -l kafka-cluster-id -d 'Kafka cluster ID' -r
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from client-configs" -l service -d 'Service to fetch configs for in the form `name:producer` or `name:consumer`. May be repeated' -r
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from client-configs" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from client-configs" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from client-configs" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from client-configs" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from client-configs" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from client-configs" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from client-configs" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from read-messages" -l cluster -d 'Kafka cluster ID' -r
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from read-messages" -l topic -d 'Kafka topic name' -r
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from read-messages" -l bootstrap-servers -d 'Bootstrap servers (host:port,...)' -r
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from read-messages" -l partition -d 'Partition to read from (omit for all)' -r
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from read-messages" -l start-offset -d 'Offset to start reading from' -r
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from read-messages" -l start-timestamp -d 'Start timestamp (unix ms); overrides start_offset' -r
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from read-messages" -l n-messages-retrieved -d 'Max messages to return (<=100)' -r
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from read-messages" -l max-scanned-messages -d 'Max messages to scan (<=10000)' -r
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from read-messages" -l filter -d 'Optional jq-style filter expression evaluated agent-side against each deserialized message. The message context exposes top-level fields .key, .value, .headers, .topic, .partition, .offset, and .timestamp; navigate nested fields with dotted paths (e.g. .value.user.country). Supported operators: ==, !=, >, <, >=, <=, contains. Combine with \' and \' / \' or \' (or has higher precedence; or is split first). String literals must be quoted with " or \'. Numeric literals are parsed as int/float. A bare path (no operator) is an existence check — true when the field resolves to a non-null value. Examples:   \'.value.status == "failed"\'   \'.value.amount > 100\'   \'.headers.tenant == "acme" and .value.priority >= 5\'   \'.value.tags contains "urgent"\'   \'.value.error\' (existence)' -r
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from read-messages" -l consumer-group-id -d 'Consumer group ID to use' -r
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from read-messages" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from read-messages" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from read-messages" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from read-messages" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from read-messages" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from read-messages" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from read-messages" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from subject-schemas" -l kafka-cluster-id -d 'Kafka cluster ID' -r
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from subject-schemas" -l subject -d 'Schema Registry subject name' -r
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from subject-schemas" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from subject-schemas" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from subject-schemas" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from subject-schemas" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from subject-schemas" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from subject-schemas" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from subject-schemas" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from help" -f -a "topic-configs" -d 'Get Kafka topic configuration versions'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from help" -f -a "broker-configs" -d 'Get Kafka broker configuration versions'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from help" -f -a "client-configs" -d 'Get Kafka client (producer/consumer) configuration'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from help" -f -a "read-messages" -d 'Read messages from a Kafka cluster / topic via the Datadog Agent'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from help" -f -a "subject-schemas" -d 'Get all Schema Registry versions for a subject on a cluster'
complete -c pup -n "__fish_pup_using_subcommand kafka; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and not __fish_seen_subcommand_from projects experiments datasets spans annotation-queues eval-config evals help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and not __fish_seen_subcommand_from projects experiments datasets spans annotation-queues eval-config evals help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and not __fish_seen_subcommand_from projects experiments datasets spans annotation-queues eval-config evals help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and not __fish_seen_subcommand_from projects experiments datasets spans annotation-queues eval-config evals help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and not __fish_seen_subcommand_from projects experiments datasets spans annotation-queues eval-config evals help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and not __fish_seen_subcommand_from projects experiments datasets spans annotation-queues eval-config evals help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and not __fish_seen_subcommand_from projects experiments datasets spans annotation-queues eval-config evals help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and not __fish_seen_subcommand_from projects experiments datasets spans annotation-queues eval-config evals help" -f -a "projects" -d 'Manage LLM Observability projects'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and not __fish_seen_subcommand_from projects experiments datasets spans annotation-queues eval-config evals help" -f -a "experiments" -d 'Manage LLM Observability experiments'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and not __fish_seen_subcommand_from projects experiments datasets spans annotation-queues eval-config evals help" -f -a "datasets" -d 'Manage LLM Observability datasets'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and not __fish_seen_subcommand_from projects experiments datasets spans annotation-queues eval-config evals help" -f -a "spans" -d 'Search LLM Observability spans'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and not __fish_seen_subcommand_from projects experiments datasets spans annotation-queues eval-config evals help" -f -a "annotation-queues" -d 'Manage LLM Observability annotation queues'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and not __fish_seen_subcommand_from projects experiments datasets spans annotation-queues eval-config evals help" -f -a "eval-config" -d 'Manage LLM Observability custom evaluator configs'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and not __fish_seen_subcommand_from projects experiments datasets spans annotation-queues eval-config evals help" -f -a "evals" -d 'List LLM Observability evaluators'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and not __fish_seen_subcommand_from projects experiments datasets spans annotation-queues eval-config evals help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from projects" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from projects" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from projects" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from projects" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from projects" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from projects" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from projects" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from projects" -f -a "create" -d 'Create a new LLM Obs project'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from projects" -f -a "list" -d 'List LLM Obs projects'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from projects" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from experiments" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from experiments" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from experiments" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from experiments" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from experiments" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from experiments" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from experiments" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from experiments" -f -a "create" -d 'Create a new LLM Obs experiment'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from experiments" -f -a "list" -d 'List LLM Obs experiments'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from experiments" -f -a "update" -d 'Update an existing LLM Obs experiment'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from experiments" -f -a "delete" -d 'Delete LLM Obs experiments (provide IDs in a JSON file)'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from experiments" -f -a "summary" -d 'Get a summary of an experiment (event counts, metrics, available dimensions)'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from experiments" -f -a "events" -d 'Query events from an experiment with optional filtering and sorting'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from experiments" -f -a "metric-values" -d 'Get metric stats for an experiment, optionally segmented by a dimension'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from experiments" -f -a "dimension-values" -d 'Get unique values for a dimension across experiment events'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from experiments" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from datasets" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from datasets" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from datasets" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from datasets" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from datasets" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from datasets" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from datasets" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from datasets" -f -a "create" -d 'Create a new LLM Obs dataset'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from datasets" -f -a "list" -d 'List LLM Obs datasets for a project'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from datasets" -f -a "batch-update" -d 'Batch insert, update, and delete records in a dataset'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from datasets" -f -a "clone" -d 'Clone a dataset into a new dataset'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from datasets" -f -a "restore" -d 'Restore a dataset to a previous version'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from datasets" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from spans" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from spans" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from spans" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from spans" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from spans" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from spans" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from spans" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from spans" -f -a "search" -d 'Search LLM Observability spans'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from spans" -f -a "get-trace" -d 'Get the full trace structure as a span hierarchy tree'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from spans" -f -a "get-details" -d 'Get detailed metadata for one or more spans'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from spans" -f -a "get-content" -d 'Get content fields for a span (input, output, messages, documents, metadata)'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from spans" -f -a "find-errors" -d 'Find all error spans within a trace'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from spans" -f -a "expand" -d 'Expand children of spans for progressive tree exploration'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from spans" -f -a "get-agent-loop" -d 'Get the chronological agent execution loop for a trace'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from spans" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from annotation-queues" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from annotation-queues" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from annotation-queues" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from annotation-queues" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from annotation-queues" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from annotation-queues" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from annotation-queues" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from annotation-queues" -f -a "create" -d 'Create an annotation queue'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from annotation-queues" -f -a "list" -d 'List annotation queues'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from annotation-queues" -f -a "update" -d 'Update an annotation queue'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from annotation-queues" -f -a "delete" -d 'Delete an annotation queue'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from annotation-queues" -f -a "interactions" -d 'Manage interactions within an annotation queue'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from annotation-queues" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from eval-config" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from eval-config" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from eval-config" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from eval-config" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from eval-config" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from eval-config" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from eval-config" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from eval-config" -f -a "get" -d 'Get a custom evaluator config by name'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from eval-config" -f -a "update" -d 'Create or update a custom evaluator config by name'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from eval-config" -f -a "delete" -d 'Delete a custom evaluator config by name'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from eval-config" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from evals" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from evals" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from evals" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from evals" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from evals" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from evals" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from evals" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from evals" -f -a "list" -d 'List all evaluators configured for this org'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from evals" -f -a "list-by-ml-app" -d 'List evaluators for a specific ML app'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from evals" -f -a "get-evaluator" -d 'Get full evaluator configuration (span filters, sampling, scope) via MCP endpoint'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from evals" -f -a "get-aggregate-stats" -d 'Get pass/fail rates and score distributions for an evaluator over a time window'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from evals" -f -a "create-or-update" -d 'Create or fully replace an LLM-judge evaluator config (full replace semantics)'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from evals" -f -a "delete" -d 'Delete an evaluator by name'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from evals" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from help" -f -a "projects" -d 'Manage LLM Observability projects'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from help" -f -a "experiments" -d 'Manage LLM Observability experiments'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from help" -f -a "datasets" -d 'Manage LLM Observability datasets'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from help" -f -a "spans" -d 'Search LLM Observability spans'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from help" -f -a "annotation-queues" -d 'Manage LLM Observability annotation queues'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from help" -f -a "eval-config" -d 'Manage LLM Observability custom evaluator configs'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from help" -f -a "evals" -d 'List LLM Observability evaluators'
complete -c pup -n "__fish_pup_using_subcommand llm-obs; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand logs; and not __fish_seen_subcommand_from search list query aggregate archives custom-destinations metrics restriction-queries help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and not __fish_seen_subcommand_from search list query aggregate archives custom-destinations metrics restriction-queries help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and not __fish_seen_subcommand_from search list query aggregate archives custom-destinations metrics restriction-queries help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand logs; and not __fish_seen_subcommand_from search list query aggregate archives custom-destinations metrics restriction-queries help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand logs; and not __fish_seen_subcommand_from search list query aggregate archives custom-destinations metrics restriction-queries help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand logs; and not __fish_seen_subcommand_from search list query aggregate archives custom-destinations metrics restriction-queries help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand logs; and not __fish_seen_subcommand_from search list query aggregate archives custom-destinations metrics restriction-queries help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand logs; and not __fish_seen_subcommand_from search list query aggregate archives custom-destinations metrics restriction-queries help" -f -a "search" -d 'Search logs (v1 API)'
complete -c pup -n "__fish_pup_using_subcommand logs; and not __fish_seen_subcommand_from search list query aggregate archives custom-destinations metrics restriction-queries help" -f -a "list" -d 'List logs (v2 API)'
complete -c pup -n "__fish_pup_using_subcommand logs; and not __fish_seen_subcommand_from search list query aggregate archives custom-destinations metrics restriction-queries help" -f -a "query" -d 'Query logs (v2 API)'
complete -c pup -n "__fish_pup_using_subcommand logs; and not __fish_seen_subcommand_from search list query aggregate archives custom-destinations metrics restriction-queries help" -f -a "aggregate" -d 'Aggregate logs (v2 API)'
complete -c pup -n "__fish_pup_using_subcommand logs; and not __fish_seen_subcommand_from search list query aggregate archives custom-destinations metrics restriction-queries help" -f -a "archives" -d 'Manage log archives'
complete -c pup -n "__fish_pup_using_subcommand logs; and not __fish_seen_subcommand_from search list query aggregate archives custom-destinations metrics restriction-queries help" -f -a "custom-destinations" -d 'Manage custom log destinations'
complete -c pup -n "__fish_pup_using_subcommand logs; and not __fish_seen_subcommand_from search list query aggregate archives custom-destinations metrics restriction-queries help" -f -a "metrics" -d 'Manage log-based metrics'
complete -c pup -n "__fish_pup_using_subcommand logs; and not __fish_seen_subcommand_from search list query aggregate archives custom-destinations metrics restriction-queries help" -f -a "restriction-queries" -d 'Manage log restriction queries'
complete -c pup -n "__fish_pup_using_subcommand logs; and not __fish_seen_subcommand_from search list query aggregate archives custom-destinations metrics restriction-queries help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from search" -l query -d 'Search query (required)' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from search" -l from -d 'Start time: 1h, 5min, 2hours, \'5 minutes\', RFC3339, Unix timestamp, or \'now\'' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from search" -l to -d 'End time: 1h, 5min, 2hours, \'5 minutes\', RFC3339, Unix timestamp, or \'now\'' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from search" -l limit -d 'Maximum number of logs (1-1000)' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from search" -l sort -d 'Sort order: asc or desc' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from search" -l index -d 'Comma-separated log indexes' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from search" -l storage -d 'Storage tier: indexes, online-archives, or flex' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from search" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from search" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from search" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from search" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from search" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from search" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from search" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from list" -l query -d 'Search query' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from list" -l from -d 'Start time: 1h, 5min, 2hours, \'5 minutes\', RFC3339, Unix timestamp, or \'now\'' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from list" -l to -d 'End time' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from list" -l limit -d 'Number of logs' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from list" -l sort -d 'Sort order' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from list" -l storage -d 'Storage tier: indexes, online-archives, or flex' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from query" -l query -d 'Log query (required)' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from query" -l from -d 'Start time: 1h, 5min, 2hours, \'5 minutes\', RFC3339, Unix timestamp, or \'now\'' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from query" -l to -d 'End time' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from query" -l limit -d 'Maximum results' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from query" -l sort -d 'Sort order' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from query" -l storage -d 'Storage tier: indexes, online-archives, or flex' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from query" -l timezone -d 'Timezone for timestamps' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from query" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from query" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from query" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from query" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from query" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from query" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from query" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from aggregate" -l query -d 'Log query (required)' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from aggregate" -l from -d 'Start time: 1h, 5min, 2hours, \'5 minutes\', RFC3339, Unix timestamp, or \'now\'' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from aggregate" -l to -d 'End time' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from aggregate" -l compute -d 'Metrics to compute (comma-separated, e.g. count,avg(@duration),percentile(@duration, 95))' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from aggregate" -l group-by -d 'Fields to group by (comma-separated, e.g. service,status)' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from aggregate" -l limit -d 'Maximum groups per facet' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from aggregate" -l storage -d 'Storage tier: indexes, online-archives, or flex' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from aggregate" -l sort -d 'Sort groups by aggregation (count,cardinality,pc75,pc90,pc95,pc98,pc99,sum,min,max)' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from aggregate" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from aggregate" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from aggregate" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from aggregate" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from aggregate" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from aggregate" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from aggregate" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from archives" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from archives" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from archives" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from archives" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from archives" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from archives" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from archives" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from archives" -f -a "list" -d 'List all log archives'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from archives" -f -a "get" -d 'Get log archive details'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from archives" -f -a "delete" -d 'Delete a log archive'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from archives" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from custom-destinations" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from custom-destinations" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from custom-destinations" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from custom-destinations" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from custom-destinations" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from custom-destinations" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from custom-destinations" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from custom-destinations" -f -a "list" -d 'List custom log destinations'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from custom-destinations" -f -a "get" -d 'Get custom destination details'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from custom-destinations" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from metrics" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from metrics" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from metrics" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from metrics" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from metrics" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from metrics" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from metrics" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from metrics" -f -a "list" -d 'List log-based metrics'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from metrics" -f -a "get" -d 'Get log-based metric details'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from metrics" -f -a "delete" -d 'Delete a log-based metric'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from metrics" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from restriction-queries" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from restriction-queries" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from restriction-queries" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from restriction-queries" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from restriction-queries" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from restriction-queries" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from restriction-queries" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from restriction-queries" -f -a "list" -d 'List restriction queries'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from restriction-queries" -f -a "get" -d 'Get restriction query details'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from restriction-queries" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from help" -f -a "search" -d 'Search logs (v1 API)'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from help" -f -a "list" -d 'List logs (v2 API)'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from help" -f -a "query" -d 'Query logs (v2 API)'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from help" -f -a "aggregate" -d 'Aggregate logs (v2 API)'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from help" -f -a "archives" -d 'Manage log archives'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from help" -f -a "custom-destinations" -d 'Manage custom log destinations'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from help" -f -a "metrics" -d 'Manage log-based metrics'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from help" -f -a "restriction-queries" -d 'Manage log restriction queries'
complete -c pup -n "__fish_pup_using_subcommand logs; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and not __fish_seen_subcommand_from list get create update delete roles help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and not __fish_seen_subcommand_from list get create update delete roles help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and not __fish_seen_subcommand_from list get create update delete roles help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and not __fish_seen_subcommand_from list get create update delete roles help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and not __fish_seen_subcommand_from list get create update delete roles help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and not __fish_seen_subcommand_from list get create update delete roles help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and not __fish_seen_subcommand_from list get create update delete roles help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and not __fish_seen_subcommand_from list get create update delete roles help" -f -a "list" -d 'List all restriction queries'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and not __fish_seen_subcommand_from list get create update delete roles help" -f -a "get" -d 'Get a restriction query by ID'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and not __fish_seen_subcommand_from list get create update delete roles help" -f -a "create" -d 'Create a restriction query from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and not __fish_seen_subcommand_from list get create update delete roles help" -f -a "update" -d 'Update a restriction query from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and not __fish_seen_subcommand_from list get create update delete roles help" -f -a "delete" -d 'Delete a restriction query'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and not __fish_seen_subcommand_from list get create update delete roles help" -f -a "roles" -d 'Manage roles for a restriction query'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and not __fish_seen_subcommand_from list get create update delete roles help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from get" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from get" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from get" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from get" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from get" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from create" -l file -r
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from create" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from create" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from create" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from create" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from create" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from create" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from update" -l file -r
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from update" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from update" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from update" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from update" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from update" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from update" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from update" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from delete" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from delete" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from delete" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from delete" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from delete" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from delete" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from roles" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from roles" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from roles" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from roles" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from roles" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from roles" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from roles" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from roles" -f -a "list" -d 'List roles for a restriction query'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from roles" -f -a "add" -d 'Add a role to a restriction query from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from roles" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all restriction queries'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get a restriction query by ID'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a restriction query from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from help" -f -a "update" -d 'Update a restriction query from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete a restriction query'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from help" -f -a "roles" -d 'Manage roles for a restriction query'
complete -c pup -n "__fish_pup_using_subcommand logs-restriction; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand metrics; and not __fish_seen_subcommand_from list search query submit metadata tags timeseries help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and not __fish_seen_subcommand_from list search query submit metadata tags timeseries help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and not __fish_seen_subcommand_from list search query submit metadata tags timeseries help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand metrics; and not __fish_seen_subcommand_from list search query submit metadata tags timeseries help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand metrics; and not __fish_seen_subcommand_from list search query submit metadata tags timeseries help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand metrics; and not __fish_seen_subcommand_from list search query submit metadata tags timeseries help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand metrics; and not __fish_seen_subcommand_from list search query submit metadata tags timeseries help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand metrics; and not __fish_seen_subcommand_from list search query submit metadata tags timeseries help" -f -a "list" -d 'List all available metrics'
complete -c pup -n "__fish_pup_using_subcommand metrics; and not __fish_seen_subcommand_from list search query submit metadata tags timeseries help" -f -a "search" -d 'Search metrics (v1 API)'
complete -c pup -n "__fish_pup_using_subcommand metrics; and not __fish_seen_subcommand_from list search query submit metadata tags timeseries help" -f -a "query" -d 'Query time-series metrics data (v2 API)'
complete -c pup -n "__fish_pup_using_subcommand metrics; and not __fish_seen_subcommand_from list search query submit metadata tags timeseries help" -f -a "submit" -d 'Submit custom metrics to Datadog'
complete -c pup -n "__fish_pup_using_subcommand metrics; and not __fish_seen_subcommand_from list search query submit metadata tags timeseries help" -f -a "metadata" -d 'Manage metric metadata'
complete -c pup -n "__fish_pup_using_subcommand metrics; and not __fish_seen_subcommand_from list search query submit metadata tags timeseries help" -f -a "tags" -d 'Manage metric tags'
complete -c pup -n "__fish_pup_using_subcommand metrics; and not __fish_seen_subcommand_from list search query submit metadata tags timeseries help" -f -a "timeseries" -d 'Query v2 timeseries data via TimeseriesFormulaQueryRequest JSON body (SDK PR #1564)'
complete -c pup -n "__fish_pup_using_subcommand metrics; and not __fish_seen_subcommand_from list search query submit metadata tags timeseries help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from list" -l filter -d 'Filter metrics by name pattern (e.g., system.*, *.cpu.*)' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from list" -l tag-filter -d 'Filter metrics by tags (e.g., env:prod,service:api)' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from list" -l from -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from search" -l query -d 'Metric query string (required)' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from search" -l from -d 'Start time (e.g., 1h, 30m, 7d, now, unix timestamp)' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from search" -l to -d 'End time (e.g., now, unix timestamp)' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from search" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from search" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from search" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from search" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from search" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from search" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from search" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from query" -l query -d 'Metric query string (required)' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from query" -l from -d 'Start time (e.g., 1h, 30m, 7d, now, unix timestamp)' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from query" -l to -d 'End time (e.g., now, unix timestamp)' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from query" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from query" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from query" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from query" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from query" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from query" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from query" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from submit" -l name -d 'Metric name (required)' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from submit" -l value -d 'Metric value (required)' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from submit" -l tags -d 'Tags (comma-separated)' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from submit" -l type -d 'Metric type (gauge, count, rate)' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from submit" -l host -d 'Host name' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from submit" -l interval -d 'Interval in seconds for rate/count metrics' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from submit" -l file -d 'JSON file with metrics data' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from submit" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from submit" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from submit" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from submit" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from submit" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from submit" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from submit" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from metadata" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from metadata" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from metadata" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from metadata" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from metadata" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from metadata" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from metadata" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from metadata" -f -a "get" -d 'Get metric metadata'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from metadata" -f -a "update" -d 'Update metric metadata'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from metadata" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from tags" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from tags" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from tags" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from tags" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from tags" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from tags" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from tags" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from tags" -f -a "list" -d 'List tags for a metric'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from tags" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from timeseries" -l file -d 'JSON file with TimeseriesFormulaQueryRequest body' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from timeseries" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from timeseries" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from timeseries" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from timeseries" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from timeseries" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from timeseries" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from timeseries" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all available metrics'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from help" -f -a "search" -d 'Search metrics (v1 API)'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from help" -f -a "query" -d 'Query time-series metrics data (v2 API)'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from help" -f -a "submit" -d 'Submit custom metrics to Datadog'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from help" -f -a "metadata" -d 'Manage metric metadata'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from help" -f -a "tags" -d 'Manage metric tags'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from help" -f -a "timeseries" -d 'Query v2 timeseries data via TimeseriesFormulaQueryRequest JSON body (SDK PR #1564)'
complete -c pup -n "__fish_pup_using_subcommand metrics; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand misc; and not __fish_seen_subcommand_from ip-ranges status help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand misc; and not __fish_seen_subcommand_from ip-ranges status help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand misc; and not __fish_seen_subcommand_from ip-ranges status help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand misc; and not __fish_seen_subcommand_from ip-ranges status help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand misc; and not __fish_seen_subcommand_from ip-ranges status help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand misc; and not __fish_seen_subcommand_from ip-ranges status help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand misc; and not __fish_seen_subcommand_from ip-ranges status help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand misc; and not __fish_seen_subcommand_from ip-ranges status help" -f -a "ip-ranges" -d 'Get Datadog IP ranges'
complete -c pup -n "__fish_pup_using_subcommand misc; and not __fish_seen_subcommand_from ip-ranges status help" -f -a "status" -d 'Check API status'
complete -c pup -n "__fish_pup_using_subcommand misc; and not __fish_seen_subcommand_from ip-ranges status help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand misc; and __fish_seen_subcommand_from ip-ranges" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand misc; and __fish_seen_subcommand_from ip-ranges" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand misc; and __fish_seen_subcommand_from ip-ranges" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand misc; and __fish_seen_subcommand_from ip-ranges" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand misc; and __fish_seen_subcommand_from ip-ranges" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand misc; and __fish_seen_subcommand_from ip-ranges" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand misc; and __fish_seen_subcommand_from ip-ranges" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand misc; and __fish_seen_subcommand_from status" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand misc; and __fish_seen_subcommand_from status" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand misc; and __fish_seen_subcommand_from status" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand misc; and __fish_seen_subcommand_from status" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand misc; and __fish_seen_subcommand_from status" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand misc; and __fish_seen_subcommand_from status" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand misc; and __fish_seen_subcommand_from status" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand misc; and __fish_seen_subcommand_from help" -f -a "ip-ranges" -d 'Get Datadog IP ranges'
complete -c pup -n "__fish_pup_using_subcommand misc; and __fish_seen_subcommand_from help" -f -a "status" -d 'Check API status'
complete -c pup -n "__fish_pup_using_subcommand misc; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand monitors; and not __fish_seen_subcommand_from list get create update search delete help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand monitors; and not __fish_seen_subcommand_from list get create update search delete help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand monitors; and not __fish_seen_subcommand_from list get create update search delete help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand monitors; and not __fish_seen_subcommand_from list get create update search delete help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand monitors; and not __fish_seen_subcommand_from list get create update search delete help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand monitors; and not __fish_seen_subcommand_from list get create update search delete help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand monitors; and not __fish_seen_subcommand_from list get create update search delete help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand monitors; and not __fish_seen_subcommand_from list get create update search delete help" -f -a "list" -d 'List monitors (limited results)'
complete -c pup -n "__fish_pup_using_subcommand monitors; and not __fish_seen_subcommand_from list get create update search delete help" -f -a "get" -d 'Get monitor details'
complete -c pup -n "__fish_pup_using_subcommand monitors; and not __fish_seen_subcommand_from list get create update search delete help" -f -a "create" -d 'Create a monitor from JSON file'
complete -c pup -n "__fish_pup_using_subcommand monitors; and not __fish_seen_subcommand_from list get create update search delete help" -f -a "update" -d 'Update a monitor from JSON file'
complete -c pup -n "__fish_pup_using_subcommand monitors; and not __fish_seen_subcommand_from list get create update search delete help" -f -a "search" -d 'Search monitors'
complete -c pup -n "__fish_pup_using_subcommand monitors; and not __fish_seen_subcommand_from list get create update search delete help" -f -a "delete" -d 'Delete a monitor'
complete -c pup -n "__fish_pup_using_subcommand monitors; and not __fish_seen_subcommand_from list get create update search delete help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from list" -l name -d 'Filter monitors by name' -r
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from list" -l tags -d 'Filter by monitor tags (comma-separated, e.g., team:backend,env:prod)' -r
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from list" -l limit -d 'Maximum number of monitors to return (1-1000)' -r
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from list" -l page -d 'Page number (0-indexed)' -r
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from get" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from get" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from get" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from get" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from get" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from create" -l file -r
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from create" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from create" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from create" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from create" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from create" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from create" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from update" -l file -r
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from update" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from update" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from update" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from update" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from update" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from update" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from update" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from search" -l query -d 'Search query string' -r
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from search" -l page -d 'Page number' -r
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from search" -l per-page -d 'Results per page' -r
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from search" -l sort -d 'Sort order' -r
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from search" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from search" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from search" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from search" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from search" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from search" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from search" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from delete" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from delete" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from delete" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from delete" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from delete" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from delete" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from help" -f -a "list" -d 'List monitors (limited results)'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get monitor details'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a monitor from JSON file'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from help" -f -a "update" -d 'Update a monitor from JSON file'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from help" -f -a "search" -d 'Search monitors'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete a monitor'
complete -c pup -n "__fish_pup_using_subcommand monitors; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand network; and not __fish_seen_subcommand_from list flows devices interfaces help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand network; and not __fish_seen_subcommand_from list flows devices interfaces help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand network; and not __fish_seen_subcommand_from list flows devices interfaces help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand network; and not __fish_seen_subcommand_from list flows devices interfaces help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand network; and not __fish_seen_subcommand_from list flows devices interfaces help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand network; and not __fish_seen_subcommand_from list flows devices interfaces help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand network; and not __fish_seen_subcommand_from list flows devices interfaces help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand network; and not __fish_seen_subcommand_from list flows devices interfaces help" -f -a "list" -d 'List network devices/monitors'
complete -c pup -n "__fish_pup_using_subcommand network; and not __fish_seen_subcommand_from list flows devices interfaces help" -f -a "flows" -d 'Query network flows'
complete -c pup -n "__fish_pup_using_subcommand network; and not __fish_seen_subcommand_from list flows devices interfaces help" -f -a "devices" -d 'Manage network devices'
complete -c pup -n "__fish_pup_using_subcommand network; and not __fish_seen_subcommand_from list flows devices interfaces help" -f -a "interfaces" -d 'Manage network interface tags'
complete -c pup -n "__fish_pup_using_subcommand network; and not __fish_seen_subcommand_from list flows devices interfaces help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from flows" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from flows" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from flows" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from flows" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from flows" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from flows" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from flows" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from flows" -f -a "list" -d 'List network flows'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from flows" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from devices" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from devices" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from devices" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from devices" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from devices" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from devices" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from devices" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from devices" -f -a "list" -d 'List network devices'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from devices" -f -a "get" -d 'Get device details'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from devices" -f -a "interfaces" -d 'List interfaces for a device'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from devices" -f -a "tags" -d 'Manage device tags'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from devices" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from interfaces" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from interfaces" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from interfaces" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from interfaces" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from interfaces" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from interfaces" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from interfaces" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from interfaces" -f -a "list" -d 'List tags for an interface'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from interfaces" -f -a "update" -d 'Update tags for an interface'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from interfaces" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from help" -f -a "list" -d 'List network devices/monitors'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from help" -f -a "flows" -d 'Query network flows'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from help" -f -a "devices" -d 'Manage network devices'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from help" -f -a "interfaces" -d 'Manage network interface tags'
complete -c pup -n "__fish_pup_using_subcommand network; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and not __fish_seen_subcommand_from list get create update edit delete annotations help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand notebooks; and not __fish_seen_subcommand_from list get create update edit delete annotations help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand notebooks; and not __fish_seen_subcommand_from list get create update edit delete annotations help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and not __fish_seen_subcommand_from list get create update edit delete annotations help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and not __fish_seen_subcommand_from list get create update edit delete annotations help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and not __fish_seen_subcommand_from list get create update edit delete annotations help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and not __fish_seen_subcommand_from list get create update edit delete annotations help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and not __fish_seen_subcommand_from list get create update edit delete annotations help" -f -a "list" -d 'List notebooks'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and not __fish_seen_subcommand_from list get create update edit delete annotations help" -f -a "get" -d 'Get notebook details'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and not __fish_seen_subcommand_from list get create update edit delete annotations help" -f -a "create" -d 'Create a new notebook'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and not __fish_seen_subcommand_from list get create update edit delete annotations help" -f -a "update" -d 'Update a notebook (full replace)'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and not __fish_seen_subcommand_from list get create update edit delete annotations help" -f -a "edit" -d 'Append cells to an existing notebook (reads current notebook first, then appends)'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and not __fish_seen_subcommand_from list get create update edit delete annotations help" -f -a "delete" -d 'Delete a notebook'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and not __fish_seen_subcommand_from list get create update edit delete annotations help" -f -a "annotations" -d 'Manage annotations on notebook pages'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and not __fish_seen_subcommand_from list get create update edit delete annotations help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from get" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from get" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from get" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from get" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from get" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from create" -l file -d 'JSON file with notebook data (required)' -r
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from create" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from create" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from create" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from create" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from create" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from create" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from update" -l file -d 'JSON file with notebook data (required)' -r
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from update" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from update" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from update" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from update" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from update" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from update" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from update" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from edit" -l file -d 'JSON file containing an array of cell objects to append (required)' -r
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from edit" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from edit" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from edit" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from edit" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from edit" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from edit" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from edit" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from delete" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from delete" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from delete" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from delete" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from delete" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from delete" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from annotations" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from annotations" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from annotations" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from annotations" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from annotations" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from annotations" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from annotations" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from annotations" -f -a "list" -d 'List annotations for a page within a time window'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from annotations" -f -a "get-page" -d 'Get all annotations on a page grouped by widget'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from annotations" -f -a "create" -d 'Create a new annotation from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from annotations" -f -a "update" -d 'Update an existing annotation'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from annotations" -f -a "delete" -d 'Delete an annotation by ID'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from annotations" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from help" -f -a "list" -d 'List notebooks'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get notebook details'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a new notebook'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from help" -f -a "update" -d 'Update a notebook (full replace)'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from help" -f -a "edit" -d 'Append cells to an existing notebook (reads current notebook first, then appends)'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete a notebook'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from help" -f -a "annotations" -d 'Manage annotations on notebook pages'
complete -c pup -n "__fish_pup_using_subcommand notebooks; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and not __fish_seen_subcommand_from list get create update delete validate help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and not __fish_seen_subcommand_from list get create update delete validate help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and not __fish_seen_subcommand_from list get create update delete validate help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and not __fish_seen_subcommand_from list get create update delete validate help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and not __fish_seen_subcommand_from list get create update delete validate help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and not __fish_seen_subcommand_from list get create update delete validate help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and not __fish_seen_subcommand_from list get create update delete validate help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and not __fish_seen_subcommand_from list get create update delete validate help" -f -a "list" -d 'List observability pipelines'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and not __fish_seen_subcommand_from list get create update delete validate help" -f -a "get" -d 'Get pipeline details'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and not __fish_seen_subcommand_from list get create update delete validate help" -f -a "create" -d 'Create a new pipeline from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and not __fish_seen_subcommand_from list get create update delete validate help" -f -a "update" -d 'Update an existing pipeline from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and not __fish_seen_subcommand_from list get create update delete validate help" -f -a "delete" -d 'Delete a pipeline'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and not __fish_seen_subcommand_from list get create update delete validate help" -f -a "validate" -d 'Validate a pipeline configuration without creating it'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and not __fish_seen_subcommand_from list get create update delete validate help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from list" -l limit -d 'Maximum number of pipelines to return' -r
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from get" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from get" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from get" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from get" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from get" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from create" -l file -d 'JSON file with pipeline spec body (required)' -r
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from create" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from create" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from create" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from create" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from create" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from create" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from update" -l file -d 'JSON file with pipeline body (required)' -r
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from update" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from update" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from update" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from update" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from update" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from update" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from update" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from delete" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from delete" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from delete" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from delete" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from delete" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from delete" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from validate" -l file -d 'JSON file with pipeline spec body (required)' -r
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from validate" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from validate" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from validate" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from validate" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from validate" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from validate" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from validate" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from help" -f -a "list" -d 'List observability pipelines'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get pipeline details'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a new pipeline from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from help" -f -a "update" -d 'Update an existing pipeline from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete a pipeline'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from help" -f -a "validate" -d 'Validate a pipeline configuration without creating it'
complete -c pup -n "__fish_pup_using_subcommand obs-pipelines; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand on-call; and not __fish_seen_subcommand_from teams escalation-policies schedules notification-channels notification-rules pages help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand on-call; and not __fish_seen_subcommand_from teams escalation-policies schedules notification-channels notification-rules pages help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand on-call; and not __fish_seen_subcommand_from teams escalation-policies schedules notification-channels notification-rules pages help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand on-call; and not __fish_seen_subcommand_from teams escalation-policies schedules notification-channels notification-rules pages help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand on-call; and not __fish_seen_subcommand_from teams escalation-policies schedules notification-channels notification-rules pages help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand on-call; and not __fish_seen_subcommand_from teams escalation-policies schedules notification-channels notification-rules pages help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand on-call; and not __fish_seen_subcommand_from teams escalation-policies schedules notification-channels notification-rules pages help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand on-call; and not __fish_seen_subcommand_from teams escalation-policies schedules notification-channels notification-rules pages help" -f -a "teams" -d 'Manage teams'
complete -c pup -n "__fish_pup_using_subcommand on-call; and not __fish_seen_subcommand_from teams escalation-policies schedules notification-channels notification-rules pages help" -f -a "escalation-policies" -d 'Manage escalation policies'
complete -c pup -n "__fish_pup_using_subcommand on-call; and not __fish_seen_subcommand_from teams escalation-policies schedules notification-channels notification-rules pages help" -f -a "schedules" -d 'Manage on-call schedules'
complete -c pup -n "__fish_pup_using_subcommand on-call; and not __fish_seen_subcommand_from teams escalation-policies schedules notification-channels notification-rules pages help" -f -a "notification-channels" -d 'Manage user notification channels'
complete -c pup -n "__fish_pup_using_subcommand on-call; and not __fish_seen_subcommand_from teams escalation-policies schedules notification-channels notification-rules pages help" -f -a "notification-rules" -d 'Manage user notification rules'
complete -c pup -n "__fish_pup_using_subcommand on-call; and not __fish_seen_subcommand_from teams escalation-policies schedules notification-channels notification-rules pages help" -f -a "pages" -d 'Manage on-call pages'
complete -c pup -n "__fish_pup_using_subcommand on-call; and not __fish_seen_subcommand_from teams escalation-policies schedules notification-channels notification-rules pages help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from teams" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from teams" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from teams" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from teams" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from teams" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from teams" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from teams" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from teams" -f -a "list" -d 'List all teams'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from teams" -f -a "get" -d 'Get team details'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from teams" -f -a "create" -d 'Create a new team'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from teams" -f -a "update" -d 'Update team details'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from teams" -f -a "delete" -d 'Delete a team'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from teams" -f -a "memberships" -d 'Manage team memberships'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from teams" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from escalation-policies" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from escalation-policies" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from escalation-policies" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from escalation-policies" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from escalation-policies" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from escalation-policies" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from escalation-policies" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from escalation-policies" -f -a "get" -d 'Get an escalation policy'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from escalation-policies" -f -a "create" -d 'Create an escalation policy from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from escalation-policies" -f -a "update" -d 'Update an escalation policy from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from escalation-policies" -f -a "delete" -d 'Delete an escalation policy'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from escalation-policies" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from schedules" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from schedules" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from schedules" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from schedules" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from schedules" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from schedules" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from schedules" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from schedules" -f -a "get" -d 'Get an on-call schedule'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from schedules" -f -a "create" -d 'Create an on-call schedule from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from schedules" -f -a "update" -d 'Update an on-call schedule from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from schedules" -f -a "delete" -d 'Delete an on-call schedule'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from schedules" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from notification-channels" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from notification-channels" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from notification-channels" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from notification-channels" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from notification-channels" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from notification-channels" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from notification-channels" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from notification-channels" -f -a "list" -d 'List notification channels for a user'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from notification-channels" -f -a "get" -d 'Get a notification channel for a user'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from notification-channels" -f -a "create" -d 'Create a notification channel for a user from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from notification-channels" -f -a "delete" -d 'Delete a notification channel for a user'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from notification-channels" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from notification-rules" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from notification-rules" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from notification-rules" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from notification-rules" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from notification-rules" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from notification-rules" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from notification-rules" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from notification-rules" -f -a "list" -d 'List notification rules for a user'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from notification-rules" -f -a "get" -d 'Get a notification rule for a user'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from notification-rules" -f -a "create" -d 'Create a notification rule for a user from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from notification-rules" -f -a "update" -d 'Update a notification rule for a user from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from notification-rules" -f -a "delete" -d 'Delete a notification rule for a user'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from notification-rules" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from pages" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from pages" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from pages" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from pages" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from pages" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from pages" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from pages" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from pages" -f -a "create" -d 'Create an on-call page from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from pages" -f -a "get" -d 'Get an on-call page by ID'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from pages" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from help" -f -a "teams" -d 'Manage teams'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from help" -f -a "escalation-policies" -d 'Manage escalation policies'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from help" -f -a "schedules" -d 'Manage on-call schedules'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from help" -f -a "notification-channels" -d 'Manage user notification channels'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from help" -f -a "notification-rules" -d 'Manage user notification rules'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from help" -f -a "pages" -d 'Manage on-call pages'
complete -c pup -n "__fish_pup_using_subcommand on-call; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand organizations; and not __fish_seen_subcommand_from list get policies policy-overrides policy-configs help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand organizations; and not __fish_seen_subcommand_from list get policies policy-overrides policy-configs help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand organizations; and not __fish_seen_subcommand_from list get policies policy-overrides policy-configs help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand organizations; and not __fish_seen_subcommand_from list get policies policy-overrides policy-configs help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand organizations; and not __fish_seen_subcommand_from list get policies policy-overrides policy-configs help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand organizations; and not __fish_seen_subcommand_from list get policies policy-overrides policy-configs help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand organizations; and not __fish_seen_subcommand_from list get policies policy-overrides policy-configs help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand organizations; and not __fish_seen_subcommand_from list get policies policy-overrides policy-configs help" -f -a "list" -d 'List organizations'
complete -c pup -n "__fish_pup_using_subcommand organizations; and not __fish_seen_subcommand_from list get policies policy-overrides policy-configs help" -f -a "get" -d 'Get organization details'
complete -c pup -n "__fish_pup_using_subcommand organizations; and not __fish_seen_subcommand_from list get policies policy-overrides policy-configs help" -f -a "policies" -d 'Manage organization group policies'
complete -c pup -n "__fish_pup_using_subcommand organizations; and not __fish_seen_subcommand_from list get policies policy-overrides policy-configs help" -f -a "policy-overrides" -d 'Manage organization group policy overrides'
complete -c pup -n "__fish_pup_using_subcommand organizations; and not __fish_seen_subcommand_from list get policies policy-overrides policy-configs help" -f -a "policy-configs" -d 'List available org group policy config definitions'
complete -c pup -n "__fish_pup_using_subcommand organizations; and not __fish_seen_subcommand_from list get policies policy-overrides policy-configs help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from get" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from get" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from get" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from get" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from get" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policies" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policies" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policies" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policies" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policies" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policies" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policies" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policies" -f -a "list" -d 'List policies for an org group'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policies" -f -a "get" -d 'Get a policy by ID'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policies" -f -a "create" -d 'Create a policy'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policies" -f -a "update" -d 'Update a policy'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policies" -f -a "delete" -d 'Delete a policy'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policies" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policy-overrides" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policy-overrides" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policy-overrides" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policy-overrides" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policy-overrides" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policy-overrides" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policy-overrides" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policy-overrides" -f -a "list" -d 'List policy overrides for an org group'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policy-overrides" -f -a "get" -d 'Get a policy override by ID'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policy-overrides" -f -a "create" -d 'Create a policy override'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policy-overrides" -f -a "update" -d 'Update a policy override'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policy-overrides" -f -a "delete" -d 'Delete a policy override'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policy-overrides" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policy-configs" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policy-configs" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policy-configs" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policy-configs" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policy-configs" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policy-configs" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policy-configs" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policy-configs" -f -a "list" -d 'List available org group policy config definitions'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from policy-configs" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from help" -f -a "list" -d 'List organizations'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get organization details'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from help" -f -a "policies" -d 'Manage organization group policies'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from help" -f -a "policy-overrides" -d 'Manage organization group policy overrides'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from help" -f -a "policy-configs" -d 'List available org group policy config definitions'
complete -c pup -n "__fish_pup_using_subcommand organizations; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand processes; and not __fish_seen_subcommand_from list help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand processes; and not __fish_seen_subcommand_from list help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand processes; and not __fish_seen_subcommand_from list help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand processes; and not __fish_seen_subcommand_from list help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand processes; and not __fish_seen_subcommand_from list help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand processes; and not __fish_seen_subcommand_from list help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand processes; and not __fish_seen_subcommand_from list help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand processes; and not __fish_seen_subcommand_from list help" -f -a "list" -d 'List running processes'
complete -c pup -n "__fish_pup_using_subcommand processes; and not __fish_seen_subcommand_from list help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand processes; and __fish_seen_subcommand_from list" -l search -d 'Search processes by name or command' -r
complete -c pup -n "__fish_pup_using_subcommand processes; and __fish_seen_subcommand_from list" -l tags -d 'Comma-separated list of tags to filter by' -r
complete -c pup -n "__fish_pup_using_subcommand processes; and __fish_seen_subcommand_from list" -l page-limit -d 'Maximum number of results per page' -r
complete -c pup -n "__fish_pup_using_subcommand processes; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand processes; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand processes; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand processes; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand processes; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand processes; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand processes; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand processes; and __fish_seen_subcommand_from help" -f -a "list" -d 'List running processes'
complete -c pup -n "__fish_pup_using_subcommand processes; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and not __fish_seen_subcommand_from events query help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and not __fish_seen_subcommand_from events query help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and not __fish_seen_subcommand_from events query help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and not __fish_seen_subcommand_from events query help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and not __fish_seen_subcommand_from events query help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and not __fish_seen_subcommand_from events query help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and not __fish_seen_subcommand_from events query help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and not __fish_seen_subcommand_from events query help" -f -a "events" -d 'Send product analytics events'
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and not __fish_seen_subcommand_from events query help" -f -a "query" -d 'Run product analytics queries'
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and not __fish_seen_subcommand_from events query help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and __fish_seen_subcommand_from events" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and __fish_seen_subcommand_from events" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and __fish_seen_subcommand_from events" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and __fish_seen_subcommand_from events" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and __fish_seen_subcommand_from events" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and __fish_seen_subcommand_from events" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and __fish_seen_subcommand_from events" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and __fish_seen_subcommand_from events" -f -a "send" -d 'Send a product analytics event'
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and __fish_seen_subcommand_from events" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and __fish_seen_subcommand_from query" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and __fish_seen_subcommand_from query" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and __fish_seen_subcommand_from query" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and __fish_seen_subcommand_from query" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and __fish_seen_subcommand_from query" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and __fish_seen_subcommand_from query" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and __fish_seen_subcommand_from query" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and __fish_seen_subcommand_from query" -f -a "scalar" -d 'Compute scalar analytics'
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and __fish_seen_subcommand_from query" -f -a "timeseries" -d 'Compute timeseries analytics'
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and __fish_seen_subcommand_from query" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and __fish_seen_subcommand_from help" -f -a "events" -d 'Send product analytics events'
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and __fish_seen_subcommand_from help" -f -a "query" -d 'Run product analytics queries'
complete -c pup -n "__fish_pup_using_subcommand product-analytics; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand profiling" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand profiling" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand profiling" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand profiling" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand profiling" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand profiling" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand profiling" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and not __fish_seen_subcommand_from list get create batch-query help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and not __fish_seen_subcommand_from list get create batch-query help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and not __fish_seen_subcommand_from list get create batch-query help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and not __fish_seen_subcommand_from list get create batch-query help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and not __fish_seen_subcommand_from list get create batch-query help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and not __fish_seen_subcommand_from list get create batch-query help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and not __fish_seen_subcommand_from list get create batch-query help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and not __fish_seen_subcommand_from list get create batch-query help" -f -a "list" -d 'List reference tables'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and not __fish_seen_subcommand_from list get create batch-query help" -f -a "get" -d 'Get a reference table by ID'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and not __fish_seen_subcommand_from list get create batch-query help" -f -a "create" -d 'Create a reference table from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and not __fish_seen_subcommand_from list get create batch-query help" -f -a "batch-query" -d 'Batch query reference table rows by primary key'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and not __fish_seen_subcommand_from list get create batch-query help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from list" -l limit -d 'Maximum number of tables to return' -r
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from get" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from get" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from get" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from get" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from get" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from create" -l file -d 'JSON file with table body (required)' -r
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from create" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from create" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from create" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from create" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from create" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from create" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from batch-query" -l file -d 'JSON file with batch query body (required)' -r
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from batch-query" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from batch-query" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from batch-query" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from batch-query" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from batch-query" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from batch-query" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from batch-query" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from help" -f -a "list" -d 'List reference tables'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get a reference table by ID'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a reference table from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from help" -f -a "batch-query" -d 'Batch query reference table rows by primary key'
complete -c pup -n "__fish_pup_using_subcommand reference-tables; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand rum; and not __fish_seen_subcommand_from apps aggregate events sessions metrics retention-filters playlists heatmaps help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand rum; and not __fish_seen_subcommand_from apps aggregate events sessions metrics retention-filters playlists heatmaps help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand rum; and not __fish_seen_subcommand_from apps aggregate events sessions metrics retention-filters playlists heatmaps help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand rum; and not __fish_seen_subcommand_from apps aggregate events sessions metrics retention-filters playlists heatmaps help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand rum; and not __fish_seen_subcommand_from apps aggregate events sessions metrics retention-filters playlists heatmaps help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand rum; and not __fish_seen_subcommand_from apps aggregate events sessions metrics retention-filters playlists heatmaps help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand rum; and not __fish_seen_subcommand_from apps aggregate events sessions metrics retention-filters playlists heatmaps help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand rum; and not __fish_seen_subcommand_from apps aggregate events sessions metrics retention-filters playlists heatmaps help" -f -a "apps" -d 'Manage RUM applications'
complete -c pup -n "__fish_pup_using_subcommand rum; and not __fish_seen_subcommand_from apps aggregate events sessions metrics retention-filters playlists heatmaps help" -f -a "aggregate" -d 'Aggregate RUM events by facets'
complete -c pup -n "__fish_pup_using_subcommand rum; and not __fish_seen_subcommand_from apps aggregate events sessions metrics retention-filters playlists heatmaps help" -f -a "events" -d 'List RUM events'
complete -c pup -n "__fish_pup_using_subcommand rum; and not __fish_seen_subcommand_from apps aggregate events sessions metrics retention-filters playlists heatmaps help" -f -a "sessions" -d 'Query RUM session replay data'
complete -c pup -n "__fish_pup_using_subcommand rum; and not __fish_seen_subcommand_from apps aggregate events sessions metrics retention-filters playlists heatmaps help" -f -a "metrics" -d 'Manage RUM custom metrics'
complete -c pup -n "__fish_pup_using_subcommand rum; and not __fish_seen_subcommand_from apps aggregate events sessions metrics retention-filters playlists heatmaps help" -f -a "retention-filters" -d 'Manage RUM retention filters'
complete -c pup -n "__fish_pup_using_subcommand rum; and not __fish_seen_subcommand_from apps aggregate events sessions metrics retention-filters playlists heatmaps help" -f -a "playlists" -d 'Manage session replay playlists'
complete -c pup -n "__fish_pup_using_subcommand rum; and not __fish_seen_subcommand_from apps aggregate events sessions metrics retention-filters playlists heatmaps help" -f -a "heatmaps" -d 'Query RUM interaction heatmaps'
complete -c pup -n "__fish_pup_using_subcommand rum; and not __fish_seen_subcommand_from apps aggregate events sessions metrics retention-filters playlists heatmaps help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from apps" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from apps" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from apps" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from apps" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from apps" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from apps" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from apps" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from apps" -f -a "list" -d 'List all RUM applications'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from apps" -f -a "get" -d 'Get RUM application details'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from apps" -f -a "create" -d 'Create a new RUM application'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from apps" -f -a "update" -d 'Update a RUM application'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from apps" -f -a "delete" -d 'Delete a RUM application'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from apps" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from aggregate" -l query -d 'RUM query filter (e.g. \'@type:error @application.name:"My App"\')' -r
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from aggregate" -l user-email -d 'Filter to a specific user by email — prepends @usr.email:<value> to the query' -r
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from aggregate" -l from -d 'Start time' -r
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from aggregate" -l to -d 'End time' -r
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from aggregate" -l compute -d 'Metrics to compute (comma-separated, e.g. count,avg(@duration))' -r
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from aggregate" -l group-by -d 'Fields to group by (comma-separated, e.g. @application.version,@view.name)' -r
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from aggregate" -l limit -d 'Maximum groups per facet' -r
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from aggregate" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from aggregate" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from aggregate" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from aggregate" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from aggregate" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from aggregate" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from aggregate" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from events" -l query -d 'RUM query filter (e.g. \'@type:error @application.name:"My App"\')' -r
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from events" -l from -r
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from events" -l to -r
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from events" -l limit -r
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from events" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from events" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from events" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from events" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from events" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from events" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from events" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from sessions" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from sessions" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from sessions" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from sessions" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from sessions" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from sessions" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from sessions" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from sessions" -f -a "search" -d 'Search RUM sessions'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from sessions" -f -a "list" -d 'List RUM sessions'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from sessions" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from metrics" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from metrics" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from metrics" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from metrics" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from metrics" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from metrics" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from metrics" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from metrics" -f -a "list" -d 'List all RUM custom metrics'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from metrics" -f -a "get" -d 'Get RUM custom metric details'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from metrics" -f -a "create" -d 'Create a RUM custom metric'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from metrics" -f -a "update" -d 'Update a RUM custom metric'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from metrics" -f -a "delete" -d 'Delete a RUM custom metric'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from metrics" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from retention-filters" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from retention-filters" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from retention-filters" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from retention-filters" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from retention-filters" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from retention-filters" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from retention-filters" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from retention-filters" -f -a "list" -d 'List all retention filters'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from retention-filters" -f -a "get" -d 'Get retention filter details'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from retention-filters" -f -a "create" -d 'Create a retention filter'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from retention-filters" -f -a "update" -d 'Update a retention filter'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from retention-filters" -f -a "delete" -d 'Delete a retention filter'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from retention-filters" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from playlists" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from playlists" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from playlists" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from playlists" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from playlists" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from playlists" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from playlists" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from playlists" -f -a "list" -d 'List session replay playlists'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from playlists" -f -a "get" -d 'Get playlist details'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from playlists" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from heatmaps" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from heatmaps" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from heatmaps" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from heatmaps" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from heatmaps" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from heatmaps" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from heatmaps" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from heatmaps" -f -a "query" -d 'Query heatmap data'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from heatmaps" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from help" -f -a "apps" -d 'Manage RUM applications'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from help" -f -a "aggregate" -d 'Aggregate RUM events by facets'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from help" -f -a "events" -d 'List RUM events'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from help" -f -a "sessions" -d 'Query RUM session replay data'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from help" -f -a "metrics" -d 'Manage RUM custom metrics'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from help" -f -a "retention-filters" -d 'Manage RUM retention filters'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from help" -f -a "playlists" -d 'Manage session replay playlists'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from help" -f -a "heatmaps" -d 'Query RUM interaction heatmaps'
complete -c pup -n "__fish_pup_using_subcommand rum; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and not __fish_seen_subcommand_from list describe run validate import help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand runbooks; and not __fish_seen_subcommand_from list describe run validate import help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand runbooks; and not __fish_seen_subcommand_from list describe run validate import help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and not __fish_seen_subcommand_from list describe run validate import help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and not __fish_seen_subcommand_from list describe run validate import help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and not __fish_seen_subcommand_from list describe run validate import help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and not __fish_seen_subcommand_from list describe run validate import help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and not __fish_seen_subcommand_from list describe run validate import help" -f -a "list" -d 'List available runbooks'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and not __fish_seen_subcommand_from list describe run validate import help" -f -a "describe" -d 'Show runbook details and steps'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and not __fish_seen_subcommand_from list describe run validate import help" -f -a "run" -d 'Execute a runbook'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and not __fish_seen_subcommand_from list describe run validate import help" -f -a "validate" -d 'Validate a runbook without executing'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and not __fish_seen_subcommand_from list describe run validate import help" -f -a "import" -d 'Import a runbook from a file path or URL'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and not __fish_seen_subcommand_from list describe run validate import help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from list" -l tag -d 'Filter by tag (key:value, repeatable)' -r
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from describe" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from describe" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from describe" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from describe" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from describe" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from describe" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from describe" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from run" -l arg -d 'Set a variable: KEY=VALUE' -r
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from run" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from run" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from run" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from run" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from run" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from run" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from run" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from validate" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from validate" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from validate" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from validate" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from validate" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from validate" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from validate" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from import" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from import" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from import" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from import" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from import" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from import" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from import" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from help" -f -a "list" -d 'List available runbooks'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from help" -f -a "describe" -d 'Show runbook details and steps'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from help" -f -a "run" -d 'Execute a runbook'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from help" -f -a "validate" -d 'Validate a runbook without executing'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from help" -f -a "import" -d 'Import a runbook from a file path or URL'
complete -c pup -n "__fish_pup_using_subcommand runbooks; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and not __fish_seen_subcommand_from list rules outcomes campaigns help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand scorecards; and not __fish_seen_subcommand_from list rules outcomes campaigns help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand scorecards; and not __fish_seen_subcommand_from list rules outcomes campaigns help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and not __fish_seen_subcommand_from list rules outcomes campaigns help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and not __fish_seen_subcommand_from list rules outcomes campaigns help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and not __fish_seen_subcommand_from list rules outcomes campaigns help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and not __fish_seen_subcommand_from list rules outcomes campaigns help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and not __fish_seen_subcommand_from list rules outcomes campaigns help" -f -a "list" -d 'List all scorecards'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and not __fish_seen_subcommand_from list rules outcomes campaigns help" -f -a "rules" -d 'Manage scorecard rules'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and not __fish_seen_subcommand_from list rules outcomes campaigns help" -f -a "outcomes" -d 'Manage scorecard outcomes'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and not __fish_seen_subcommand_from list rules outcomes campaigns help" -f -a "campaigns" -d 'Manage scorecard campaigns'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and not __fish_seen_subcommand_from list rules outcomes campaigns help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from rules" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from rules" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from rules" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from rules" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from rules" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from rules" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from rules" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from rules" -f -a "list" -d 'List scorecard rules'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from rules" -f -a "create" -d 'Create a scorecard rule from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from rules" -f -a "update" -d 'Update a scorecard rule from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from rules" -f -a "delete" -d 'Delete a scorecard rule'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from rules" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from outcomes" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from outcomes" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from outcomes" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from outcomes" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from outcomes" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from outcomes" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from outcomes" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from outcomes" -f -a "list" -d 'List scorecard outcomes'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from outcomes" -f -a "batch-create" -d 'Create or update outcomes in batch from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from outcomes" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from campaigns" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from campaigns" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from campaigns" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from campaigns" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from campaigns" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from campaigns" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from campaigns" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from campaigns" -f -a "list" -d 'List all scorecard campaigns'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from campaigns" -f -a "get" -d 'Get a scorecard campaign by ID'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from campaigns" -f -a "create" -d 'Create a scorecard campaign from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from campaigns" -f -a "update" -d 'Update a scorecard campaign from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from campaigns" -f -a "delete" -d 'Delete a scorecard campaign'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from campaigns" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all scorecards'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from help" -f -a "rules" -d 'Manage scorecard rules'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from help" -f -a "outcomes" -d 'Manage scorecard outcomes'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from help" -f -a "campaigns" -d 'Manage scorecard campaigns'
complete -c pup -n "__fish_pup_using_subcommand scorecards; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand security; and not __fish_seen_subcommand_from findings signals risk-scores rules suppressions content-packs iocs asm-custom-rules asm-exclusions restriction-policies terraform help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand security; and not __fish_seen_subcommand_from findings signals risk-scores rules suppressions content-packs iocs asm-custom-rules asm-exclusions restriction-policies terraform help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand security; and not __fish_seen_subcommand_from findings signals risk-scores rules suppressions content-packs iocs asm-custom-rules asm-exclusions restriction-policies terraform help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand security; and not __fish_seen_subcommand_from findings signals risk-scores rules suppressions content-packs iocs asm-custom-rules asm-exclusions restriction-policies terraform help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand security; and not __fish_seen_subcommand_from findings signals risk-scores rules suppressions content-packs iocs asm-custom-rules asm-exclusions restriction-policies terraform help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand security; and not __fish_seen_subcommand_from findings signals risk-scores rules suppressions content-packs iocs asm-custom-rules asm-exclusions restriction-policies terraform help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand security; and not __fish_seen_subcommand_from findings signals risk-scores rules suppressions content-packs iocs asm-custom-rules asm-exclusions restriction-policies terraform help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand security; and not __fish_seen_subcommand_from findings signals risk-scores rules suppressions content-packs iocs asm-custom-rules asm-exclusions restriction-policies terraform help" -f -a "findings" -d 'Search and analyze security findings (posture, vulnerabilities, misconfigs)'
complete -c pup -n "__fish_pup_using_subcommand security; and not __fish_seen_subcommand_from findings signals risk-scores rules suppressions content-packs iocs asm-custom-rules asm-exclusions restriction-policies terraform help" -f -a "signals" -d 'Search and analyze real-time security detections'
complete -c pup -n "__fish_pup_using_subcommand security; and not __fish_seen_subcommand_from findings signals risk-scores rules suppressions content-packs iocs asm-custom-rules asm-exclusions restriction-policies terraform help" -f -a "risk-scores" -d 'List entity risk scores'
complete -c pup -n "__fish_pup_using_subcommand security; and not __fish_seen_subcommand_from findings signals risk-scores rules suppressions content-packs iocs asm-custom-rules asm-exclusions restriction-policies terraform help" -f -a "rules" -d 'Manage detection rules'
complete -c pup -n "__fish_pup_using_subcommand security; and not __fish_seen_subcommand_from findings signals risk-scores rules suppressions content-packs iocs asm-custom-rules asm-exclusions restriction-policies terraform help" -f -a "suppressions" -d 'Manage suppression rules'
complete -c pup -n "__fish_pup_using_subcommand security; and not __fish_seen_subcommand_from findings signals risk-scores rules suppressions content-packs iocs asm-custom-rules asm-exclusions restriction-policies terraform help" -f -a "content-packs" -d 'Manage security content packs'
complete -c pup -n "__fish_pup_using_subcommand security; and not __fish_seen_subcommand_from findings signals risk-scores rules suppressions content-packs iocs asm-custom-rules asm-exclusions restriction-policies terraform help" -f -a "iocs" -d 'Explore indicators of compromise (IoCs)'
complete -c pup -n "__fish_pup_using_subcommand security; and not __fish_seen_subcommand_from findings signals risk-scores rules suppressions content-packs iocs asm-custom-rules asm-exclusions restriction-policies terraform help" -f -a "asm-custom-rules" -d 'Manage ASM WAF custom rules'
complete -c pup -n "__fish_pup_using_subcommand security; and not __fish_seen_subcommand_from findings signals risk-scores rules suppressions content-packs iocs asm-custom-rules asm-exclusions restriction-policies terraform help" -f -a "asm-exclusions" -d 'Manage ASM WAF exclusion filters'
complete -c pup -n "__fish_pup_using_subcommand security; and not __fish_seen_subcommand_from findings signals risk-scores rules suppressions content-packs iocs asm-custom-rules asm-exclusions restriction-policies terraform help" -f -a "restriction-policies" -d 'Manage resource restriction policies'
complete -c pup -n "__fish_pup_using_subcommand security; and not __fish_seen_subcommand_from findings signals risk-scores rules suppressions content-packs iocs asm-custom-rules asm-exclusions restriction-policies terraform help" -f -a "terraform" -d 'Export and convert security monitoring resources as Terraform'
complete -c pup -n "__fish_pup_using_subcommand security; and not __fish_seen_subcommand_from findings signals risk-scores rules suppressions content-packs iocs asm-custom-rules asm-exclusions restriction-policies terraform help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from findings" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from findings" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from findings" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from findings" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from findings" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from findings" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from findings" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from findings" -f -a "search" -d 'Search security findings'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from findings" -f -a "schema" -d 'Get the schema (available fields and types) for security findings. Fetches the latest schema reference from Datadog documentation. Call this before using `findings analyze` to discover queryable fields'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from findings" -f -a "analyze" -d 'Analyze security findings using DDSQL. Workflow: 1) Run `pup security findings schema` to get fields, 2) Query with SQL. Function: dd.security_findings(columns => ARRAY[\'@field\', ...], filter => \'@field:value\', finding_types => ARRAY[\'type\', ...]). AS clause types: VARCHAR, BIGINT, DECIMAL, BOOLEAN, TIMESTAMP. Notes: \'columns\' ordering MUST match the AS clause. Use -@compliance.evaluation:pass filter to exclude passing findings. Prefer ordering by @severity_details.adjusted.score. Use LIMIT to reduce output. Example: SELECT rule_name, finding_type, severity, count(*) as cnt FROM dd.security_findings(columns => ARRAY[\'@rule.name\', \'@finding_type\', \'@severity\'], filter => \'@status:open @severity:(high OR critical)\') AS (rule_name VARCHAR, finding_type VARCHAR, severity VARCHAR) GROUP BY rule_name, finding_type, severity ORDER BY cnt DESC LIMIT 100'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from findings" -f -a "mute" -d 'Mute or unmute security findings (up to 100 per request)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from findings" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from signals" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from signals" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from signals" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from signals" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from signals" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from signals" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from signals" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from signals" -f -a "list" -d 'List security signals'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from signals" -f -a "investigation-queries" -d 'Get log queries for investigating a signal'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from signals" -f -a "suggested-actions" -d 'Get suggested remediation actions for a signal'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from signals" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from risk-scores" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from risk-scores" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from risk-scores" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from risk-scores" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from risk-scores" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from risk-scores" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from risk-scores" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from risk-scores" -f -a "list" -d 'List entity risk scores'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from risk-scores" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from rules" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from rules" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from rules" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from rules" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from rules" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from rules" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from rules" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from rules" -f -a "list" -d 'List security rules'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from rules" -f -a "get" -d 'Get rule details'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from rules" -f -a "bulk-export" -d 'Bulk export security monitoring rules'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from rules" -f -a "to-terraform" -d 'Convert a JSON rule definition into a Terraform resource'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from rules" -f -a "bulk-convert" -d 'Bulk convert existing rules to Terraform (returns a ZIP archive)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from rules" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from suppressions" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from suppressions" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from suppressions" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from suppressions" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from suppressions" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from suppressions" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from suppressions" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from suppressions" -f -a "list" -d 'List suppression rules'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from suppressions" -f -a "get" -d 'Get suppression rule details'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from suppressions" -f -a "create" -d 'Create a suppression rule'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from suppressions" -f -a "update" -d 'Update a suppression rule'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from suppressions" -f -a "delete" -d 'Delete a suppression rule'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from suppressions" -f -a "validate" -d 'Validate a suppression rule'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from suppressions" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from content-packs" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from content-packs" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from content-packs" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from content-packs" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from content-packs" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from content-packs" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from content-packs" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from content-packs" -f -a "list" -d 'List content pack states'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from content-packs" -f -a "activate" -d 'Activate a content pack'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from content-packs" -f -a "deactivate" -d 'Deactivate a content pack'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from content-packs" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from iocs" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from iocs" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from iocs" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from iocs" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from iocs" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from iocs" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from iocs" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from iocs" -f -a "list" -d 'List indicators of compromise'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from iocs" -f -a "get" -d 'Get a single indicator of compromise'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from iocs" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from asm-custom-rules" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from asm-custom-rules" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from asm-custom-rules" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from asm-custom-rules" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from asm-custom-rules" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from asm-custom-rules" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from asm-custom-rules" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from asm-custom-rules" -f -a "list" -d 'List WAF custom rules'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from asm-custom-rules" -f -a "get" -d 'Get a WAF custom rule'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from asm-custom-rules" -f -a "create" -d 'Create a WAF custom rule'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from asm-custom-rules" -f -a "update" -d 'Update a WAF custom rule'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from asm-custom-rules" -f -a "delete" -d 'Delete a WAF custom rule'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from asm-custom-rules" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from asm-exclusions" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from asm-exclusions" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from asm-exclusions" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from asm-exclusions" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from asm-exclusions" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from asm-exclusions" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from asm-exclusions" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from asm-exclusions" -f -a "list" -d 'List WAF exclusion filters'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from asm-exclusions" -f -a "get" -d 'Get a WAF exclusion filter'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from asm-exclusions" -f -a "create" -d 'Create a WAF exclusion filter'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from asm-exclusions" -f -a "update" -d 'Update a WAF exclusion filter'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from asm-exclusions" -f -a "delete" -d 'Delete a WAF exclusion filter'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from asm-exclusions" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from restriction-policies" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from restriction-policies" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from restriction-policies" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from restriction-policies" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from restriction-policies" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from restriction-policies" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from restriction-policies" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from restriction-policies" -f -a "get" -d 'Get a restriction policy for a resource'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from restriction-policies" -f -a "update" -d 'Update (replace) the restriction policy for a resource'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from restriction-policies" -f -a "delete" -d 'Delete the restriction policy for a resource'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from restriction-policies" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from terraform" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from terraform" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from terraform" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from terraform" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from terraform" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from terraform" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from terraform" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from terraform" -f -a "export" -d 'Export a single resource as Terraform'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from terraform" -f -a "bulk-export" -d 'Bulk export resources as a Terraform zip archive'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from terraform" -f -a "convert" -d 'Convert a JSON resource definition into Terraform'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from terraform" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from help" -f -a "findings" -d 'Search and analyze security findings (posture, vulnerabilities, misconfigs)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from help" -f -a "signals" -d 'Search and analyze real-time security detections'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from help" -f -a "risk-scores" -d 'List entity risk scores'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from help" -f -a "rules" -d 'Manage detection rules'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from help" -f -a "suppressions" -d 'Manage suppression rules'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from help" -f -a "content-packs" -d 'Manage security content packs'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from help" -f -a "iocs" -d 'Explore indicators of compromise (IoCs)'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from help" -f -a "asm-custom-rules" -d 'Manage ASM WAF custom rules'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from help" -f -a "asm-exclusions" -d 'Manage ASM WAF exclusion filters'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from help" -f -a "restriction-policies" -d 'Manage resource restriction policies'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from help" -f -a "terraform" -d 'Export and convert security monitoring resources as Terraform'
complete -c pup -n "__fish_pup_using_subcommand security; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand service-catalog; and not __fish_seen_subcommand_from list get help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand service-catalog; and not __fish_seen_subcommand_from list get help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand service-catalog; and not __fish_seen_subcommand_from list get help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand service-catalog; and not __fish_seen_subcommand_from list get help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand service-catalog; and not __fish_seen_subcommand_from list get help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand service-catalog; and not __fish_seen_subcommand_from list get help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand service-catalog; and not __fish_seen_subcommand_from list get help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand service-catalog; and not __fish_seen_subcommand_from list get help" -f -a "list" -d 'List services'
complete -c pup -n "__fish_pup_using_subcommand service-catalog; and not __fish_seen_subcommand_from list get help" -f -a "get" -d 'Get service details'
complete -c pup -n "__fish_pup_using_subcommand service-catalog; and not __fish_seen_subcommand_from list get help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand service-catalog; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand service-catalog; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand service-catalog; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand service-catalog; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand service-catalog; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand service-catalog; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand service-catalog; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand service-catalog; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand service-catalog; and __fish_seen_subcommand_from get" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand service-catalog; and __fish_seen_subcommand_from get" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand service-catalog; and __fish_seen_subcommand_from get" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand service-catalog; and __fish_seen_subcommand_from get" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand service-catalog; and __fish_seen_subcommand_from get" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand service-catalog; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand service-catalog; and __fish_seen_subcommand_from help" -f -a "list" -d 'List services'
complete -c pup -n "__fish_pup_using_subcommand service-catalog; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get service details'
complete -c pup -n "__fish_pup_using_subcommand service-catalog; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand skills; and not __fish_seen_subcommand_from list install path help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand skills; and not __fish_seen_subcommand_from list install path help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand skills; and not __fish_seen_subcommand_from list install path help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand skills; and not __fish_seen_subcommand_from list install path help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand skills; and not __fish_seen_subcommand_from list install path help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand skills; and not __fish_seen_subcommand_from list install path help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand skills; and not __fish_seen_subcommand_from list install path help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand skills; and not __fish_seen_subcommand_from list install path help" -f -a "list" -d 'List available skills, agents, and extensions'
complete -c pup -n "__fish_pup_using_subcommand skills; and not __fish_seen_subcommand_from list install path help" -f -a "install" -d 'Install skills, agents, and extensions for one or more platforms'
complete -c pup -n "__fish_pup_using_subcommand skills; and not __fish_seen_subcommand_from list install path help" -f -a "path" -d 'Show where skills/agents/extensions would be installed'
complete -c pup -n "__fish_pup_using_subcommand skills; and not __fish_seen_subcommand_from list install path help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from list" -l type -d 'Filter by type: skill, agent, extension' -r
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from install" -l name -d 'Install a specific skill, agent, or extension by name' -r
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from install" -l dir -d 'Override install directory' -r
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from install" -l type -d 'Filter by type: skill, agent, extension' -r
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from install" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from install" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from install" -l project -d 'Install into the current project instead of the user-global location'
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from install" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from install" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from install" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from install" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from install" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from path" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from path" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from path" -l project -d 'Show project-local install paths instead of the user-global default'
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from path" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from path" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from path" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from path" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from path" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from help" -f -a "list" -d 'List available skills, agents, and extensions'
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from help" -f -a "install" -d 'Install skills, agents, and extensions for one or more platforms'
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from help" -f -a "path" -d 'Show where skills/agents/extensions would be installed'
complete -c pup -n "__fish_pup_using_subcommand skills; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand slos; and not __fish_seen_subcommand_from list get create update delete status help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand slos; and not __fish_seen_subcommand_from list get create update delete status help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand slos; and not __fish_seen_subcommand_from list get create update delete status help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand slos; and not __fish_seen_subcommand_from list get create update delete status help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand slos; and not __fish_seen_subcommand_from list get create update delete status help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand slos; and not __fish_seen_subcommand_from list get create update delete status help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand slos; and not __fish_seen_subcommand_from list get create update delete status help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand slos; and not __fish_seen_subcommand_from list get create update delete status help" -f -a "list" -d 'List all SLOs with optional API-backed filters'
complete -c pup -n "__fish_pup_using_subcommand slos; and not __fish_seen_subcommand_from list get create update delete status help" -f -a "get" -d 'Get SLO details'
complete -c pup -n "__fish_pup_using_subcommand slos; and not __fish_seen_subcommand_from list get create update delete status help" -f -a "create" -d 'Create an SLO from JSON file'
complete -c pup -n "__fish_pup_using_subcommand slos; and not __fish_seen_subcommand_from list get create update delete status help" -f -a "update" -d 'Update an SLO from JSON file'
complete -c pup -n "__fish_pup_using_subcommand slos; and not __fish_seen_subcommand_from list get create update delete status help" -f -a "delete" -d 'Delete an SLO'
complete -c pup -n "__fish_pup_using_subcommand slos; and not __fish_seen_subcommand_from list get create update delete status help" -f -a "status" -d 'Get SLO status'
complete -c pup -n "__fish_pup_using_subcommand slos; and not __fish_seen_subcommand_from list get create update delete status help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from list" -l query -d 'Filter by SLO name or API-supported search string' -r
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from list" -l tags-query -d 'Filter by a single SLO tag' -r
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from list" -l metrics-query -d 'Filter by SLO numerator/denominator query' -r
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from list" -l limit -d 'Number of SLOs to return' -r
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from list" -l offset -d 'Pagination offset' -r
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from get" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from get" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from get" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from get" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from get" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from create" -l file -r
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from create" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from create" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from create" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from create" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from create" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from create" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from update" -l file -r
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from update" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from update" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from update" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from update" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from update" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from update" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from update" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from delete" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from delete" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from delete" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from delete" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from delete" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from delete" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from status" -l from -d 'Start time (1h, 30d, Unix timestamp, or RFC3339)' -r
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from status" -l to -d 'End time (now, Unix timestamp, or RFC3339)' -r
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from status" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from status" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from status" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from status" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from status" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from status" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from status" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all SLOs with optional API-backed filters'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get SLO details'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create an SLO from JSON file'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from help" -f -a "update" -d 'Update an SLO from JSON file'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete an SLO'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from help" -f -a "status" -d 'Get SLO status'
complete -c pup -n "__fish_pup_using_subcommand slos; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and not __fish_seen_subcommand_from entities kinds relations help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and not __fish_seen_subcommand_from entities kinds relations help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and not __fish_seen_subcommand_from entities kinds relations help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and not __fish_seen_subcommand_from entities kinds relations help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and not __fish_seen_subcommand_from entities kinds relations help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and not __fish_seen_subcommand_from entities kinds relations help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and not __fish_seen_subcommand_from entities kinds relations help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and not __fish_seen_subcommand_from entities kinds relations help" -f -a "entities" -d 'Manage catalog entities'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and not __fish_seen_subcommand_from entities kinds relations help" -f -a "kinds" -d 'Manage catalog kinds'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and not __fish_seen_subcommand_from entities kinds relations help" -f -a "relations" -d 'Manage catalog relations'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and not __fish_seen_subcommand_from entities kinds relations help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from entities" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from entities" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from entities" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from entities" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from entities" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from entities" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from entities" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from entities" -f -a "list" -d 'List catalog entities'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from entities" -f -a "upsert" -d 'Create or update entities from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from entities" -f -a "delete" -d 'Delete an entity'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from entities" -f -a "preview" -d 'Preview catalog entities'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from entities" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from kinds" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from kinds" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from kinds" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from kinds" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from kinds" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from kinds" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from kinds" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from kinds" -f -a "list" -d 'List catalog kinds'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from kinds" -f -a "upsert" -d 'Create or update a kind from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from kinds" -f -a "delete" -d 'Delete a kind'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from kinds" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from relations" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from relations" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from relations" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from relations" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from relations" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from relations" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from relations" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from relations" -f -a "list" -d 'List catalog relations'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from relations" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from help" -f -a "entities" -d 'Manage catalog entities'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from help" -f -a "kinds" -d 'Manage catalog kinds'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from help" -f -a "relations" -d 'Manage catalog relations'
complete -c pup -n "__fish_pup_using_subcommand software-catalog; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and not __fish_seen_subcommand_from custom-rulesets custom-rules help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and not __fish_seen_subcommand_from custom-rulesets custom-rules help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and not __fish_seen_subcommand_from custom-rulesets custom-rules help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and not __fish_seen_subcommand_from custom-rulesets custom-rules help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and not __fish_seen_subcommand_from custom-rulesets custom-rules help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and not __fish_seen_subcommand_from custom-rulesets custom-rules help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and not __fish_seen_subcommand_from custom-rulesets custom-rules help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and not __fish_seen_subcommand_from custom-rulesets custom-rules help" -f -a "custom-rulesets" -d 'Manage custom rulesets'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and not __fish_seen_subcommand_from custom-rulesets custom-rules help" -f -a "custom-rules" -d 'Manage custom rules within a ruleset'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and not __fish_seen_subcommand_from custom-rulesets custom-rules help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and __fish_seen_subcommand_from custom-rulesets" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and __fish_seen_subcommand_from custom-rulesets" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and __fish_seen_subcommand_from custom-rulesets" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and __fish_seen_subcommand_from custom-rulesets" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and __fish_seen_subcommand_from custom-rulesets" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and __fish_seen_subcommand_from custom-rulesets" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and __fish_seen_subcommand_from custom-rulesets" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and __fish_seen_subcommand_from custom-rulesets" -f -a "get" -d 'Get a custom ruleset by name'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and __fish_seen_subcommand_from custom-rulesets" -f -a "update" -d 'Update a custom ruleset from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and __fish_seen_subcommand_from custom-rulesets" -f -a "delete" -d 'Delete a custom ruleset'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and __fish_seen_subcommand_from custom-rulesets" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and __fish_seen_subcommand_from custom-rules" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and __fish_seen_subcommand_from custom-rules" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and __fish_seen_subcommand_from custom-rules" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and __fish_seen_subcommand_from custom-rules" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and __fish_seen_subcommand_from custom-rules" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and __fish_seen_subcommand_from custom-rules" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and __fish_seen_subcommand_from custom-rules" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and __fish_seen_subcommand_from custom-rules" -f -a "get" -d 'Get a custom rule by name'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and __fish_seen_subcommand_from custom-rules" -f -a "create" -d 'Create a custom rule from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and __fish_seen_subcommand_from custom-rules" -f -a "delete" -d 'Delete a custom rule'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and __fish_seen_subcommand_from custom-rules" -f -a "revisions" -d 'List revisions for a custom rule'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and __fish_seen_subcommand_from custom-rules" -f -a "revision" -d 'Get a specific revision of a custom rule'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and __fish_seen_subcommand_from custom-rules" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and __fish_seen_subcommand_from help" -f -a "custom-rulesets" -d 'Manage custom rulesets'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and __fish_seen_subcommand_from help" -f -a "custom-rules" -d 'Manage custom rules within a ruleset'
complete -c pup -n "__fish_pup_using_subcommand static-analysis; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and not __fish_seen_subcommand_from pages components degradations third-party maintenances help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand status-pages; and not __fish_seen_subcommand_from pages components degradations third-party maintenances help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand status-pages; and not __fish_seen_subcommand_from pages components degradations third-party maintenances help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and not __fish_seen_subcommand_from pages components degradations third-party maintenances help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and not __fish_seen_subcommand_from pages components degradations third-party maintenances help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and not __fish_seen_subcommand_from pages components degradations third-party maintenances help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and not __fish_seen_subcommand_from pages components degradations third-party maintenances help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and not __fish_seen_subcommand_from pages components degradations third-party maintenances help" -f -a "pages" -d 'Manage status pages'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and not __fish_seen_subcommand_from pages components degradations third-party maintenances help" -f -a "components" -d 'Manage status page components'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and not __fish_seen_subcommand_from pages components degradations third-party maintenances help" -f -a "degradations" -d 'Manage status page degradations'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and not __fish_seen_subcommand_from pages components degradations third-party maintenances help" -f -a "third-party" -d 'View third-party service outage signals'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and not __fish_seen_subcommand_from pages components degradations third-party maintenances help" -f -a "maintenances" -d 'Manage status page maintenances'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and not __fish_seen_subcommand_from pages components degradations third-party maintenances help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from pages" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from pages" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from pages" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from pages" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from pages" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from pages" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from pages" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from pages" -f -a "list" -d 'List all status pages'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from pages" -f -a "get" -d 'Get status page details'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from pages" -f -a "create" -d 'Create a status page'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from pages" -f -a "update" -d 'Update a status page'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from pages" -f -a "delete" -d 'Delete a status page'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from pages" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from components" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from components" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from components" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from components" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from components" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from components" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from components" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from components" -f -a "list" -d 'List components for a page'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from components" -f -a "get" -d 'Get component details'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from components" -f -a "create" -d 'Create a component'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from components" -f -a "update" -d 'Update a component'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from components" -f -a "delete" -d 'Delete a component'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from components" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from degradations" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from degradations" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from degradations" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from degradations" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from degradations" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from degradations" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from degradations" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from degradations" -f -a "list" -d 'List degradations'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from degradations" -f -a "get" -d 'Get degradation details'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from degradations" -f -a "create" -d 'Create a degradation'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from degradations" -f -a "update" -d 'Update a degradation'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from degradations" -f -a "delete" -d 'Delete a degradation'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from degradations" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from third-party" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from third-party" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from third-party" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from third-party" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from third-party" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from third-party" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from third-party" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from third-party" -f -a "list" -d 'List third-party status pages'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from third-party" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from maintenances" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from maintenances" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from maintenances" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from maintenances" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from maintenances" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from maintenances" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from maintenances" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from maintenances" -f -a "list" -d 'List all maintenances'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from maintenances" -f -a "get" -d 'Get maintenance details'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from maintenances" -f -a "create" -d 'Create a maintenance'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from maintenances" -f -a "update" -d 'Update a maintenance'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from maintenances" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from help" -f -a "pages" -d 'Manage status pages'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from help" -f -a "components" -d 'Manage status page components'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from help" -f -a "degradations" -d 'Manage status page degradations'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from help" -f -a "third-party" -d 'View third-party service outage signals'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from help" -f -a "maintenances" -d 'Manage status page maintenances'
complete -c pup -n "__fish_pup_using_subcommand status-pages; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand symdb; and not __fish_seen_subcommand_from search help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand symdb; and not __fish_seen_subcommand_from search help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand symdb; and not __fish_seen_subcommand_from search help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand symdb; and not __fish_seen_subcommand_from search help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand symdb; and not __fish_seen_subcommand_from search help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand symdb; and not __fish_seen_subcommand_from search help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand symdb; and not __fish_seen_subcommand_from search help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand symdb; and not __fish_seen_subcommand_from search help" -f -a "search" -d 'Search for scopes (classes, methods) in a service'
complete -c pup -n "__fish_pup_using_subcommand symdb; and not __fish_seen_subcommand_from search help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand symdb; and __fish_seen_subcommand_from search" -l service -d 'Service name' -r
complete -c pup -n "__fish_pup_using_subcommand symdb; and __fish_seen_subcommand_from search" -l query -d 'Search query (matches scope names)' -r
complete -c pup -n "__fish_pup_using_subcommand symdb; and __fish_seen_subcommand_from search" -l version -d 'Service version filter' -r
complete -c pup -n "__fish_pup_using_subcommand symdb; and __fish_seen_subcommand_from search" -l view -d 'Output view' -r -f -a "full\t''
names\t''
probe-locations\t''"
complete -c pup -n "__fish_pup_using_subcommand symdb; and __fish_seen_subcommand_from search" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand symdb; and __fish_seen_subcommand_from search" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand symdb; and __fish_seen_subcommand_from search" -l no-allow-partial -d 'Disable partial results (wait for full indexing before returning)'
complete -c pup -n "__fish_pup_using_subcommand symdb; and __fish_seen_subcommand_from search" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand symdb; and __fish_seen_subcommand_from search" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand symdb; and __fish_seen_subcommand_from search" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand symdb; and __fish_seen_subcommand_from search" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand symdb; and __fish_seen_subcommand_from search" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand symdb; and __fish_seen_subcommand_from help" -f -a "search" -d 'Search for scopes (classes, methods) in a service'
complete -c pup -n "__fish_pup_using_subcommand symdb; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and not __fish_seen_subcommand_from tests locations suites multistep downtime help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand synthetics; and not __fish_seen_subcommand_from tests locations suites multistep downtime help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand synthetics; and not __fish_seen_subcommand_from tests locations suites multistep downtime help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and not __fish_seen_subcommand_from tests locations suites multistep downtime help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and not __fish_seen_subcommand_from tests locations suites multistep downtime help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and not __fish_seen_subcommand_from tests locations suites multistep downtime help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and not __fish_seen_subcommand_from tests locations suites multistep downtime help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and not __fish_seen_subcommand_from tests locations suites multistep downtime help" -f -a "tests" -d 'Manage synthetic tests'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and not __fish_seen_subcommand_from tests locations suites multistep downtime help" -f -a "locations" -d 'Manage test locations'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and not __fish_seen_subcommand_from tests locations suites multistep downtime help" -f -a "suites" -d 'Manage synthetic test suites'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and not __fish_seen_subcommand_from tests locations suites multistep downtime help" -f -a "multistep" -d 'Manage multistep API tests'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and not __fish_seen_subcommand_from tests locations suites multistep downtime help" -f -a "downtime" -d 'Manage Synthetics downtimes'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and not __fish_seen_subcommand_from tests locations suites multistep downtime help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from tests" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from tests" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from tests" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from tests" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from tests" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from tests" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from tests" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from tests" -f -a "list" -d 'List synthetic tests'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from tests" -f -a "get" -d 'Get test details'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from tests" -f -a "search" -d 'Search synthetic tests'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from tests" -f -a "run" -d 'Run synthetic tests (requires DD_API_KEY + DD_APP_KEY)'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from tests" -f -a "get-fast-result" -d 'Get a fast (latest) test result by result ID'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from tests" -f -a "get-result" -d 'Get a specific full result for an API Synthetic test'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from tests" -f -a "get-browser-result" -d 'Get a specific full result for a browser Synthetic test'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from tests" -f -a "list-latest-results" -d 'List the latest API test result summaries for a test'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from tests" -f -a "list-latest-browser-results" -d 'List the latest browser test result summaries for a test'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from tests" -f -a "poll-results" -d 'Poll for results given a list of result IDs (typical CI/CD use)'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from tests" -f -a "get-version" -d 'Get a specific version of a synthetic test'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from tests" -f -a "list-versions" -d 'List version history for a synthetic test'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from tests" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from locations" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from locations" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from locations" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from locations" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from locations" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from locations" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from locations" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from locations" -f -a "list" -d 'List available locations'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from locations" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from suites" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from suites" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from suites" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from suites" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from suites" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from suites" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from suites" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from suites" -f -a "list" -d 'Search synthetic suites'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from suites" -f -a "get" -d 'Get suite details'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from suites" -f -a "create" -d 'Create a synthetic suite'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from suites" -f -a "update" -d 'Update a synthetic suite'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from suites" -f -a "delete" -d 'Delete synthetic suites'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from suites" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from multistep" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from multistep" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from multistep" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from multistep" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from multistep" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from multistep" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from multistep" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from multistep" -f -a "get-subtests" -d 'Get subtests for a multistep API test'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from multistep" -f -a "get-subtest-parents" -d 'Get parent tests for a multistep API subtest'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from multistep" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from downtime" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from downtime" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from downtime" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from downtime" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from downtime" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from downtime" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from downtime" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from downtime" -f -a "list" -d 'List all Synthetics downtimes'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from downtime" -f -a "create" -d 'Create a new Synthetics downtime (body from JSON file)'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from downtime" -f -a "delete" -d 'Delete a Synthetics downtime by ID'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from downtime" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from help" -f -a "tests" -d 'Manage synthetic tests'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from help" -f -a "locations" -d 'Manage test locations'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from help" -f -a "suites" -d 'Manage synthetic test suites'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from help" -f -a "multistep" -d 'Manage multistep API tests'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from help" -f -a "downtime" -d 'Manage Synthetics downtimes'
complete -c pup -n "__fish_pup_using_subcommand synthetics; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand tags; and not __fish_seen_subcommand_from list get add update delete help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand tags; and not __fish_seen_subcommand_from list get add update delete help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand tags; and not __fish_seen_subcommand_from list get add update delete help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand tags; and not __fish_seen_subcommand_from list get add update delete help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand tags; and not __fish_seen_subcommand_from list get add update delete help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand tags; and not __fish_seen_subcommand_from list get add update delete help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand tags; and not __fish_seen_subcommand_from list get add update delete help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand tags; and not __fish_seen_subcommand_from list get add update delete help" -f -a "list" -d 'List all host tags'
complete -c pup -n "__fish_pup_using_subcommand tags; and not __fish_seen_subcommand_from list get add update delete help" -f -a "get" -d 'Get tags for a host'
complete -c pup -n "__fish_pup_using_subcommand tags; and not __fish_seen_subcommand_from list get add update delete help" -f -a "add" -d 'Add tags to a host'
complete -c pup -n "__fish_pup_using_subcommand tags; and not __fish_seen_subcommand_from list get add update delete help" -f -a "update" -d 'Update host tags'
complete -c pup -n "__fish_pup_using_subcommand tags; and not __fish_seen_subcommand_from list get add update delete help" -f -a "delete" -d 'Delete all tags from a host'
complete -c pup -n "__fish_pup_using_subcommand tags; and not __fish_seen_subcommand_from list get add update delete help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from get" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from get" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from get" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from get" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from get" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from add" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from add" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from add" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from add" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from add" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from add" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from update" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from update" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from update" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from update" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from update" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from update" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from update" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from delete" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from delete" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from delete" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from delete" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from delete" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from delete" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all host tags'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get tags for a host'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from help" -f -a "add" -d 'Add tags to a host'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from help" -f -a "update" -d 'Update host tags'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete all tags from a host'
complete -c pup -n "__fish_pup_using_subcommand tags; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and not __fish_seen_subcommand_from settings flaky-tests help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and not __fish_seen_subcommand_from settings flaky-tests help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and not __fish_seen_subcommand_from settings flaky-tests help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and not __fish_seen_subcommand_from settings flaky-tests help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and not __fish_seen_subcommand_from settings flaky-tests help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and not __fish_seen_subcommand_from settings flaky-tests help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and not __fish_seen_subcommand_from settings flaky-tests help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and not __fish_seen_subcommand_from settings flaky-tests help" -f -a "settings" -d 'Manage Test Optimization service settings'
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and not __fish_seen_subcommand_from settings flaky-tests help" -f -a "flaky-tests" -d 'Manage flaky tests'
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and not __fish_seen_subcommand_from settings flaky-tests help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and __fish_seen_subcommand_from settings" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and __fish_seen_subcommand_from settings" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and __fish_seen_subcommand_from settings" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and __fish_seen_subcommand_from settings" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and __fish_seen_subcommand_from settings" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and __fish_seen_subcommand_from settings" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and __fish_seen_subcommand_from settings" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and __fish_seen_subcommand_from settings" -f -a "get" -d 'Get Test Optimization service settings (body from JSON file)'
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and __fish_seen_subcommand_from settings" -f -a "update" -d 'Update Test Optimization service settings (body from JSON file)'
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and __fish_seen_subcommand_from settings" -f -a "delete" -d 'Delete Test Optimization service settings (body from JSON file)'
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and __fish_seen_subcommand_from settings" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and __fish_seen_subcommand_from flaky-tests" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and __fish_seen_subcommand_from flaky-tests" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and __fish_seen_subcommand_from flaky-tests" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and __fish_seen_subcommand_from flaky-tests" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and __fish_seen_subcommand_from flaky-tests" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and __fish_seen_subcommand_from flaky-tests" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and __fish_seen_subcommand_from flaky-tests" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and __fish_seen_subcommand_from flaky-tests" -f -a "search" -d 'Search for flaky tests'
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and __fish_seen_subcommand_from flaky-tests" -f -a "update" -d 'Update flaky test state (body from JSON file)'
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and __fish_seen_subcommand_from flaky-tests" -f -a "policies" -d 'Manage flaky test management policies'
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and __fish_seen_subcommand_from flaky-tests" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and __fish_seen_subcommand_from help" -f -a "settings" -d 'Manage Test Optimization service settings'
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and __fish_seen_subcommand_from help" -f -a "flaky-tests" -d 'Manage flaky tests'
complete -c pup -n "__fish_pup_using_subcommand test-optimization; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand traces; and not __fish_seen_subcommand_from search aggregate metrics help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand traces; and not __fish_seen_subcommand_from search aggregate metrics help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand traces; and not __fish_seen_subcommand_from search aggregate metrics help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand traces; and not __fish_seen_subcommand_from search aggregate metrics help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand traces; and not __fish_seen_subcommand_from search aggregate metrics help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand traces; and not __fish_seen_subcommand_from search aggregate metrics help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand traces; and not __fish_seen_subcommand_from search aggregate metrics help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand traces; and not __fish_seen_subcommand_from search aggregate metrics help" -f -a "search" -d 'Search for spans'
complete -c pup -n "__fish_pup_using_subcommand traces; and not __fish_seen_subcommand_from search aggregate metrics help" -f -a "aggregate" -d 'Compute aggregated stats over spans'
complete -c pup -n "__fish_pup_using_subcommand traces; and not __fish_seen_subcommand_from search aggregate metrics help" -f -a "metrics" -d 'Manage span-based metrics'
complete -c pup -n "__fish_pup_using_subcommand traces; and not __fish_seen_subcommand_from search aggregate metrics help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from search" -l query -d 'Span search query' -r
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from search" -l from -d 'Start time: 1h, 30m, 7d, RFC3339, Unix timestamp, or \'now\'' -r
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from search" -l to -d 'End time' -r
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from search" -l limit -d 'Maximum number of spans to return (1-1000)' -r
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from search" -l sort -d 'Sort order: timestamp or -timestamp' -r
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from search" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from search" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from search" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from search" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from search" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from search" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from search" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from aggregate" -l query -d 'Span search query' -r
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from aggregate" -l from -d 'Start time: 1h, 30m, 7d, RFC3339, Unix timestamp, or \'now\'' -r
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from aggregate" -l to -d 'End time' -r
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from aggregate" -l compute -d 'Aggregation: count, avg(@duration), percentile(@duration, 99), etc.' -r
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from aggregate" -l group-by -d 'Facet to group by (e.g., service, resource_name, @http.status_code)' -r
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from aggregate" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from aggregate" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from aggregate" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from aggregate" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from aggregate" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from aggregate" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from aggregate" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from metrics" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from metrics" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from metrics" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from metrics" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from metrics" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from metrics" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from metrics" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from metrics" -f -a "list" -d 'List all span-based metrics'
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from metrics" -f -a "get" -d 'Get a span-based metric by ID'
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from metrics" -f -a "create" -d 'Create a span-based metric from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from metrics" -f -a "update" -d 'Update a span-based metric from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from metrics" -f -a "delete" -d 'Delete a span-based metric'
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from metrics" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from help" -f -a "search" -d 'Search for spans'
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from help" -f -a "aggregate" -d 'Compute aggregated stats over spans'
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from help" -f -a "metrics" -d 'Manage span-based metrics'
complete -c pup -n "__fish_pup_using_subcommand traces; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand usage; and not __fish_seen_subcommand_from summary hourly help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand usage; and not __fish_seen_subcommand_from summary hourly help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand usage; and not __fish_seen_subcommand_from summary hourly help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand usage; and not __fish_seen_subcommand_from summary hourly help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand usage; and not __fish_seen_subcommand_from summary hourly help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand usage; and not __fish_seen_subcommand_from summary hourly help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand usage; and not __fish_seen_subcommand_from summary hourly help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand usage; and not __fish_seen_subcommand_from summary hourly help" -f -a "summary" -d 'Get usage summary'
complete -c pup -n "__fish_pup_using_subcommand usage; and not __fish_seen_subcommand_from summary hourly help" -f -a "hourly" -d 'Get hourly usage'
complete -c pup -n "__fish_pup_using_subcommand usage; and not __fish_seen_subcommand_from summary hourly help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand usage; and __fish_seen_subcommand_from summary" -l from -d 'Start time (30d, 60d, YYYY-MM-DD, or RFC3339)' -r
complete -c pup -n "__fish_pup_using_subcommand usage; and __fish_seen_subcommand_from summary" -l to -d 'End time (now, YYYY-MM-DD, or RFC3339)' -r
complete -c pup -n "__fish_pup_using_subcommand usage; and __fish_seen_subcommand_from summary" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand usage; and __fish_seen_subcommand_from summary" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand usage; and __fish_seen_subcommand_from summary" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand usage; and __fish_seen_subcommand_from summary" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand usage; and __fish_seen_subcommand_from summary" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand usage; and __fish_seen_subcommand_from summary" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand usage; and __fish_seen_subcommand_from summary" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand usage; and __fish_seen_subcommand_from hourly" -l from -d 'Start time (1d, 7d, YYYY-MM-DD, or RFC3339)' -r
complete -c pup -n "__fish_pup_using_subcommand usage; and __fish_seen_subcommand_from hourly" -l to -d 'End time (now, YYYY-MM-DD, or RFC3339)' -r
complete -c pup -n "__fish_pup_using_subcommand usage; and __fish_seen_subcommand_from hourly" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand usage; and __fish_seen_subcommand_from hourly" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand usage; and __fish_seen_subcommand_from hourly" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand usage; and __fish_seen_subcommand_from hourly" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand usage; and __fish_seen_subcommand_from hourly" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand usage; and __fish_seen_subcommand_from hourly" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand usage; and __fish_seen_subcommand_from hourly" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand usage; and __fish_seen_subcommand_from help" -f -a "summary" -d 'Get usage summary'
complete -c pup -n "__fish_pup_using_subcommand usage; and __fish_seen_subcommand_from help" -f -a "hourly" -d 'Get hourly usage'
complete -c pup -n "__fish_pup_using_subcommand usage; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand users; and not __fish_seen_subcommand_from list get roles seats service-accounts help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand users; and not __fish_seen_subcommand_from list get roles seats service-accounts help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand users; and not __fish_seen_subcommand_from list get roles seats service-accounts help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand users; and not __fish_seen_subcommand_from list get roles seats service-accounts help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand users; and not __fish_seen_subcommand_from list get roles seats service-accounts help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand users; and not __fish_seen_subcommand_from list get roles seats service-accounts help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand users; and not __fish_seen_subcommand_from list get roles seats service-accounts help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand users; and not __fish_seen_subcommand_from list get roles seats service-accounts help" -f -a "list" -d 'List users'
complete -c pup -n "__fish_pup_using_subcommand users; and not __fish_seen_subcommand_from list get roles seats service-accounts help" -f -a "get" -d 'Get user details'
complete -c pup -n "__fish_pup_using_subcommand users; and not __fish_seen_subcommand_from list get roles seats service-accounts help" -f -a "roles" -d 'Manage roles'
complete -c pup -n "__fish_pup_using_subcommand users; and not __fish_seen_subcommand_from list get roles seats service-accounts help" -f -a "seats" -d 'Manage seat assignments'
complete -c pup -n "__fish_pup_using_subcommand users; and not __fish_seen_subcommand_from list get roles seats service-accounts help" -f -a "service-accounts" -d 'Manage service accounts'
complete -c pup -n "__fish_pup_using_subcommand users; and not __fish_seen_subcommand_from list get roles seats service-accounts help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from list" -l page-size -d 'Results per page (max 100)' -r
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from list" -l page-number -d 'Page number (0-indexed)' -r
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from list" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from list" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from list" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from list" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from list" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from get" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from get" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from get" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from get" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from get" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from roles" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from roles" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from roles" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from roles" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from roles" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from roles" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from roles" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from roles" -f -a "list" -d 'List roles'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from roles" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from seats" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from seats" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from seats" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from seats" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from seats" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from seats" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from seats" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from seats" -f -a "users" -d 'Manage seat assignments'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from seats" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from service-accounts" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from service-accounts" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from service-accounts" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from service-accounts" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from service-accounts" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from service-accounts" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from service-accounts" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from service-accounts" -f -a "create" -d 'Create a service account from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from service-accounts" -f -a "app-keys" -d 'Manage application keys for a service account'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from service-accounts" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from help" -f -a "list" -d 'List users'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get user details'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from help" -f -a "roles" -d 'Manage roles'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from help" -f -a "seats" -d 'Manage seat assignments'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from help" -f -a "service-accounts" -d 'Manage service accounts'
complete -c pup -n "__fish_pup_using_subcommand users; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand version" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand version" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand version" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand version" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand version" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand version" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand version" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand workflows; and not __fish_seen_subcommand_from get create update delete run instances connections help" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand workflows; and not __fish_seen_subcommand_from get create update delete run instances connections help" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand workflows; and not __fish_seen_subcommand_from get create update delete run instances connections help" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand workflows; and not __fish_seen_subcommand_from get create update delete run instances connections help" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand workflows; and not __fish_seen_subcommand_from get create update delete run instances connections help" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand workflows; and not __fish_seen_subcommand_from get create update delete run instances connections help" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand workflows; and not __fish_seen_subcommand_from get create update delete run instances connections help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand workflows; and not __fish_seen_subcommand_from get create update delete run instances connections help" -f -a "get" -d 'Get a workflow by ID'
complete -c pup -n "__fish_pup_using_subcommand workflows; and not __fish_seen_subcommand_from get create update delete run instances connections help" -f -a "create" -d 'Create a workflow from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand workflows; and not __fish_seen_subcommand_from get create update delete run instances connections help" -f -a "update" -d 'Update a workflow from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand workflows; and not __fish_seen_subcommand_from get create update delete run instances connections help" -f -a "delete" -d 'Delete a workflow'
complete -c pup -n "__fish_pup_using_subcommand workflows; and not __fish_seen_subcommand_from get create update delete run instances connections help" -f -a "run" -d 'Execute a workflow via API trigger'
complete -c pup -n "__fish_pup_using_subcommand workflows; and not __fish_seen_subcommand_from get create update delete run instances connections help" -f -a "instances" -d 'Manage workflow instances (executions)'
complete -c pup -n "__fish_pup_using_subcommand workflows; and not __fish_seen_subcommand_from get create update delete run instances connections help" -f -a "connections" -d 'Manage action connections'
complete -c pup -n "__fish_pup_using_subcommand workflows; and not __fish_seen_subcommand_from get create update delete run instances connections help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from get" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from get" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from get" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from get" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from get" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from create" -l file -r
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from create" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from create" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from create" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from create" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from create" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from create" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from update" -l file -r
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from update" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from update" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from update" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from update" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from update" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from update" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from update" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from delete" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from delete" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from delete" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from delete" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from delete" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from delete" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from run" -l payload -d 'JSON payload for workflow input parameters' -r
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from run" -l payload-file -d 'Path to a JSON file with input parameters' -r
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from run" -l timeout -d 'Timeout when --wait is set (e.g. 30s, 5m, 1h)' -r
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from run" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from run" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from run" -l wait -d 'Wait for the workflow to complete before returning'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from run" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from run" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from run" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from run" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from run" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from instances" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from instances" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from instances" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from instances" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from instances" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from instances" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from instances" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from instances" -f -a "list" -d 'List instances of a workflow'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from instances" -f -a "get" -d 'Get a specific workflow instance'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from instances" -f -a "cancel" -d 'Cancel a running workflow instance'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from instances" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from connections" -s o -l output -d 'Output format (json, table, yaml, csv). Defaults to json, or $DD_OUTPUT / $PUP_OUTPUT when set' -r
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from connections" -l org -d 'Named org session (see \'pup auth login --org\')' -r
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from connections" -s y -l yes -d 'Auto-approve destructive operations'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from connections" -l agent -d 'Enable agent mode'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from connections" -l no-agent -d 'Disable agent mode (overrides auto-detection and --agent)'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from connections" -l read-only -d 'Block all write operations (create, update, delete)'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from connections" -s h -l help -d 'Print help'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from connections" -f -a "get" -d 'Get an action connection by ID'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from connections" -f -a "create" -d 'Create an action connection from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from connections" -f -a "update" -d 'Update an action connection from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from connections" -f -a "delete" -d 'Delete an action connection'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from connections" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get a workflow by ID'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a workflow from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from help" -f -a "update" -d 'Update a workflow from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete a workflow'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from help" -f -a "run" -d 'Execute a workflow via API trigger'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from help" -f -a "instances" -d 'Manage workflow instances (executions)'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from help" -f -a "connections" -d 'Manage action connections'
complete -c pup -n "__fish_pup_using_subcommand workflows; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "acp" -d 'Start a local ACP server that proxies to Datadog Bits AI'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "agent" -d 'Schema and guide for the datadog-agent daemon and AI coding assistants'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "agentless-scanning" -d 'Manage Agentless Scanning configurations'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "alias" -d 'Create shortcuts for pup commands'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "api" -d 'Make authenticated requests directly to the Datadog API'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "api-keys" -d 'Manage API keys'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "apm" -d 'Manage APM services and entities'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "app-builder" -d 'Manage App Builder applications'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "app-keys" -d 'Manage application keys'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "audit-logs" -d 'Query audit logs'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "auth" -d 'OAuth2 authentication commands'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "authn-mappings" -d 'Manage AuthN mappings for federated identity providers'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "bits" -d 'Ask Datadog Bits AI a question in natural language'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "cases" -d 'Manage case management cases and projects'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "change-requests" -d 'Manage change requests'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "cicd" -d 'Manage CI/CD visibility'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "cloud" -d 'Manage cloud integrations'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "code-coverage" -d 'Query code coverage data'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "completions" -d 'Generate shell completions'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "containers" -d 'Query running containers and container images'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "costs" -d 'Manage cost and billing data'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "csm-threats" -d 'Manage CSM Threats agent policies and rules'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "dashboards" -d 'Manage dashboards'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "data-deletion" -d 'Manage data deletion requests'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "data-governance" -d 'Manage data governance'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "datasets" -d 'Manage datasets'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "dbm" -d 'Search Database Monitoring query samples'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "ddsql" -d 'Query Datadog data using DDSQL (Datadog SQL)'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "debugger" -d 'Manage Live Debugger'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "deployment-gates" -d 'Manage Deployment Gates'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "docs" -d 'Ask the Datadog Docs AI a question'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "downtime" -d 'Manage monitor downtimes'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "error-tracking" -d 'Manage error tracking'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "events" -d 'Manage Datadog events'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "extension" -d 'Manage pup extensions'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "feature-flags" -d 'Manage feature flags'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "fleet" -d 'Manage Fleet Automation'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "format" -d 'Render JSON through pup\'s formatter'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "hamr" -d 'Manage High Availability Multi-Region (HAMR)'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "idp" -d 'Internal Developer Portal — agent-native context layer'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "incidents" -d 'Manage incidents'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "infrastructure" -d 'Manage infrastructure monitoring'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "integrations" -d 'Manage third-party integrations'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "investigations" -d 'Manage Bits AI investigations'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "kafka" -d '[Experimental] Inspect Kafka clusters via Datadog'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "llm-obs" -d 'Manage LLM Observability projects, experiments, and datasets'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "logs" -d 'Search and analyze logs'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "logs-restriction" -d 'Manage log restriction queries for role-based access control'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "metrics" -d 'Query and manage metrics'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "misc" -d 'Miscellaneous API operations'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "monitors" -d 'Manage monitors'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "network" -d 'Manage network monitoring'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "notebooks" -d 'Manage notebooks'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "obs-pipelines" -d 'Manage observability pipelines'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "on-call" -d 'Manage teams and on-call operations'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "organizations" -d 'Manage organization settings'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "processes" -d 'List and search running processes'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "product-analytics" -d 'Send product analytics events'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "profiling" -d 'Datadog Continuous Profiler (not supported in pup yet)'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "reference-tables" -d 'Manage reference tables for log enrichment'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "rum" -d 'Manage Real User Monitoring (RUM)'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "runbooks" -d 'Execute and manage local operational runbooks'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "scorecards" -d 'Manage service scorecards'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "security" -d 'Manage security monitoring'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "service-catalog" -d 'Manage service catalog'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "skills" -d 'Manage agent skills, subagents, and extensions for AI coding assistants'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "slos" -d 'Manage Service Level Objectives'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "software-catalog" -d 'Manage the Datadog Software Catalog'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "static-analysis" -d 'Manage static analysis'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "status-pages" -d 'Manage status pages'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "symdb" -d 'Query the Symbol Database (SymDB)'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "synthetics" -d 'Manage synthetic monitoring'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "tags" -d 'Manage host tags'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "test-optimization" -d 'Manage Test Optimization settings and flaky tests'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "traces" -d 'Search and aggregate APM traces'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "usage" -d 'Query usage and billing information'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "users" -d 'Manage users and access'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "version" -d 'Print version information'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "workflows" -d 'Manage Datadog workflows'
complete -c pup -n "__fish_pup_using_subcommand help; and not __fish_seen_subcommand_from acp agent agentless-scanning alias api api-keys apm app-builder app-keys audit-logs auth authn-mappings bits cases change-requests cicd cloud code-coverage completions containers costs csm-threats dashboards data-deletion data-governance datasets dbm ddsql debugger deployment-gates docs downtime error-tracking events extension feature-flags fleet format hamr idp incidents infrastructure integrations investigations kafka llm-obs logs logs-restriction metrics misc monitors network notebooks obs-pipelines on-call organizations processes product-analytics profiling reference-tables rum runbooks scorecards security service-catalog skills slos software-catalog static-analysis status-pages symdb synthetics tags test-optimization traces usage users version workflows help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from acp" -f -a "serve" -d 'Start an ACP server that delegates to Datadog Bits AI'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from agent" -f -a "schema" -d 'Output command schema as JSON'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from agent" -f -a "guide" -d 'Display the datadog-agent (Datadog-Agent) operational reference'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from agentless-scanning" -f -a "aws" -d 'Manage AWS agentless scan options and on-demand tasks'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from agentless-scanning" -f -a "azure" -d 'Manage Azure agentless scan options'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from agentless-scanning" -f -a "gcp" -d 'Manage GCP agentless scan options'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from alias" -f -a "list" -d 'List your aliases'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from alias" -f -a "set" -d 'Create a shortcut for a pup command'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from alias" -f -a "delete" -d 'Delete set aliases'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from alias" -f -a "import" -d 'Import aliases from a YAML file'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from api-keys" -f -a "list" -d 'List API keys'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from api-keys" -f -a "get" -d 'Get API key details'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from api-keys" -f -a "create" -d 'Create new API key'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from api-keys" -f -a "delete" -d 'Delete an API key (DESTRUCTIVE)'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from apm" -f -a "services" -d 'Manage APM services'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from apm" -f -a "entities" -d 'Manage APM entities'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from apm" -f -a "dependencies" -d 'Manage service dependencies'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from apm" -f -a "flow-map" -d 'View service flow map'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from apm" -f -a "troubleshooting" -d 'Troubleshoot APM instrumentation issues'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from apm" -f -a "service-remapping" -d 'Manage APM service remapping rules'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from apm" -f -a "service-config" -d 'View APM service instance configuration'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from apm" -f -a "service-library-config" -d 'View APM service library configuration'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from app-builder" -f -a "list" -d 'List App Builder applications'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from app-builder" -f -a "get" -d 'Get App Builder application details'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from app-builder" -f -a "create" -d 'Create a new App Builder application'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from app-builder" -f -a "update" -d 'Update an App Builder application'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from app-builder" -f -a "delete" -d 'Delete an App Builder application (DESTRUCTIVE)'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from app-builder" -f -a "delete-batch" -d 'Delete multiple App Builder applications (DESTRUCTIVE)'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from app-builder" -f -a "publish" -d 'Publish an App Builder application'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from app-builder" -f -a "unpublish" -d 'Unpublish an App Builder application'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from app-keys" -f -a "list" -d 'List application keys'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from app-keys" -f -a "get" -d 'Get application key details'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from app-keys" -f -a "create" -d 'Create a new application key'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from app-keys" -f -a "update" -d 'Update an application key'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from app-keys" -f -a "delete" -d 'Delete an application key (DESTRUCTIVE)'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from audit-logs" -f -a "list" -d 'List recent audit logs'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from audit-logs" -f -a "search" -d 'Search audit logs'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from auth" -f -a "login" -d 'Login via OAuth2'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from auth" -f -a "logout" -d 'Logout and clear tokens'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from auth" -f -a "status" -d 'Check authentication status'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from auth" -f -a "refresh" -d 'Refresh access token'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from auth" -f -a "list" -d 'List all stored org sessions'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from auth" -f -a "test" -d 'Test connection and credentials'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from authn-mappings" -f -a "list" -d 'List all AuthN mappings'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from authn-mappings" -f -a "get" -d 'Get an AuthN mapping'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from authn-mappings" -f -a "create" -d 'Create an AuthN mapping from JSON'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from authn-mappings" -f -a "update" -d 'Update an AuthN mapping'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from authn-mappings" -f -a "delete" -d 'Delete an AuthN mapping'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from bits" -f -a "ask" -d 'Ask Bits AI a natural-language question'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from cases" -f -a "search" -d 'Search cases'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from cases" -f -a "get" -d 'Get case details'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from cases" -f -a "create" -d 'Create a new case'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from cases" -f -a "comments" -d 'Manage comments on a case'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from cases" -f -a "timeline" -d 'Get the full timeline for a case (comments, attribute updates, etc.)'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from cases" -f -a "archive" -d 'Archive a case'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from cases" -f -a "unarchive" -d 'Unarchive a case'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from cases" -f -a "assign" -d 'Assign a case to a user'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from cases" -f -a "update-priority" -d 'Update case priority'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from cases" -f -a "update-status" -d 'Update case status'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from cases" -f -a "projects" -d 'Manage case projects'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from cases" -f -a "move" -d 'Move a case to a different project'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from cases" -f -a "update-title" -d 'Update case title'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from cases" -f -a "update-description" -d 'Update case description'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from cases" -f -a "jira" -d 'Manage Jira integrations for cases'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from cases" -f -a "servicenow" -d 'Manage ServiceNow integrations for cases'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from change-requests" -f -a "create" -d 'Create a change request'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from change-requests" -f -a "get" -d 'Get a change request'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from change-requests" -f -a "update" -d 'Update a change request'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from change-requests" -f -a "create-branch" -d 'Create a branch for a change request'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from change-requests" -f -a "decisions" -d 'Manage change request decisions'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from cicd" -f -a "pipelines" -d 'Manage CI pipelines'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from cicd" -f -a "tests" -d 'Query CI test events'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from cicd" -f -a "events" -d 'Query CI/CD events'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from cicd" -f -a "dora" -d 'Manage DORA metrics'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from cicd" -f -a "flaky-tests" -d 'Manage flaky tests'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from cloud" -f -a "aws" -d 'Manage AWS integrations'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from cloud" -f -a "gcp" -d 'Manage GCP integrations'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from cloud" -f -a "azure" -d 'Manage Azure integrations'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from cloud" -f -a "oci" -d 'Manage OCI integrations'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from code-coverage" -f -a "branch-summary" -d 'Get branch coverage summary'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from code-coverage" -f -a "commit-summary" -d 'Get commit coverage summary'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from containers" -f -a "list" -d 'List running containers'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from containers" -f -a "images" -d 'Manage container images'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from costs" -f -a "datadog" -d 'Manage Datadog cost and billing data (projected costs, attribution, cloud cost configs)'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from costs" -f -a "ccm" -d 'Manage Cloud Cost Management features (custom costs, budgets, commitments, tags)'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from costs" -f -a "oci-configs" -d 'Manage OCI (Oracle Cloud Infrastructure) cost configs'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from costs" -f -a "anomalies" -d 'Manage Cloud Cost Management anomalies'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from csm-threats" -f -a "agent-policies" -d 'Manage CSM Threats agent policies'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from csm-threats" -f -a "agent-rules" -d 'Manage CSM Threats agent rules'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from csm-threats" -f -a "backend-rules" -d 'Manage workload security backend detection rules'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from csm-threats" -f -a "policy" -d 'Manage CSM Threats policy'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from dashboards" -f -a "list" -d 'List all dashboards'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from dashboards" -f -a "get" -d 'Get dashboard details'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from dashboards" -f -a "url" -d 'Print dashboard URL, optionally scoped to a live time window'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from dashboards" -f -a "create" -d 'Create a dashboard from JSON file'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from dashboards" -f -a "update" -d 'Update a dashboard from JSON file'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from dashboards" -f -a "delete" -d 'Delete a dashboard'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from dashboards" -f -a "widgets" -d 'Manage saved widgets'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from dashboards" -f -a "annotations" -d 'Manage annotations on dashboard pages'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from data-deletion" -f -a "requests" -d 'Manage deletion requests'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from data-governance" -f -a "scanner" -d 'Manage sensitive data scanner'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from datasets" -f -a "list" -d 'List all datasets'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from datasets" -f -a "get" -d 'Get a dataset by ID'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from datasets" -f -a "create" -d 'Create a dataset from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from datasets" -f -a "update" -d 'Update a dataset from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from datasets" -f -a "delete" -d 'Delete a dataset'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from dbm" -f -a "samples" -d 'Manage DBM query samples'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from ddsql" -f -a "table" -d 'Execute DDSQL query and return columnar table data'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from ddsql" -f -a "time-series" -d 'Execute DDSQL query and return time series data'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from ddsql" -f -a "spec" -d 'Print DDSQL reference guidance from the editor tooling'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from ddsql" -f -a "schema" -d 'Discover DDSQL tables and columns'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from debugger" -f -a "probes" -d 'Manage Live Debugger log probes'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from debugger" -f -a "context" -d 'Show service debugger context (environments, probe support, language features)'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from deployment-gates" -f -a "gates" -d 'Manage deployment gates (CRUD)'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from deployment-gates" -f -a "evaluations" -d 'Manage deployment gate evaluations'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from deployment-gates" -f -a "rules" -d 'Manage deployment gate rules'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from docs" -f -a "ask" -d 'Ask the Datadog Docs AI a natural-language question'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from downtime" -f -a "list" -d 'List all downtimes'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from downtime" -f -a "get" -d 'Get downtime details'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from downtime" -f -a "create" -d 'Create a downtime from JSON file'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from downtime" -f -a "cancel" -d 'Cancel a downtime'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from error-tracking" -f -a "issues" -d 'Manage error issues'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from events" -f -a "list" -d 'List recent events'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from events" -f -a "search" -d 'Search events'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from events" -f -a "get" -d 'Get event details'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from extension" -f -a "list" -d 'List installed extensions'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from extension" -f -a "install" -d 'Install an extension'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from extension" -f -a "remove" -d 'Remove an installed extension'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from extension" -f -a "upgrade" -d 'Upgrade an extension to the latest version'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from feature-flags" -f -a "flags" -d 'Manage feature flag definitions'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from feature-flags" -f -a "environments" -d 'Manage feature flag environments'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from feature-flags" -f -a "allocations" -d 'Manage traffic allocations for a feature flag in an environment'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from feature-flags" -f -a "exposure" -d 'Manage exposure schedules for a feature flag'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from feature-flags" -f -a "enable" -d 'Enable a feature flag in an environment'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from feature-flags" -f -a "disable" -d 'Disable a feature flag in an environment'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from fleet" -f -a "agents" -d 'Manage fleet agents'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from fleet" -f -a "deployments" -d 'Manage fleet deployments'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from fleet" -f -a "schedules" -d 'Manage fleet schedules'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from fleet" -f -a "clusters" -d 'Manage fleet clusters'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from fleet" -f -a "tracers" -d 'Manage fleet tracers'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from fleet" -f -a "instrumented-pods" -d 'Manage fleet instrumented pods'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from hamr" -f -a "connections" -d 'Manage HAMR organization connections'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from idp" -f -a "assist" -d 'Get full context summary with suggested next actions'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from idp" -f -a "find" -d 'Find entities by name or query'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from idp" -f -a "owner" -d 'Resolve ownership, team details, and on-call context'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from idp" -f -a "deps" -d 'Show upstream and downstream service dependencies'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from idp" -f -a "register" -d 'Register a service definition from a YAML file'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from idp" -f -a "migrate-schema" -d 'Migrate a service catalog YAML file to v3 schema'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from incidents" -f -a "list" -d 'List all incidents'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from incidents" -f -a "get" -d 'Get incident details'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from incidents" -f -a "attachments" -d 'Manage incident attachments'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from incidents" -f -a "settings" -d 'Manage global incident settings'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from incidents" -f -a "handles" -d 'Manage global incident handles'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from incidents" -f -a "postmortem-templates" -d 'Manage incident postmortem templates'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from incidents" -f -a "services" -d 'Manage incident services'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from incidents" -f -a "import" -d 'Import an incident'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from infrastructure" -f -a "hosts" -d 'Manage hosts'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from integrations" -f -a "list" -d 'List all configured integrations'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from integrations" -f -a "jira" -d 'Manage Jira integration'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from integrations" -f -a "servicenow" -d 'Manage ServiceNow integration'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from integrations" -f -a "slack" -d 'Manage Slack integration'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from integrations" -f -a "pagerduty" -d 'Manage PagerDuty integration'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from integrations" -f -a "webhooks" -d 'Manage webhooks'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from integrations" -f -a "google-chat" -d 'Manage Google Chat integration'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from integrations" -f -a "ms-teams" -d 'Manage Microsoft Teams integration'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from integrations" -f -a "aws" -d 'Manage AWS integrations'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from investigations" -f -a "list" -d 'List investigations'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from investigations" -f -a "get" -d 'Get investigation details'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from investigations" -f -a "trigger" -d 'Trigger a new investigation'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from kafka" -f -a "topic-configs" -d 'Get Kafka topic configuration versions'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from kafka" -f -a "broker-configs" -d 'Get Kafka broker configuration versions'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from kafka" -f -a "client-configs" -d 'Get Kafka client (producer/consumer) configuration'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from kafka" -f -a "read-messages" -d 'Read messages from a Kafka cluster / topic via the Datadog Agent'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from kafka" -f -a "subject-schemas" -d 'Get all Schema Registry versions for a subject on a cluster'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from llm-obs" -f -a "projects" -d 'Manage LLM Observability projects'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from llm-obs" -f -a "experiments" -d 'Manage LLM Observability experiments'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from llm-obs" -f -a "datasets" -d 'Manage LLM Observability datasets'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from llm-obs" -f -a "spans" -d 'Search LLM Observability spans'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from llm-obs" -f -a "annotation-queues" -d 'Manage LLM Observability annotation queues'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from llm-obs" -f -a "eval-config" -d 'Manage LLM Observability custom evaluator configs'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from llm-obs" -f -a "evals" -d 'List LLM Observability evaluators'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from logs" -f -a "search" -d 'Search logs (v1 API)'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from logs" -f -a "list" -d 'List logs (v2 API)'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from logs" -f -a "query" -d 'Query logs (v2 API)'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from logs" -f -a "aggregate" -d 'Aggregate logs (v2 API)'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from logs" -f -a "archives" -d 'Manage log archives'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from logs" -f -a "custom-destinations" -d 'Manage custom log destinations'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from logs" -f -a "metrics" -d 'Manage log-based metrics'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from logs" -f -a "restriction-queries" -d 'Manage log restriction queries'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from logs-restriction" -f -a "list" -d 'List all restriction queries'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from logs-restriction" -f -a "get" -d 'Get a restriction query by ID'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from logs-restriction" -f -a "create" -d 'Create a restriction query from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from logs-restriction" -f -a "update" -d 'Update a restriction query from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from logs-restriction" -f -a "delete" -d 'Delete a restriction query'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from logs-restriction" -f -a "roles" -d 'Manage roles for a restriction query'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from metrics" -f -a "list" -d 'List all available metrics'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from metrics" -f -a "search" -d 'Search metrics (v1 API)'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from metrics" -f -a "query" -d 'Query time-series metrics data (v2 API)'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from metrics" -f -a "submit" -d 'Submit custom metrics to Datadog'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from metrics" -f -a "metadata" -d 'Manage metric metadata'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from metrics" -f -a "tags" -d 'Manage metric tags'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from metrics" -f -a "timeseries" -d 'Query v2 timeseries data via TimeseriesFormulaQueryRequest JSON body (SDK PR #1564)'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from misc" -f -a "ip-ranges" -d 'Get Datadog IP ranges'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from misc" -f -a "status" -d 'Check API status'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from monitors" -f -a "list" -d 'List monitors (limited results)'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from monitors" -f -a "get" -d 'Get monitor details'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from monitors" -f -a "create" -d 'Create a monitor from JSON file'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from monitors" -f -a "update" -d 'Update a monitor from JSON file'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from monitors" -f -a "search" -d 'Search monitors'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from monitors" -f -a "delete" -d 'Delete a monitor'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from network" -f -a "list" -d 'List network devices/monitors'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from network" -f -a "flows" -d 'Query network flows'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from network" -f -a "devices" -d 'Manage network devices'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from network" -f -a "interfaces" -d 'Manage network interface tags'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from notebooks" -f -a "list" -d 'List notebooks'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from notebooks" -f -a "get" -d 'Get notebook details'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from notebooks" -f -a "create" -d 'Create a new notebook'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from notebooks" -f -a "update" -d 'Update a notebook (full replace)'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from notebooks" -f -a "edit" -d 'Append cells to an existing notebook (reads current notebook first, then appends)'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from notebooks" -f -a "delete" -d 'Delete a notebook'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from notebooks" -f -a "annotations" -d 'Manage annotations on notebook pages'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from obs-pipelines" -f -a "list" -d 'List observability pipelines'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from obs-pipelines" -f -a "get" -d 'Get pipeline details'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from obs-pipelines" -f -a "create" -d 'Create a new pipeline from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from obs-pipelines" -f -a "update" -d 'Update an existing pipeline from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from obs-pipelines" -f -a "delete" -d 'Delete a pipeline'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from obs-pipelines" -f -a "validate" -d 'Validate a pipeline configuration without creating it'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from on-call" -f -a "teams" -d 'Manage teams'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from on-call" -f -a "escalation-policies" -d 'Manage escalation policies'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from on-call" -f -a "schedules" -d 'Manage on-call schedules'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from on-call" -f -a "notification-channels" -d 'Manage user notification channels'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from on-call" -f -a "notification-rules" -d 'Manage user notification rules'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from on-call" -f -a "pages" -d 'Manage on-call pages'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from organizations" -f -a "list" -d 'List organizations'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from organizations" -f -a "get" -d 'Get organization details'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from organizations" -f -a "policies" -d 'Manage organization group policies'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from organizations" -f -a "policy-overrides" -d 'Manage organization group policy overrides'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from organizations" -f -a "policy-configs" -d 'List available org group policy config definitions'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from processes" -f -a "list" -d 'List running processes'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from product-analytics" -f -a "events" -d 'Send product analytics events'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from product-analytics" -f -a "query" -d 'Run product analytics queries'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from reference-tables" -f -a "list" -d 'List reference tables'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from reference-tables" -f -a "get" -d 'Get a reference table by ID'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from reference-tables" -f -a "create" -d 'Create a reference table from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from reference-tables" -f -a "batch-query" -d 'Batch query reference table rows by primary key'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from rum" -f -a "apps" -d 'Manage RUM applications'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from rum" -f -a "aggregate" -d 'Aggregate RUM events by facets'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from rum" -f -a "events" -d 'List RUM events'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from rum" -f -a "sessions" -d 'Query RUM session replay data'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from rum" -f -a "metrics" -d 'Manage RUM custom metrics'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from rum" -f -a "retention-filters" -d 'Manage RUM retention filters'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from rum" -f -a "playlists" -d 'Manage session replay playlists'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from rum" -f -a "heatmaps" -d 'Query RUM interaction heatmaps'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from runbooks" -f -a "list" -d 'List available runbooks'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from runbooks" -f -a "describe" -d 'Show runbook details and steps'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from runbooks" -f -a "run" -d 'Execute a runbook'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from runbooks" -f -a "validate" -d 'Validate a runbook without executing'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from runbooks" -f -a "import" -d 'Import a runbook from a file path or URL'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from scorecards" -f -a "list" -d 'List all scorecards'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from scorecards" -f -a "rules" -d 'Manage scorecard rules'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from scorecards" -f -a "outcomes" -d 'Manage scorecard outcomes'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from scorecards" -f -a "campaigns" -d 'Manage scorecard campaigns'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from security" -f -a "findings" -d 'Search and analyze security findings (posture, vulnerabilities, misconfigs)'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from security" -f -a "signals" -d 'Search and analyze real-time security detections'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from security" -f -a "risk-scores" -d 'List entity risk scores'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from security" -f -a "rules" -d 'Manage detection rules'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from security" -f -a "suppressions" -d 'Manage suppression rules'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from security" -f -a "content-packs" -d 'Manage security content packs'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from security" -f -a "iocs" -d 'Explore indicators of compromise (IoCs)'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from security" -f -a "asm-custom-rules" -d 'Manage ASM WAF custom rules'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from security" -f -a "asm-exclusions" -d 'Manage ASM WAF exclusion filters'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from security" -f -a "restriction-policies" -d 'Manage resource restriction policies'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from security" -f -a "terraform" -d 'Export and convert security monitoring resources as Terraform'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from service-catalog" -f -a "list" -d 'List services'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from service-catalog" -f -a "get" -d 'Get service details'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from skills" -f -a "list" -d 'List available skills, agents, and extensions'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from skills" -f -a "install" -d 'Install skills, agents, and extensions for one or more platforms'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from skills" -f -a "path" -d 'Show where skills/agents/extensions would be installed'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from slos" -f -a "list" -d 'List all SLOs with optional API-backed filters'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from slos" -f -a "get" -d 'Get SLO details'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from slos" -f -a "create" -d 'Create an SLO from JSON file'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from slos" -f -a "update" -d 'Update an SLO from JSON file'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from slos" -f -a "delete" -d 'Delete an SLO'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from slos" -f -a "status" -d 'Get SLO status'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from software-catalog" -f -a "entities" -d 'Manage catalog entities'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from software-catalog" -f -a "kinds" -d 'Manage catalog kinds'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from software-catalog" -f -a "relations" -d 'Manage catalog relations'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from static-analysis" -f -a "custom-rulesets" -d 'Manage custom rulesets'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from static-analysis" -f -a "custom-rules" -d 'Manage custom rules within a ruleset'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from status-pages" -f -a "pages" -d 'Manage status pages'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from status-pages" -f -a "components" -d 'Manage status page components'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from status-pages" -f -a "degradations" -d 'Manage status page degradations'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from status-pages" -f -a "third-party" -d 'View third-party service outage signals'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from status-pages" -f -a "maintenances" -d 'Manage status page maintenances'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from symdb" -f -a "search" -d 'Search for scopes (classes, methods) in a service'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from synthetics" -f -a "tests" -d 'Manage synthetic tests'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from synthetics" -f -a "locations" -d 'Manage test locations'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from synthetics" -f -a "suites" -d 'Manage synthetic test suites'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from synthetics" -f -a "multistep" -d 'Manage multistep API tests'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from synthetics" -f -a "downtime" -d 'Manage Synthetics downtimes'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from tags" -f -a "list" -d 'List all host tags'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from tags" -f -a "get" -d 'Get tags for a host'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from tags" -f -a "add" -d 'Add tags to a host'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from tags" -f -a "update" -d 'Update host tags'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from tags" -f -a "delete" -d 'Delete all tags from a host'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from test-optimization" -f -a "settings" -d 'Manage Test Optimization service settings'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from test-optimization" -f -a "flaky-tests" -d 'Manage flaky tests'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from traces" -f -a "search" -d 'Search for spans'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from traces" -f -a "aggregate" -d 'Compute aggregated stats over spans'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from traces" -f -a "metrics" -d 'Manage span-based metrics'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from usage" -f -a "summary" -d 'Get usage summary'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from usage" -f -a "hourly" -d 'Get hourly usage'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from users" -f -a "list" -d 'List users'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from users" -f -a "get" -d 'Get user details'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from users" -f -a "roles" -d 'Manage roles'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from users" -f -a "seats" -d 'Manage seat assignments'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from users" -f -a "service-accounts" -d 'Manage service accounts'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from workflows" -f -a "get" -d 'Get a workflow by ID'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from workflows" -f -a "create" -d 'Create a workflow from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from workflows" -f -a "update" -d 'Update a workflow from a JSON file'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from workflows" -f -a "delete" -d 'Delete a workflow'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from workflows" -f -a "run" -d 'Execute a workflow via API trigger'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from workflows" -f -a "instances" -d 'Manage workflow instances (executions)'
complete -c pup -n "__fish_pup_using_subcommand help; and __fish_seen_subcommand_from workflows" -f -a "connections" -d 'Manage action connections'
