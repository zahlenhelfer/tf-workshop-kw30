resource "aws_instance" "app_server" {
  ami           = "ami-0a1ee2fb28fe05df3"
  instance_type = "t2.micro"
  tags = {
    Name = "MRO-ExampleAppServerInstance"
  }
}
