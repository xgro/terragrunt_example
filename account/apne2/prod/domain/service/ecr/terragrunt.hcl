include "root" {
  path = find_in_parent_folders()
}


include "config" {
  path = "${dirname(find_in_parent_folders())}/config/domain/service/ecr.hcl"
}
