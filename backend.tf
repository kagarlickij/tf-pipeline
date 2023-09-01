terraform {
  cloud {
    organization = "kag-demo"
    workspaces {
      name = "tf-pipeline"
    }
  }
}
