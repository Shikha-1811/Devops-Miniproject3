variable "region" {
  default = "us-east-2"
}

variable "zone1" {
  default = "us-east-2a"
}

variable "miniprouser" {
  default = "ubuntu"
}

variable "amiID" {
  type = map(any)
  default = {
    us-east-2 = "ami-0cfde0ea8edd312d4"
  }
}