resource "null_resource" "copy" {

  connection {
    type        = "ssh"
    host        = aws_instance.web1.public_ip
    user        = "ubuntu"
    private_key = file("sree-key1")
  }

  provisioner "file" {
    source      = "apache.sh"
    destination = "/home/ubuntu/moodle.sh"
  }

  provisioner "file" {
    source      = "moodle.conf"
    destination = "/home/ubuntu/moodle.conf"
  }

  provisioner "file" {
    source      = "moodle.yaml"
    destination = "/home/ubuntu/moodle.yaml"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /home/ubuntu/moodle.sh",
      "sh /home/ubuntu/moodle.sh",
    ]
  }

  depends_on = [aws_instance.web1]

}
