variable "accounts" {
  description = "List of AWS accounts as objects"
  type = map(object({
    region     = string
    access_key = string
    secret_key = string
    bucket_name = string
  }))

  default = {
    terraform2 = {
            region = "us-east-1"
            access_key  = "ASIA4MTWKHNIGSDYCA4Q"
            secret_key  = "XtREp1spRjxNELNVm4Cgl5CwpiYWoQUnfyce/LWO"
            bucket_name = "terraform-2"
          }
    terraform3 = {
            region = "us-east-1"
            access_key = "ASIA4MTWKHNIJHSJJJN4"
            secret_key = "xaNIXSynVDCzMlp17IRsIRF2jEwPpRGOfVB0OV6U"
            bucket_name = "terraform-3"
          }
  }
}

