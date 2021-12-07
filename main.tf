terraform {
  required_version = ">= 0.13.0"
  required_providers {
    spotinst = {
      source = "spotinst/spotinst"
    }
  }
}


resource "spotinst_ocean_ecs_launch_spec" "launchspec" {
  name                        = var.name
  ocean_id                    = var.ocean_id

  user_data                   = var.user_data
  image_id                    = var.image_id
  iam_instance_profile        = var.iam_instance_profile
  security_group_ids          = var.security_group_ids

  dynamic tags {
    for_each = var.tags == null ? [] : var.tags
    content {
      key = tags.value["key"]
      value = tags.value["value"]
    }
  }

  instance_types                = var.instance_types
  restrict_scale_down           = var.restrict_scale_down
  subnet_ids                    = var.subnet_ids

  ## Block Device Mappings ##
  block_device_mappings {
    device_name                 = var.device_name
    ebs {
      delete_on_termination     = var.delete_on_termination
      encrypted                 = var.encrypted
      iops                      = var.iops
      kms_key_id                = var.kms_key_id
      snapshot_id               = var.snapshot_id
      volume_type               = var.volume_type
      volume_size               = var.volume_size
      throughput                = var.throughput
      dynamic_volume_size {
        base_size               = var.base_size
        resource                = var.resource
        size_per_resource_unit  = var.size_per_resource_unit
      }
      no_device                 = var.no_device
    }
  }

  dynamic attributes {
    for_each = var.attributes == null ? [] : var.attributes
    content {
      key = attributes.value["key"]
      value = attributes.value["value"]
    }
  }

  autoscale_headrooms {
    cpu_per_unit                = var.cpu_per_unit
    memory_per_unit             = var.memory_per_unit
    num_of_units                = var.num_of_units
  }
}