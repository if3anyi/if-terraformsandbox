variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default     = 8080
}

variable "list_example" {
  description = "An example of a list in Terraform"
  type        = "list"
  default     = [1, 2, 3]
}

variable "map_example" {
  description = "An example of a map in Terraform"
  type        = "map"

  default = {
    key1 = "value1"
    key2 = "value2"
    key3 = "value3"
  }
}


variable "cluster_name" {
  description = "Name to use for cluster"
}


variable "bucket_name" {
  description = "Name to use for cluster"
}

variable "min_size" {
  description = "Name to use for cluster"
}

variable "max_size" {
  description = "Name to use for cluster"
}

variable "instance_type" {
  description = "Name to use for cluster"
}
