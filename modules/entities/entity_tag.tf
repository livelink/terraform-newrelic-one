# Add default tags + user-specified tags
# (`client` tag is already assigned elsewhere)
locals {
  entities_tags = { for k, v in var.entities : k => merge(
    v.add_tags, {
      "managed_by" = ["terraform"]
    }
  ) }
}

# Keys shared between var.entities and local.entities_tags; can just call var.entities
resource "newrelic_entity_tags" "default" {
  for_each = var.entities

  guid = data.newrelic_entity.default[each.key].guid

  dynamic "tag" {
    for_each = local.entities_tags[each.key]
    content {
      key    = tag.key
      values = tag.value
    }
  }
}
