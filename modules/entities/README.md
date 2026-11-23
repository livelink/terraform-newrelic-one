# NewRelic Entities Terraform Module

Resolves entities created outside Terraform (e.g. APM) to their GUID and name, so they can be referenced in NRQL alert
condition filters via a Terragrunt dependency output.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.0 |
| <a name="requirement_newrelic"></a> [newrelic](#requirement\_newrelic) | ~> 3.4 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_newrelic"></a> [newrelic](#provider\_newrelic) | ~> 3.4 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [newrelic_entity_tags.default](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/entity_tags) | resource |
| [newrelic_entity.default](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/data-sources/entity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_entities"></a> [entities](#input\_entities) | Entity lookups keyed by logical name. Resolves entities created outside Terraform (e.g. APM applications) to their GUID and name for use in NRQL alert condition filters. | <pre>map(object({<br/>    name        = string<br/>    type        = optional(string)<br/>    domain      = optional(string)<br/>    ignore_case = optional(bool)<br/>    tags        = optional(map(any))<br/>    add_tags    = optional(map(any))<br/>  }))</pre> | `{}` | no |
| <a name="input_global_add_tags"></a> [global\_add\_tags](#input\_global\_add\_tags) | Tags to be added to all entities globally. | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_entities"></a> [entities](#output\_entities) | Entities |
<!-- END_TF_DOCS -->
