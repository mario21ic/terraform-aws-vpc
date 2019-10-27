region = "us-east-2"

env      = "draft"
vpc_cidr = "10.0.0.0/16"

subnet_publics = [
  {
    zone = "a"
    cidr = "10.0.0.0/24"
  },
  {
    zone = "b"
    cidr = "10.0.2.0/24"
  },
  {
    zone = "c"
    cidr = "10.0.4.0/24"
  }
]
subnet_privates = [
  {
    zone = "a"
    cidr = "10.0.1.0/24"
  },
  {
    zone = "b"
    cidr = "10.0.3.0/24"
  },
  {
    zone = "c"
    cidr = "10.0.5.0/24"
  }
]
