# ECS on Spot.io

# Spot Ocean ECS Terraform Module

## Prerequisites

* Have an ECS cluster created and integrated with Ocean on Spot.io
* Spot Account and API Token

## Usage
```hcl
module "ecs-ocean-launchspec" {
  source = "../"

  spot_token                      = "12345678901234567890"
  spot_account                    = "act-123456789"

  ocean_id = module.ecs-ocean.ocean_id
  name = "Example Launchspec"

  tags = [{key = "CreatedBy", value = "terraform"},{key = "Env", value = "Dev"}]
}
```

## Resources
This module creates and manages the following resources:
- spotinst_ocean_ecs_launchspec

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >=0.13.0 |
| spotinst | >= 1.45.0 |

## Providers

| Name | Version |
|------|---------|
| spotinst | >= 1.45.0 |


## Outputs

| Name | Description |
|------|-------------|
| lauchspec\_id | The ID of the Ocean launchspec (VNG) |

## Documentation

If you're new to [Spot](https://spot.io/) and want to get started, please checkout our [Getting Started](https://docs.spot.io/connect-your-cloud-provider/) guide, available on the [Spot Documentation](https://docs.spot.io/) website.

## Getting Help

We use GitHub issues for tracking bugs and feature requests. Please use these community resources for getting help:

- Ask a question on [Stack Overflow](https://stackoverflow.com/) and tag it with [terraform-spotinst](https://stackoverflow.com/questions/tagged/terraform-spotinst/).
- Join our [Spot](https://spot.io/) community on [Slack](http://slack.spot.io/).
- Open an issue.

## Community

- [Slack](http://slack.spot.io/)
- [Twitter](https://twitter.com/spot_hq/)

## Contributing

Please see the [contribution guidelines](CONTRIBUTING.md).

## License

Code is licensed under the [Apache License 2.0](LICENSE).