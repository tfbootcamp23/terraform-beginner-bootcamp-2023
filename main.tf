terraform {
    cloud {
    organization = "tborg"

    workspaces {
      name = "th-week-2"
    }
  }
  required_providers {
    terratowns = {
      source  = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
}

provider "terratowns" {
  endpoint  = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token     = var.terratowns_access_token
}

module "terrahouse_aws" {
  source              = "./modules/terrahouse_aws"
  user_uuid           = var.teacherseat_user_uuid
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  assets_path         = var.assets_path
  content_version     = var.content_version
}

# resource "terratowns_home" "home" {
#   name            = "How to play Arcanum in 2023!"
#   description     = <<DESCRIPTION
# Arcanum is a game from 2001 that shipped with alot of bugs.
# Modders have removed all the originals making this game really fun
# to play (despite that old look graphics). This is my guide that will
# show you how to play arcanum without spoiling the plot.
# DESCRIPTION
#   domain_name     = module.terrahouse_aws.cloudfront_url
#   town            = "missingo"
#   content_version = 1
# }

resource "terratowns_home" "home" {
  name            = "Under Construction!"
  description     = <<DESCRIPTION
Work in progress. Just Like William Hung, I REALLY LIKE MUSIC
https://www.youtube.com/watch?v=PxOQriOSFdQ
DESCRIPTION
  domain_name     = module.terrahouse_aws.cloudfront_url
  town            = "melomaniac-mansion"
  content_version = 2
}