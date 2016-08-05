node 'node.devincloud.club' {
    include '::panshi::role::installdocker'
    class {'panshi::role::emqtt-cluster':
      db_name => 'panshi',
      db_url => 'rdsdy2y7343byia9bdzj.mysql.rds.aliyuncs.com',
      db_uname => 'panshi',
      db_password => 'venusource',
      node_ip => '114.215.88.6',
      cluster_ip => '115.28.103.151',
    }
    class {'panshi::role::tengine':
      nginx_servers => ['115.28.103.151','114.215.88.6'],
      domainnames => ['api.devincloud.club', 'web.tanzhibang.cn'],
      credential_key => 'devincloud.key',
      credential_name => '1_www.devincloud.club_bundle.crt',
      logs => 'syslog',
    }
    class {'panshi::role::panshi':
      db_name => 'panshi',
      db_url => 'rdsdy2y7343byia9bdzj.mysql.rds.aliyuncs.com',
      db_uname => 'panshi',
      db_password => 'venusource',
      bucket_name => 'panshi',
      mqtt_ip => '115.28.103.151',
      image_tag => '0.0.1.ga11f481',
      rongcloud_key => 'cpj2xarljbvln',
      rongcloud_secret => 'YF0pTqjpjjXOt',
      logs => 'syslog',
    }
    class {'panshi::role::panshiweb':
      db_name => 'panshi',
      db_url => 'rdsdy2y7343byia9bdzj.mysql.rds.aliyuncs.com',
      db_uname => 'panshi',
      db_password => 'venusource',
      proxy_targeturl => 'api.devincloud.club',
      image_tag => '0.0.1.g47c0ee1',
      logs => 'syslog',
    }
}

node 'node2.example.com' {
    include '::panshi::role::installdocker'
    class {'panshi::role::emqtt-cluster':
      db_name => 'panshi',
      db_url => 'rdsdy2y7343byia9bdzj.mysql.rds.aliyuncs.com',
      db_uname => 'panshi',
      db_password => 'venusource',
      node_ip => '115.28.103.151',
      cluster_ip => '115.28.103.151,114.215.88.6',
    }
    class {'panshi::role::tengine':
      nginx_servers => ['115.28.103.151','114.215.88.6'],
      domainnames => ['api.devincloud.club', 'web.tanzhibang.cn'],
      credential_key => 'devincloud.key',
      credential_name => '1_www.devincloud.club_bundle.crt',
      logs => 'syslog',
    }
    class {'panshi::role::panshi':
      db_name => 'panshi',
      db_url => 'rdsdy2y7343byia9bdzj.mysql.rds.aliyuncs.com',
      db_uname => 'panshi',
      db_password => 'venusource',
      image_tag => '0.0.1.ga11f481',
      bucket_name => 'panshi',
      mqtt_ip => '115.28.103.151',
      rongcloud_key => 'cpj2xarljbvln',
      rongcloud_secret => 'YF0pTqjpjjXOt',
      logs => 'syslog',
    }
    class {'panshi::role::panshiweb':
      db_name => 'panshi',
      db_url => 'rdsdy2y7343byia9bdzj.mysql.rds.aliyuncs.com',
      db_uname => 'panshi',
      db_password => 'venusource',
      proxy_targeturl => 'api.devincloud.club',
      image_tag => '0.0.1.g47c0ee1',
      logs => 'syslog',
    }
}

node 'puppetmaster' {
    include '::panshi::role::installdocker'
    class {'panshi::role::emqtt-cluster':
      db_name => 'panshi_qa',
      db_url => 'rdsdy2y7343byia9bdzj.mysql.rds.aliyuncs.com',
      db_uname => 'panshi_qa',
      db_password => 'Venusource123',
      node_ip => '115.28.154.215',
    }
    class {'panshi::role::tengine':
      nginx_servers => ['115.28.154.215'],
      domainnames => ['www.tanzhibang.cn', 'webqa.tanzhibang.cn'],
      credential_key => 'tanzhibang.key',
      credential_name => '1_www.tanzhibang.cn_bundle.crt',
    }
    class {'panshi::role::panshi':
      db_name => 'panshi_qa',
      db_url => 'rdsdy2y7343byia9bdzj.mysql.rds.aliyuncs.com',
      db_uname => 'panshi_qa',
      db_password => 'Venusource123',
      image_tag => 'latest',
      bucket_name => 'panshi-qa',
      mqtt_ip => '115.28.154.215',
      rongcloud_key => '6tnym1brnz0r7',
      rongcloud_secret => '0Sa35kE87rNID0',
    }
    class {'panshi::role::panshiweb':
      db_name => 'panshi_qa',
      db_url => 'rdsdy2y7343byia9bdzj.mysql.rds.aliyuncs.com',
      db_uname => 'panshi_qa',
      db_password => 'Venusource123',
      proxy_targeturl => 'www.tanzhibang.com',
      image_tag => 'latest',
    }
}
