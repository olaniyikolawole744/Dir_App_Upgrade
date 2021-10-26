terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = var.vpc_region
}

resource "aws_route_table_association" "aws_route_table_association_public_subnet" {
  count = length(var.subnet_marker_values)
  subnet_id =  data.aws_subnet.selected[count.index].id
  route_table_id = tolist(data.aws_route_tables.rts.ids)[0]
  }






output sub_id {
    
    value = data.aws_subnet.selected[0].id
}

output sub_id2 {
    
    value = data.aws_subnet.selected[1].id
}

output sub_id3 {
    
    value = data.aws_subnet.selected[2].id
}

output rtbl_id {
    value = tolist(data.aws_route_tables.rts.ids)[0]
    
}
