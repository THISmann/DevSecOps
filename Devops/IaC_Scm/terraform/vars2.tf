variable "ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCg0VzslbjD/zWeRvqxi+E4bDh6TmuN+o1oUt9tDWM2Huq6x4cNcHPHmtUSdB3zNhqBp8KMi8yBb9HbEzC5Ge+Z47I1p0ayc5EPqMWwcBhuiHulHS0VNkF+EECgxBQdNJDEtYH0QJEhVJMxiGlweqNjveI7nU+Cd2KnAKvznejd9gHf+DwYvtER/HHD3+X//YoYZSSQpNZaLAKFK0ZxObiraYchNHDEE1NwNMwL8h+4jk90MA6J4vKa+nTlP64kBa4iF+m7brctV0uc+feTwhwudjebGGC/0LuqFw7RB0R7rzy0Fbl8GJB32IUPZK66TZptK+nLav214RTwwZ3wy+1d0iKvWhcAYmWIxGEql1GPKDPLDjs+mDhFm84wgh4akArRr0RjOIT++mCufPNA7rjpxM/OmZSC70pBQvPGik+eu+OZm5H+9/MclA2HYibab8gwMXbo+8v2U0IrzUf/opXuWeBr2y4byig0xrPGkYar+DAQPYWjwr3qdVcazd3bg2LxUnuWrSP+aXxcwPf5a3ScOrZA1tB9HidPNKX9XjTPXd+bW+TpWq+vusqJ6yULKLc+xoN57Cs3Hrz6dSC/JzRGrfkDHiI+BVJS/JrOJVzBYlCTt2s1p9Coxx4mlNyJ+198Wd6kNEzUwlx5A3qI+rseE21JMeauKNfiEx/ruCxpZQ== root@etienne-HP-EliteDesk-800-G1-SFF"
}

variable "proxmox_host" {
    default = "innopolis"
}

variable "template_name" {
    default = "focal-server-cloudimg-amd64"
}