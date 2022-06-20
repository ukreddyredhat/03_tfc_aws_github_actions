terraform {
  cloud {
    organization = "lomar"

    workspaces {
      name = "03_tfc_aws_github_actions"
    }
  }
}