terraform {
    required_providers {
        spotinst = {
            source = "spotinst/spotinst"
        }
    }
}

provider spotinst {
    token    = "redacted"
    account  = "redacted"
}

#### Create Ocean ECS Cluster ####
module "ocean_ecs" {
    source = "stevenfeltner/ecs-ocean/spotinst"

    cluster_name                    = "ECS-Workshop"
    desired_capacity                = 0
    region                          = "us-west-2"
    subnet_ids                      = ["subnet-123456789, subnet-123456789, subnet-123456789, subnet-123456789"]
    security_group_ids              = ["sg-123456789"]
    iam_instance_profile            = "arn:aws:iam::123456789:instance-profile/ecsInstanceRole"

    tags                            = {CreatedBy = "terraform"}
}

output "ocean_id" {
    value = module.ocean_ecs.ocean_id
}

module "ocean_ecs_launchspec" {
    source = "stevenfeltner/ecs-ocean-launchspec/spotinst"

    name                            = "VNG1"
    ocean_id                        = module.ocean_ecs.ocean_id
    attributes                      = {Test = "example"}

    tags                            = {CreatedBy = "terraform"}
}

output "ocean_launchspec_id" {
    value = module.ocean_ecs_launchspec.launchspec_id
}
