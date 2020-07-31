resource "ibm_container_vpc_cluster" "cluster" {
  name              = "my_vpc_cluster"
  vpc_id            = "6015365a-9d93-4bb4-8248-79ae0db2dc21"
  flavor            = "c2.2x4"
  worker_count      = "1"
  resource_group_id = data.ibm_resource_group.resource_group.id
  zones {
    subnet_id = "015ffb8b-efb1-4c03-8757-29335a07493h"
    name      = "us-south-1"
  }
}

resource "ibm_container_vpc_alb" "alb" {
  alb_id = "public-cr083d810e501d4c73b42184eab5a7ad56-alb"
  enable = true
}

resource "ibm_container_vpc_worker_pool" "test_pool" {
  cluster          = "my_vpc_cluster"
  worker_pool_name = "my_vpc_pool"
  flavor           = "c2.2x4"
  vpc_id           = "6015365a-9d93-4bb4-8248-79ae0db2dc21"
  worker_count     = "1"

  zones {
    name      = "us-south-1"
    subnet_id = "015ffb8b-efb1-4c03-8757-29335a07493b"
  }
}