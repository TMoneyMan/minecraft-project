resource "aws_instance" "minecraft_server" {
  
  ami           = "ami-02e8e2a390064c712"  
  instance_type = "t3.medium"
  subnet_id     = aws_subnet.subnet.id
  key_name      = "lab7"  

  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.minecraft_sg.id]

  tags = {
    Name = "MinecraftServer"
  }

}

