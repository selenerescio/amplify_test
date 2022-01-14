resource "aws_amplify_app" "wildrydes-site" {
  name       = "wildrydes-site"
  repository = "https://github.com/selenerescio/amplify_test"
# GitHub personal access token
  access_token = "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"
# The default rewrites and redirects added by the Amplify Console.
  custom_rule {
    source = "/<*>"
    status = "404"
    target = "/index.html"
  }

  #Auto Branch Creation
  enable_auto_branch_creation = true

  # The default patterns added by the Amplify Console.
  auto_branch_creation_patterns = [
    "*",
    "*/**",
  ]

  auto_branch_creation_config {
    # Enable auto build for the created branch.
    enable_auto_build = true
}

}
resource "aws_amplify_branch" "develop" {
  app_id      = aws_amplify_app.wildrydes-site.id
  branch_name = "master"
  stage     = "PRODUCTION"
}