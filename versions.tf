terraform {
  required_providers {
    launchdarkly = {
      source  = "launchdarkly/launchdarkly"
      version = "~> 2.0" # or the latest stable version
    }
  }

  required_version = ">= 1.3.0"
}
