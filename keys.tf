resource "aws_key_pair" "sree-key1" {
  key_name   = "sree-key1"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}
