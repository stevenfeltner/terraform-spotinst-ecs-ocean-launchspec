## Spot credentials
variable "spot_account" {
  type = string
}
variable "spot_token" {
  type      = string
  sensitive = true
}

## Launchspec Variables ##
variable "name" {
  type        = string
  description = "The Ocean Launch Specification name."
}
variable "ocean_id" {
  type        = string
  description = "The Ocean cluster ID"
}
variable "user_data" {
  type        = string
  default     = null
  description = "Base64-encoded MIME user data to make available to the instances."
}
variable "image_id" {
  type        = string
  default     = null
  description = "ID of the image used to launch the instances."
}
variable "iam_instance_profile" {
  type        = string
  default     = null
  description = "The ARN or name of an IAM instance profile to associate with launched instances."
}
variable "security_group_ids" {
  type        = list(string)
  default     = null
  description = "One or more security group ids"
}
variable "tags" {
  type = list(object({
    key = string
    value = string
  }))
  default     = null
  description = "Tags to be added to resources"
}
variable "instance_types" {
  type        = list(string)
  default     = null
  description = "A list of instance types allowed to be provisioned for pods pending under the specified launch specification. The list overrides the list defined for the Ocean cluster."
}
variable "restrict_scale_down" {
  type      = bool
  default     = null
  description = "When set to “True”, VNG nodes will be treated as if all pods running have the restrict-scale-down label. Therefore, Ocean will not scale nodes down unless empty."
}
variable "subnet_ids" {
  type        = list(string)
  default     = null
  description = "One or more security group ids"
}
###################


## Block Device Mappings ##
variable "device_name" {
  type        = string
  default     = ""
  description = "Set device name. (Example: /dev/xvda1)."
}
variable "delete_on_termination" {
  type        = string
  default     = null
  description = "Flag to delete the EBS on instance termination."
}
variable "encrypted" {
  type        = bool
  default     = null
  description = "Enables EBS encryption on the volume."
}
variable "iops" {
  type        = string
  default     = null
  description = "(Required for requests to create io1 volumes; it is not used in requests to create gp2, st1, sc1, or standard volumes) Int. The number of I/O operations per second (IOPS) that the volume supports."
}
variable "kms_key_id" {
  type        = string
  default     = null
  description = "Identifier (key ID, key alias, ID ARN, or alias ARN) for a customer managed CMK under which the EBS volume is encrypted."
}
variable "snapshot_id" {
  type        = string
  default     = null
  description = "The Snapshot ID to mount by."
}
variable "volume_type" {
  type        = string
  default     = null
  description = "The type of the volume. (Example: gp2)."
}
variable "volume_size" {
  type        = number
  default     = null
  description = "The size, in GB of the volume."
}
variable "throughput" {
  type        = number
  default     = null
  description = "The amount of data transferred to or from a storage device per second, you can use this param just in a case that volume_type = gp3."
}
###################

## Dynamic Volume Size ##
variable "base_size" {
  type        = number
  default     = 30
  description = "Int. Initial size for volume. (Example: 50)"
}
variable "resource" {
  type        = string
  default     = "CPU"
  description = "Resource type to increase volume size dynamically by. (Valid values: CPU)"
}
variable "size_per_resource_unit" {
  type        = number
  default     = 20
  description = "Int. Additional size (in GB) per resource unit. (Example: baseSize=50, sizePerResourceUnit=20, and instance with 2 CPU is launched; its total disk size will be: 90GB)"
}
variable "no_device" {
  type        = string
  default     = null
  description = "String. Suppresses the specified device included in the block device mapping of the AMI."
}
##################

## Attributes ##
variable "attributes" {
  type = list(object({
    key = string
    value = string
  }))
  default     = null
  description = "attributes to be use"
}

## Headroom ##
variable "cpu_per_unit" {
  type        = number
  default     = null
  description = "Optionally configure the number of CPUs to allocate for each headroom unit. CPUs are denoted in millicores, where 1000 millicores = 1 vCPU."
}
variable "memory_per_unit" {
  type        = number
  default     = null
  description = "Optionally configure the amount of memory (MiB) to allocate for each headroom unit."
}
variable "num_of_units" {
  type        = number
  default     = 0
  description = "The number of units to retain as headroom, where each unit has the defined headroom CPU, memory and GPU."
}
##################
