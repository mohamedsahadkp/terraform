# Project General Info
variable "project" {
  type        = map
  default     = {}
  description = "Project Config Maps"
}
# API
variable "api" {
  type        = map
  default     = {}
  description = "API Config Map"
}
# Database
variable "database" {
  type        = map
  default     = {}
  description = "Datebase Config Map"
}
# Network
variable "network" {
  type        = map
  default     = {}
  description = "Network Config Map"
}
# WebApp
variable "app" {
  type        = map
  default     = {}
  description = "WebApp Config Map"
}
# Files
variable "files" {
  type        = map
  default     = {}
  description = "Files Config Map"
}
# Domain
variable "domain" {
  type        = map
  default     = {}
  description = "Domain Config Map"
}
