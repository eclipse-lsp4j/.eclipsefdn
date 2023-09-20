local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-lsp4j') {
  settings+: {
    billing_email: "webmaster@eclipse.org",
    default_repository_permission: "none",
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
    name: "Eclipse LSP4J™",
    packages_containers_internal: false,
    packages_containers_public: false,
    readers_can_create_discussions: true,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/lsp4j/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
  ],
  _repositories+:: [
    orgs.newRepo('lsp4j') {
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "A Java implementation of the language server protocol intended to be consumed by tools and language servers implemented in Java.",
      has_wiki: false,
      homepage: "https://eclipse.org/lsp4j",
      topics+: [
        "eclipse",
        "java",
        "language-server-protocol"
      ],
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 0,
        },
      ],
    },
  ],
}
