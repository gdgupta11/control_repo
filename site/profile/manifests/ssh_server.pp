class profile::ssh_server{
        package { 'openssh-server':
          ensure => present,
        }
        service { 'sshd':
          ensure => running,
          enable => true,
        }

        ssh_authorized_key{'root@master.puppet.vm':
                ensure => present,
                user   => 'root',
                type   => 'ssh-rsa',
                key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDXMv9/TvrGXe9ll2siYiDnMVN0VzQ2+pK9uDVsv6KDQDo3SYUe1b+MEoF46VoLVLWq1rknGyHxLTS96bgBDaOesBDs+Rnfu32cf5BvScTsywRtocjdmuMkxMZ1zf1Ck2Ypu/XWtrOAi/HI5ljsVc7/HHBFKKFRYRePS2QdKBjlBaFAzVTbFPYaLCka/r5bXHeBbc8E5RvZZ16VeYgFQ0nEIfHpGyBGtZgaEW/M+ZrzbzYvpQ2ndz8lIYIELG+cjWIYUyHtx1qxwQwRL5Md362Pu/M1GbfSHvhzUTUODCSsHI2NpQJ1gxS3X7/OnBFaS9YVfVTCbbOfJe/fJlIUic1p',
        }
}
