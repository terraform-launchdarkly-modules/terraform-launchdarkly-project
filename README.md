# Module name: terraform-launchdarkly-project

A reusable Terraform module to manage project using launchdarkly provider.

This module is designed for flexibility, reusability, and clean output. It supports multiple environments and adheres to Terraform best practices.

---

## 📦 Features

- Create and configure [resource type, e.g., LaunchDarkly Projects]
- Manage multiple environments per project
- Customize tags, colors, and approval settings
- Compatible with Terraform `1.x` and the [`launchdarkly` provider]

---

## 📝 Usage

<!-- Adjust the example to match your module structure -->

```hcl
module "project" {
  source = "git::https://github.com/terraform-launchdarkly-modules/terraform-launchdarkly-project.git"

  project_key = "example-project"
  project_name = "Example Project"
  tags = ["terraform"]

  environments = {
  production = {
    key   = "production"
    name  = "Production"
    color = "eeeeee"
    tags  = ["environment-terraform"]

    approval_settings = {
      can_review_own_request     = true
      can_apply_declined_changes = false
      required = true
      min_num_approvals = 1
      required_approval_tags = []
    }
  }

  staging = {
    key   = "staging"
    name  = "Staging"
    color = "000000"
    tags  = ["environment-terraform"]
    approval_settings = {
      can_review_own_request     = false
      can_apply_declined_changes = false
      required = true
      min_num_approvals = 1
      required_approval_tags = []

    }
  }
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_client_side_availability"></a> [default\_client\_side\_availability](#input\_default\_client\_side\_availability) | n/a | <pre>object({<br/>    using_environment_id = bool<br/>    using_mobile_key     = bool<br/>  })</pre> | `null` | no |
| <a name="input_environments"></a> [environments](#input\_environments) | n/a | <pre>map(object({<br/>    key   = string<br/>    name  = string<br/>    color = string<br/><br/>    tags                 = optional(list(string))<br/>    confirm_changes      = optional(bool)<br/>    critical             = optional(bool)<br/>    default_track_events = optional(bool)<br/>    default_ttl          = optional(number)<br/>    require_comments     = optional(bool)<br/>    secure_mode          = optional(bool)<br/><br/>    approval_settings = optional(object({<br/>      required               = optional(bool)<br/>      required_approval_tags = optional(list(string))<br/>      auto_apply_approved_changes = optional(bool)<br/>      can_review_own_request      = optional(bool)<br/>      can_apply_declined_changes  = optional(bool)<br/>      min_num_approvals           = optional(number)<br/><br/>      # Mutually exclusive rule: either these tags OR required = true<br/>      # required               = optional(bool)<br/>      # required_approval_tags = optional(list(string))<br/><br/>      service_kind   = optional(string)<br/>      service_config = optional(map(string))<br/>    }))<br/>  }))</pre> | n/a | yes |
| <a name="input_launchdarkly_access_token"></a> [launchdarkly\_access\_token](#input\_launchdarkly\_access\_token) | Your LaunchDarkly personal access token | `string` | n/a | yes |
| <a name="input_project_key"></a> [project\_key](#input\_project\_key) | The key of the LaunchDarkly project. | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the LaunchDarkly project. | `string` | n/a | yes |
| <a name="input_project_tags"></a> [project\_tags](#input\_project\_tags) | Tags for the project. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project_key"></a> [project\_key](#output\_project\_key) | The key of the LaunchDarkly project. |
| <a name="output_project_name"></a> [project\_name](#output\_project\_name) | The name of the LaunchDarkly project. |
| <a name="output_project_tags"></a> [project\_tags](#output\_project\_tags) | values of the tags for the project. |
<!-- END_TF_DOCS -->