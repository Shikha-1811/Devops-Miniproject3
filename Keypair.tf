resource "aws_key_pair" "minipro-key" {
  key_name   = "minipro-key"
  public_key = file("minipro-key.pub")
}