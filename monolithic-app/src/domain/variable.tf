variable "project" {
  type        = map
  default     = {}
  description = "Project Config Maps"
}
variable "domain" {
  type        = map
  default     = {}
  description = "Domain Config Map"
}
variable "record_list" {
  type        = map
  default     = ["api", "web"]
  description = "Record list Config Map"
}

