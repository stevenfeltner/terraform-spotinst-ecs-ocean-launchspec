#### Create Ocean ECS Cluster ####
module "ecs-ocean-launchspec" {
    source = "../"

    spot_token                      = "12345678901234567890"
    spot_account                    = "act-123456789"

    ocean_id = module.ecs-ocean.ocean_id
    name = "Example Launchspec"

    tags = [{key = "CreatedBy", value = "terraform"},{key = "Env", value = "Dev"}]
}

output "launchspec_id" {
    value = module.ecs-ocean-launchspec.launchspec_id
}

    
